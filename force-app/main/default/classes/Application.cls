public class Application {
    public static final fflib_Application.UnitOfWorkFactory UnitOfWork = 
        new fflib_Application.UnitOfWorkFactory(
                new List<SObjectType>{
                    Expense__c.SObjectType,
                    Employee_on_Trip__c.SObjectType,
                    Expense_Distribution__c.SObjectType
                }
        );

    public static final fflib_Application.ServiceFactory Service = 
        new fflib_Application.ServiceFactory(
                new Map<Type, Type>{
                    IExpensesService.class => ExpensesServiceImpl.class,
                    IExpensesDistributionService.class => ExpensesDistributionServiceImpl.class
                }
        );

    public static final fflib_Application.SelectorFactory Selector = 
                new fflib_Application.SelectorFactory(
                    new Map<SObjectType, Type> {
                        Expense__c.SObjectType => ExpensesSelector.class,
                        Expense_Distribution__c.SObjectType => ExpensesDistributionSelector.class,
                        Employee_On_Trip__c.SObjectType => EmployeesOnTripsSelector.class
                     });

    public static final fflib_Application.DomainFactory Domain = 
                new fflib_Application.DomainFactory(
                    Application.Selector,
                    new Map<SObjectType, Type> {
                        Expense__c.SObjectType => Expenses.Constructor.class,
                        Employee_On_Trip__c.SObjectType => EmployeesOnTrips.Constructor.class,
                        Expense_Distribution__c.SObjectType => ExpensesDistribution.Constructor.class
                    }
                );
}