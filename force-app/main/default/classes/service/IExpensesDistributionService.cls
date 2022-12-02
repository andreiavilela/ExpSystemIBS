public interface IExpensesDistributionService
{
    List<Expense_Distribution__c> getExpDistributionByExpenseId(Set<Id> idSet);
    void deleteSelectedExpenses(List<Expense_Distribution__c> expenseLst);
    void updateExpenses(List<Expense_Distribution__c> data);
}