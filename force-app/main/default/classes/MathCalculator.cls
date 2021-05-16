public class MathCalculator {
    
    private static void add(Integer a,Integer b){
        Integer c = a+b;
        printOutput(c);
    }
    
    private static void divide(Integer e,Integer f){
        Integer d = e/f;
        printOutput(d);
    }

    private static void subtract(Integer h,Integer i){
        Integer k = h-i;
        printOutput(k);
    }
    
    private static void printOutput(Integer g)
    {
        System.debug('g=' + g); 
    }

    public static void doMath(){
    	add(2,3);
        divide(4,2);
        subtract(4,2);
    }
}