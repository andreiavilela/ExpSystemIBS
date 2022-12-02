import { LightningElement, track, api } from 'lwc';
import getExpenses from '@salesforce/apex/ExpensesController.getExpenses';

export default class ExpensesInformation extends LightningElement {

    @api recordId;
    @track expenses;
    @track error;

    connectedCallback() {
        getExpenses({recordId: this.recordId})
            .then(result => {
                this.expenses = result;
                this.error = undefined;
            })
            .catch(error => {
                this.error = error;
                this.expenses = undefined;
            }); 
    }
}