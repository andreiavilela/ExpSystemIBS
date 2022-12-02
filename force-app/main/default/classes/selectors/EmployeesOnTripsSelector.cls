public class EmployeesOnTripsSelector extends fflib_SObjectSelector 
    implements IEmployeesOnTripsSelector
{
    public static IEmployeesOnTripsSelector newInstance()
    {
        return (IEmployeesOnTripsSelector) Application.Selector.newInstance(Employee_On_Trip__c.SObjectType);
    }

    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
            Employee_On_Trip__c.Id,
            Employee_On_Trip__c.Name,
            Employee_On_Trip__c.Employee__c,
            Employee_On_Trip__c.Trip__c
        };
    }

    public Schema.SObjectType getSObjectType() {
        return Employee_On_Trip__c.SObjectType;
    }

    public List<Employee_On_Trip__c> selectById(Set<Id> idSet){
        return (List<Employee_On_Trip__c>) selectSObjectsById(idSet);
    }

    public List<Employee_On_Trip__c> selectByTripId(Set<Id> idSet)
    {
        fflib_QueryFactory employeesOnTripQueryFactory = newQueryFactory();
        return (List<Employee_On_Trip__c>) Database.query(
            employeesOnTripQueryFactory.setCondition('Trip__c in :idSet').toSOQL());
    }

}