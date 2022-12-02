public interface IExpensesSelector extends fflib_ISObjectSelector
{
    List<Expense__c> selectById(Set<Id> idset);
}