public interface IEmployeesOnTripsSelector extends fflib_ISObjectSelector
{
  List<Employee_On_Trip__c> selectById(Set<Id> idSet);
  List<Employee_On_Trip__c> selectByTripId(Set<Id> idSet);
}