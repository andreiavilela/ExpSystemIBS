public class ExpensesServiceImpl 
    implements IExpensesService
{
     public void createExpenseDistribution(List<Expense__c> expensesLst)
     {
        fflib_ISObjectUnitOfWork uow = Application.UnitOfWork.newInstance();

        Set<Id> tripIds = new Set<Id>();
        for(Expense__c ex : expensesLst) 
        {
            tripIds.add(ex.Trip__c);
        }
        System.debug('tripIds ' + tripIds);
        Map<Id, List<Employee_on_Trip__c>> employeesOnTripByTrip = new Map<Id, List<Employee_on_Trip__c>>();
        
        IEmployeesOnTrips eots = 
			EmployeesOnTrips.newInstance(
				EmployeesOnTripsSelector.newInstance().selectByTripId(tripIds));
        //employees on trip per expense
        for(Employee_on_Trip__c eot : (List<Employee_On_Trip__c>) eots.getRecords()) {
            System.debug('here!!!');
            if(!employeesOnTripByTrip.containsKey(eot.Trip__c)) {
                List<Employee_on_Trip__c> newLst = new List<Employee_on_Trip__c>();
                newLst.add(eot);
                employeesOnTripByTrip.put(eot.Trip__c, newLst);
                
            } else {
                if(!employeesOnTripByTrip.get(eot.Trip__c).contains(eot)) {
                    employeesOnTripByTrip.get(eot.Trip__c).add(eot);
                }
            }
        }
        
        System.debug('employeesOnTripByTrip ' + employeesOnTripByTrip);
        
        Integer totalParticipants = 0;
        for(Expense__c exp : expensesLst) {
            for(Employee_on_Trip__c eont : employeesOnTripByTrip.get(exp.Trip__c)) {
                totalParticipants++;
            }
            
        }
        for(Expense__c ex : expensesLst) {
            System.debug('ex.Trip__c ' + ex.Trip__c);
            System.debug('employeesOnTripByTrip.get(ex.Trip__c) ' + employeesOnTripByTrip.get(ex.Trip__c));
            for(Employee_on_Trip__c eot : employeesOnTripByTrip.get(ex.Trip__c)) {
                System.debug('here');
                Expense_Distribution__c ed = new Expense_Distribution__c();
                ed.Expense__c = ex.Id;
                ed.Employee__c = eot.Employee__c ;
                ed.Amount__c = ((ex.Cost__c)/totalParticipants).setScale(2);
                ed.Paid_Amount__c = 0;
                
                uow.registerNew(ed);
            }
        }
        uow.commitWork();
     }

     public List<Expense__c> getExpensesById(Set<Id> idSet)
     {
        return ExpensesSelector.newInstance().selectById(idSet);
     }
}