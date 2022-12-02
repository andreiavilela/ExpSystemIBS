public class ExpensesDistribution extends fflib_SObjectDomain 
    implements IExpensesDistribution 
{
    public static IExpensesDistribution newInstance(List<Expense_Distribution__c> recordList)
    {
        return (IExpensesDistribution) Application.Domain.newInstance(recordList);
    }

    public static IExpensesDistribution newInstance(Set<Id> idSet)
    {
        return (IExpensesDistribution) Application.Domain.newInstance(idSet);
    }

    public ExpensesDistribution(List<Expense_Distribution__c> sObjectList) 
    {
        super(sObjectList);
    }

    public class Constructor implements fflib_SObjectDomain.IConstructable{
        public fflib_SObjectDomain construct(List<SObject> sObjectList){
            return new ExpensesDistribution(sObjectList);
        }
    }

}