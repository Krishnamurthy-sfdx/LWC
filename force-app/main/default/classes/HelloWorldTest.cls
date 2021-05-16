@isTest
public class HelloWorldTest {

    @isTest static void updateLead(){
        //Test code goes here
        Lead myLead = new Lead();
        myLead.FirstName = 'David';
        myLead.LastName = 'Liu';
        myLead.Company = 'Google';
        insert myLead;
        update myLead;
    }
}