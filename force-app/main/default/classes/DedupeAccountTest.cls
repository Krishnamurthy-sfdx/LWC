@isTest
public class DedupeAccountTest {

    @isTest static void DedupeAccount(){
        Account acc = new Account();{
            acc.Name = 'Kolumam';
            insert acc;
        }
    }
}