public class Expenses extends fflib_SObjectDomain 
    implements IExpenses
{
    public static IExpenses newInstance(List<Expense__c> recordList)
    {
        return (IExpenses) Application.Domain.newInstance(recordList);
    }

    public static IExpenses newInstance(Set<Id> idSet)
    {
        return (IExpenses) Application.Domain.newInstance(idSet);
    }

    public Expenses(List<Expense__c> sObjectList) 
    {
        super(sObjectList);
    }

    public class Constructor implements fflib_SObjectDomain.IConstructable{
        public fflib_SObjectDomain construct(List<SObject> sObjectList){
            return new Expenses(sObjectList);
        }

    }

}