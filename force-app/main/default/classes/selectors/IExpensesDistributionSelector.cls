public interface IExpensesDistributionSelector extends fflib_ISObjectSelector
{
    List<Expense_Distribution__c> selectByExpenseId(Set<Id> idSet);
}