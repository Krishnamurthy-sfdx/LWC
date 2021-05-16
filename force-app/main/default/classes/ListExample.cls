public class ListExample {
	
    public static void listnew(){
        
    List<Opportunity> oppslist = new List<Opportunity>();
   
     for(Opportunity opps: [SELECT Id, Name FROM Opportunity])
    //colors.add('orange');
    //colors.add('purple');
    oppslist.add(opps);
    System.debug(oppslist[0]);
    
    }
}