public interface IExpensesService {
  void createExpenseDistribution(List<Expense__c> expensesLst);
  List<Expense__c> getExpensesById(Set<Id> idSet);
}