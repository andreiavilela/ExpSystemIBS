public with sharing class ExpensesController
{
    @AuraEnabled(cacheable=true)
    public static List<Expense__c> getExpenses(Id recordId){
            return ExpensesService.getExpensesById(
                new Set<Id>{recordId});
    }
}