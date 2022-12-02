public class ExpensesDistributionSelector extends fflib_SObjectSelector
    implements IExpensesDistributionSelector
{
    public static IExpensesDistributionSelector newInstance()
    {
        return (IExpensesDistributionSelector) Application.Selector.newInstance(Expense_Distribution__c.SObjectType);
    }

    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
            Expense_Distribution__c.Id,
            Expense_Distribution__c.Name,
            Expense_Distribution__c.Expense__c,
            Expense_Distribution__c.Employee__c,
            Expense_Distribution__c.Amount__c,
            Expense_Distribution__c.Number__c,
            Expense_Distribution__c.Paid__c,
            Expense_Distribution__c.Paid_Amount__c
        };
    }

    public Schema.SObjectType getSObjectType() {
        return Expense_Distribution__c.SObjectType;
    }

    public List<Expense_Distribution__c> selectByExpenseId(Set<Id> idSet)
    {
        fflib_QueryFactory expenseDistributionQueryFactory = newQueryFactory();
        return (List<Expense_Distribution__c>) Database.query(
            expenseDistributionQueryFactory.selectField('Employee__r.First_Name__c').selectField('Employee__r.Last_Name__c').setCondition('Expense__c in :idSet').toSOQL());
    }

}