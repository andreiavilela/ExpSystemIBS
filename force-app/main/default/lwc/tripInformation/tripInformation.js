import { LightningElement, api, wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import EXPENSE_OBJECT from '@salesforce/schema/Expense__c';
import TRIP_NAME from '@salesforce/schema/Expense__c.Trip__r.Name';
import TRIP_DESIGNATION from '@salesforce/schema/Expense__c.Trip__r.Designation__c';
import TRIP_DESCRIPTION from  '@salesforce/schema/Expense__c.Trip__r.Description__c';
import TRIP_START_DATE from '@salesforce/schema/Expense__c.Trip__r.Start_Date__c';
import TRIP_END_DATE from '@salesforce/schema/Expense__c.Trip__r.End_Date__c';
import TRIP_TOTAL_COST from  '@salesforce/schema/Expense__c.Trip__r.Total_Cost__c';
import TRIP_TOTAL_PARTICIPANTS from '@salesforce/schema/Expense__c.Trip__r.Total_Participants__c';
import TRIP_TOTAL_DAYS from  '@salesforce/schema/Expense__c.Trip__r.Total_Days__c';
import TRIP_TOTAL_VACATION_DAYS_REQUIRED from  '@salesforce/schema/Expense__c.Trip__r.Total_Vacation_Days_Required__c';

export default class TripInformation extends LightningElement {
    objectApiName = EXPENSE_OBJECT;

    @api recordId;
    @api objectApiName; 

    
    @wire(getRecord, {
        recordId: "$recordId",
        fields: [ TRIP_NAME, TRIP_DESIGNATION, TRIP_DESCRIPTION, 
            TRIP_START_DATE, TRIP_END_DATE, 
            TRIP_TOTAL_COST, TRIP_TOTAL_PARTICIPANTS, TRIP_TOTAL_DAYS, TRIP_TOTAL_VACATION_DAYS_REQUIRED]
      })
      record;

      get tripName(){
          return getFieldValue(this.record.data, TRIP_NAME);
    }
      get tripDesignation() {
        return getFieldValue(this.record.data, TRIP_DESIGNATION);
    }
      get tripDescription(){
        return getFieldValue(this.record.data, TRIP_DESCRIPTION);
    }
    get tripStartDate(){
        return getFieldValue(this.record.data, TRIP_START_DATE);
    }
    get tripEndDate(){
        return getFieldValue(this.record.data, TRIP_END_DATE);
    }
    get tripTotalCost(){
        return getFieldValue(this.record.data, TRIP_TOTAL_COST);
    }
    get tripTotalParticipants(){
        return getFieldValue(this.record.data, TRIP_TOTAL_PARTICIPANTS);
    }
    get tripTotalDays(){
        return getFieldValue(this.record.data, TRIP_TOTAL_DAYS);
    }
    get tripTotalVacationDaysRequired(){
        return getFieldValue(this.record.data, TRIP_TOTAL_VACATION_DAYS_REQUIRED);
    }
    
}