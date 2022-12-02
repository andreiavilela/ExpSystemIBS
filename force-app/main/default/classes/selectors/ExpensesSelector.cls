public class ExpensesSelector extends fflib_SObjectSelector 
    implements IExpensesSelector
{
    
    public static IExpensesSelector newInstance()
    {
        return (IExpensesSelector) Application.Selector.newInstance(Expense__c.SObjectType);
    }

    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
            Expense__c.Id,
            Expense__c.Name,
            Expense__c.Cost__c,
            Expense__c.Description__c,
            Expense__c.Number__c,
            Expense__c.Responsible__c,
            Expense__c.Status__c,
            Expense__c.Total_Employees_on_Trip__c,
            Expense__c.Total_Paid_Amount__c,
            Expense__c.Total_Unpaid_Employees__c,
            Expense__c.Trip__c
        };
    }
    
    public Schema.SObjectType getSObjectType() {
        return Expense__c.SObjectType;
    }
    
    public List<Expense__c> selectById(Set<Id> idSet) {
        return (List<Expense__c>) selectSObjectsById(idSet);
    }
}