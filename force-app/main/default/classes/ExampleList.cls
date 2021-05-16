public class ExampleList {
    
    public static void ListMethod()
    {
        List<String> colors = new List<String>{'red', 'orange', 'grey'}; 
            for(Integer i=0;i<colors.size();i++)
        {
            String hello = colors[i];
            system.debug('hello'+ hello);
            
        }
        colors.add('blue');
        string somerandomcolor = colors[2];
        string somerandomcolor2 = colors.get(1);
        system.debug('colors ' + colors);
        system.debug('somerandomcolor ' + somerandomcolor);
        system.debug('somerandomcolor2 ' + somerandomcolor2);
        Set<String> setcolors = new Set<String>{'blue', 'grey', 'pink'};
            setcolors.add('yellow');
        system.debug('setcolors ' + setcolors);
    }
    
    public static void mapMethod(){
        
        Map<String, String> country = new Map<String, String>();
        country.put('Singapore', 'SG');
        country.put('India', 'IN');
        system.debug(country.keyset());
        system.debug('values ' + country.get('Singapore'));
        
        Map<Id, String> acc = new  Map<Id, String>();
	    List<Account> abb =  [SELECT Id, Name FROM Account];
        for(Account a : abb)
        {
            acc.put(a.Id, a.Name);
            system.debug('acc' + acc);
        }
    }}