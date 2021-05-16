@isTest
private class TestVerifyDate {

 
    @IsTest static void testCheckDates()
    {
        datetime newdate = VerifyDate.CheckDates(Date.newInstance(2020, 2, 29),Date.newInstance(2020, 3, 3));
        //System.assertEquals(Date.newInstance(2020,3,3), newdate);
        datetime newdate1 = VerifyDate.CheckDates(Date.newInstance(2020, 2, 29),Date.newInstance(2020, 4, 3));
       
    }
    
   /* @IsTest static void testnewDates()
    {
     datetime newdate2 = VerifyDate.DateWithin30Days(Date.newInstance(2020, 3, 3),Date.newInstance(2020, 3, 3));
    }
    
    //@IsTest static void testEndofMonth()
    {
        datetime eom = VerifyDate.SetEndofMonthDate(Date.newInstance(2020, 3, 22));
    }
    
    */
}