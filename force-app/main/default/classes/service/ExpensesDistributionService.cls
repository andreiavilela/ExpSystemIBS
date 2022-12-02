public with sharing class ExpensesDistributionService {
    
    public static List<Expense_Distribution__c> getExpDistributionByExpenseId(Set<Id> idSet)
    {
     return service().getExpDistributionByExpenseId(idSet);
    }

    public static void deleteSelectedExpenses(List<Expense_Distribution__c> expenseLst)
    {
        service().deleteSelectedExpenses(expenseLst);
    }

    public static void updateExpenses(List<Expense_Distribution__c> data)
    {
        service().updateExpenses(data);
    }

    private static IExpensesDistributionService service()
    {
    return (IExpensesDistributionService) Application.Service.newInstance(IExpensesDistributionService.class);
	}
}