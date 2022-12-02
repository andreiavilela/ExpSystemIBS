public with sharing class ExpenseDistributionController {
    @AuraEnabled(cacheable=true)
    public static List<Expense_Distribution__c> getExpensesDistribution(Id recordId)
    {
        return ExpensesDistributionService.getExpDistributionByExpenseId(
                new Set<Id>{recordId});
    }
    
    @AuraEnabled
    public static void deleteSelectedExpenses(List<Expense_Distribution__c> expenseLst) {
        ExpensesDistributionService.deleteSelectedExpenses(expenseLst);
    }
    
    @AuraEnabled
    public static void updateExpenses(Object data) 
    {
        List<Expense_Distribution__c> expensesForUpdate = (List<Expense_Distribution__c>) JSON.deserialize(
         JSON.serialize(data),
         List<Expense_Distribution__c>.class);
        
        ExpensesDistributionService.updateExpenses(expensesForUpdate);
    }
}