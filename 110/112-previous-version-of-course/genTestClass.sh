#!/bin/bash
# PMC
# generate tests for assignment 3

class=TestAssign3
fn=$class.java
today=$(date +%F)

cat > $fn << START
/**
* app class generated to test
* assignment 3 420-112-dw 2016
* PMCampbell
* $today
**/
public class $class {
  public static void main(String[] args) {
  String file;
  int sum;
START

for i in S*java
do
  code=$(echo $i |cut -d \. -f 1)
  cat >> $fn << SUMTEST
  // testing $code
  file="$code"; 
  System.out.println("\n\ntesting "+file); 
  System.out.println("sumDigits() "); 
  if ((sum = $code.sumDigits(15)) == 6)
        System.out.print( "test1 ok " );
   else
        System.out.print( "test1 bad: "+sum + " " );
  if ((sum = $code.sumDigits(12345)) == 15)
        System.out.print( "test2 ok " );
   else
        System.out.print( "test2 bad: "+sum + " " );
  if ((sum = $code.sumDigits(5)) == 5)
        System.out.print( "test3 ok " );
   else
        System.out.print( "test3 bad: "+sum  + " " );
   System.out.println("\nisValidSin()");
   if ($code.isValidSin(26))
        System.out.print( "test1 ok " );
   else
           System.out.print( "test1 bad ");
   if (!$code.isValidSin(123456225))
        System.out.print( "test2 ok " );
   else
        System.out.print( "test2 bad ");
  
SUMTEST
done
cat >> $fn << END
  } // main()
} // TestAssign3
END
                                 
