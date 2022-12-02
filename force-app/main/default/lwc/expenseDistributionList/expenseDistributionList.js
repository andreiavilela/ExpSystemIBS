import { api, LightningElement } from 'lwc';
import getExpensesDistribution from '@salesforce/apex/ExpenseDistributionController.getExpensesDistribution';
import updateExpenses from '@salesforce/apex/ExpenseDistributionController.updateExpenses';
import deleteSelectedExpenses from '@salesforce/apex/ExpenseDistributionController.deleteSelectedExpenses';
import { refreshApex } from '@salesforce/apex';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { getRecordNotifyChange } from 'lightning/uiRecordApi';
import { NavigationMixin } from 'lightning/navigation';

const COLS = [
    {
        label: 'Name', fieldName: 'linkName', type: 'url',
        typeAttributes: {
            label: { fieldName: 'Name' }, target: '_blank',
            tooltip: { fieldName: 'Name' }
        }
    },
    {
        label: 'Employee', fieldName: 'linkEmployee', type: 'url',
        typeAttributes: {
            label: { fieldName: 'EmployeeName' }, target: '_blank',
            tooltip: { fieldName: 'EmployeeName' }
        }
    },
    { label: 'Amount', fieldName: 'Amount__c', editable: true },
    {
        label: 'Paid Amount', fieldName: 'Paid_Amount__c',
        editable: true, cellAttributes: {
            class: { fieldName: 'paidAmountColor' }
        }
    },
    { label: 'Paid', fieldName: 'Paid__c', type: 'boolean' }
];

export default class ExpenseDistributionList extends NavigationMixin(LightningElement) {
    @api record;
    columns = COLS;
    draftValues = [];
    expensedistribution;
    error;
    isCssLoaded = false;
    showFields = false;

    connectedCallback() {
        getExpensesDistribution({ recordId: this.record })
            .then((result) => {
                this.expensedistribution = result;
                let tempRecs = [];
                result.forEach((record) => {
                    let tempRec = Object.assign({}, record);
                    tempRec.paidAmountColor = tempRec.Paid_Amount__c < tempRec.Amount__c ? "slds-text-color_error" : "slds-text-color_success";
                    tempRec.linkName = '/' + tempRec.Id;
                    tempRec.linkEmployee = '/' + tempRec.Employee__c;
                    tempRec.EmployeeName = tempRec.Employee__r.First_Name__c + ' ' + tempRec.Employee__r.Last_Name__c;
                    tempRecs.push(tempRec);

                });
                this.expensedistribution = tempRecs;
                this.error = undefined;
            })
            .catch((error) => {
                this.error = error;
                this.expensedistribution = undefined;
            });
    }

    async handleSave(event) {
        const updatedFields = event.detail.draftValues;

        const notifyChangeIds = updatedFields.map((row) => {
            return { record: row.Id };
        });
        
        try {
            const result = await updateExpenses({ data: updatedFields });
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Expense Distribution updated',
                    variant: 'success'
                })
            );
            getRecordNotifyChange(notifyChangeIds);

            await refreshApex(this.expensedistribution);

            this.draftValues = [];
        } catch (error) {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error updating records',
                    variant: 'error'
                })
            );
        };
    }

    getSelectedRecords(event) {
        const selectedRows = event.detail.selectedRows;
        this.recordsCount = event.detail.selectedRows.length;
        this.selectedRecords = new Array();
        for (let i = 0; i < selectedRows.length; i++) {
            this.selectedRecords.push(selectedRows[i]);
        }
    }

    deleteRecords() {
        if (this.selectedRecords) {
            this.buttonLabel = 'Processing....';
            this.isTrue = true;
            deleteSelectedExpenses({ expenseLst: this.selectedRecords }).then(result => {
                this.buttonLabel = 'Delete Records';
                this.isTrue = false;
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success!!',
                        message: this.recordsCount + ' records are deleted.',
                        variant: 'success'
                    }),
                );
                this.template.querySelector('lightning-datatable').selectedRows = [];
                this.recordsCount = 0;
                return refreshApex(this.expensedistribution);
            }).catch(error => {
                this.buttonLabel = 'Delete Records';
                this.isTrue = false;
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error while getting Expenses',
                        message: JSON.stringify(error),
                        variant: 'error'
                    }),
                );
            });
        }
    }

    distributeExpense() {
        this.showFields = !this.showFields;
    }
}