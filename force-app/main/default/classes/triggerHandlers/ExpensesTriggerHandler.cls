public class ExpensesTriggerHandler extends fflib_SObjectDomain{
    public ExpensesTriggerHandler(List<Expense__c> sObjectList)
	{
		super(sObjectList);
	}

    public override void onAfterInsert()
    {
			ExpensesService.createExpenseDistribution(this.records);
    }

    public class Constructor implements fflib_SObjectDomain.IConstructable
	{
		public fflib_SObjectDomain construct(List<SObject> sObjectList)
		{
			return new ExpensesTriggerHandler(sObjectList);
		}
	}
}