public with sharing class EmployeesOnTrips extends fflib_SObjects
	implements IEmployeesOnTrips
{

	public static IEmployeesOnTrips newInstance(List<Employee_On_Trip__c> recordList)
	{
		return (IEmployeesOnTrips) Application.Domain.newInstance(recordList);
	}
	
	public static IEmployeesOnTrips newInstance(Set<Id> recordIdSet)
	{
		return (IEmployeesOnTrips) Application.Domain.newInstance(recordIdSet);
	}
	
	public EmployeesOnTrips(List<Employee_On_Trip__c> sObjectList)
	{
		super(sObjectList, Schema.Employee_On_Trip__c.SObjectType);
	}

	public List<Employee_On_Trip__c> getEmployeesOnTrips()
	{
		return (List<Employee_On_Trip__c>) getRecords();
	}

	public class Constructor implements fflib_IDomainConstructor
	{
		public fflib_SObjects construct(List<Object> objectList)
		{
			return new EmployeesOnTrips((List<SObject>) objectList);
		}
	}
}