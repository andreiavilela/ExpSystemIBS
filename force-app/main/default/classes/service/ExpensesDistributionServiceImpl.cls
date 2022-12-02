public class ExpensesDistributionServiceImpl 
    implements IExpensesDistributionService
{
    public List<Expense_Distribution__c> getExpDistributionByExpenseId(Set<Id> idSet)
    {
       return ExpensesDistributionSelector.newInstance().selectByExpenseId(idSet);
    }

    public void deleteSelectedExpenses(List<Expense_Distribution__c> expenseLst)
    {
        fflib_ISObjectUnitOfWork uow = Application.UnitOfWork.newInstance();

        IExpensesDistribution expensesD = (IExpensesDistribution) Application.Domain.newInstance(expenseLst);

        uow.registerDeleted(expensesD.getRecords());
        uow.commitWork();
    }

    public void updateExpenses(List<Expense_Distribution__c> data)
    {
	    fflib_ISObjectUnitOfWork uow = Application.UnitOfWork.newInstance();

        IExpensesDistribution expensesD = (IExpensesDistribution) Application.Domain.newInstance(data);

        uow.registerDirty(expensesD.getRecords());
        uow.commitWork();
    }
}