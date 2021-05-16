public class StringArrayTest {

    public static List<String> generateStringArray(Integer n){
		List<String> mylist = new List<String>();
          for(Integer i = 0; i <n; i++)
          {  
              myList.add('Test ' +i); 
            }
        System.debug(mylist);
        System.debug(mylist.size());
        	
      return mylist;  
    }
    
}