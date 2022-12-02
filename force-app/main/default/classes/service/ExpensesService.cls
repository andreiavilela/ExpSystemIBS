public with sharing class ExpensesService {
  
  public static void createExpenseDistribution(List<Expense__c> expensesLst)
  {
      service().createExpenseDistribution(expensesLst);
  }

  public static List<Expense__c> getExpensesById(Set<Id> idSet)
  {
     return service().getExpensesById(idSet);
  }

	private static IExpensesService service()
  {
    return (IExpensesService) Application.Service.newInstance(IExpensesService.class);
	} 
}