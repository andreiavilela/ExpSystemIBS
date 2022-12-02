trigger ExpenseAfterInsert on Expense__c (after insert) {
  fflib_SObjectDomain.triggerHandler(ExpensesTriggerHandler.class);
}