Q1 -constraint to generate the below pattern 7 17 27 37 47 57 67 ?////////////////
class main;
  rand bit [5:0] arr[];
  constraint c1 { arr.size() == 7;
    foreach (arr[i])
      if (i==0)
	  a[i]==7;
	  else a[i]==a[i-1]+10;
    }
  function void print();
    $display("arr=%p",arr);
  endfunction
endclass

module tb;
  main m;
  initial begin
    m= new();
      m.randomize();
      m.print();
  end
endmodule
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Q1 -constraint to generate the below pattern 5 10 15 20 25 30 ?////////////////
class main;
  rand bit [5:0] arr[];
  constraint c1 { arr.size() == 6;
    foreach (arr[i])
      if (i==0)
        arr[i]==5;
                 else arr[i]==arr[i-1]+5;
    }
  function void print();
    $display("arr=%p",arr);
  endfunction
endclass

module tb;
  main m;
  initial begin
    m= new();
      m.randomize();
      m.print();
  end
endmodule
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: arr='{5, 10, 15, 20, 25, 30}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Q -constraint to generate the below pattern 1 2 3 4 5 4 3 2 1  ?
class main;
  rand bit [5:0] arr[$];
  constraint c1 { arr.size() == 10; }
  function void post_randomize();
    int i;
    for (i = 0; i < arr.size(); i++) begin
      if (i < 5)
        arr[i] = arr[i - 1] + 1;
      else if (i == 5)
        arr[i] = 5;
      else
        arr[i] = arr[i - 1] - 1;
    end
  endfunction
  
  function void print();
    $display("arr=%p", arr);
  endfunction
endclass

module tb;
  main m;
  initial begin
    m = new();
    if (!m.randomize())
      $display("Randomization failed!");
    m.print();
  end
endmodule
/////////////////////////////////////////////////////////////////////////////////
Q -constraint to generate the below pattern 1 1 2 2 3 3 4 4 5 5 ?
class example1;
rand int da[];
constraint a_size{da.size == 10;}
constraint a_size1{da[0] == 1;}
constraint a_value{foreach (da[i])
if(i%2==0)
da[i]==da[i+1];
                   else if(i%2 ==1 && i<(da.size-1))
da[i+1]==da[i]+1;
 }
function void post_randomize();
$display("The result is: %p",da);
endfunction
endclass

module tb;
  example1 m;
  initial begin
    m= new();
      m.randomize();
      
  end
endmodule
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Q -constraint to generate the below pattern 1 2 3 4 5 6 7 8 9  ?
class main;
  rand bit [6:0] arr[];
  constraint c1 { arr.size() ==9;
    foreach (arr[i])
      if (i==0)
        arr[i]==1;
                 else arr[i]==arr[i-1]+1;
    }
  function void print();
    $display("arr=%p",arr);
  endfunction
endclass

module tb;
  main m;
  initial begin
    m= new();
      m.randomize();
      m.print();
  end
endmodule
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Q -constraint to generate the below pattern 0 1 0 1 0 1 0 1   ?
class zero_to_one;
  rand int da[];
  
  constraint a_value {da.size == 8;}
  constraint value {foreach (da[i])
    if (i%2==0)
      da[i]== 0;
  else if (i%2==1)
      da[i]==1;
                   }
endclass               
module top;
  zero_to_one pkt;
  initial
  begin
    
    pkt = new();
    pkt.randomize();
    $display("The result is: %p",pkt.da);
  end
endmodule
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: The result is: '{0, 1, 0, 1, 0, 1, 0, 1}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Q -There is an 8 bit vector (bit[7:0] data_in) which takes some random value. 
Write a constraint in such a way that every time it is randomized, total no of ones should be 1 using $countone system task?
class tb;
  rand bit [7:0] data;
  constraint c1 { $countones(data)==1;}
endclass
module test;
tb tb1;
  initial
    begin
      tb1=new();
      repeat(10)
        begin
        tb1.randomize();
          $display("data = %b",tb1.data);
        end 
    end
endmodule
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: data = 00000001
# KERNEL: data = 01000000
# KERNEL: data = 00000001
# KERNEL: data = 00000001
# KERNEL: data = 00001000
# KERNEL: data = 01000000
# KERNEL: data = 01000000
# KERNEL: data = 10000000
# KERNEL: data = 00001000
# KERNEL: data = 00000001
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Q -Generate 7-bit random number with only one bit set (should not use $countones).
class tb;
  rand bit [7:0] data;
  rand bit [4:0] shift;
  constraint c1 { data ==1 << shift;}  // data =1 means 01 then its left shift
endclass
module test;
tb tb1;
  initial
    begin
      tb1=new();
      
      repeat(5)
        begin
        tb1.randomize();
          $display("data = %b",tb1.data);
        end
    end
endmodule
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: data = 00010000
# KERNEL: data = 00000010
# KERNEL: data = 00000001
# KERNEL: data = 01000000
# KERNEL: data = 00000010

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Q -Generate 7-bit random number with only 2 bit set (should not use $countones).
class tb;
  rand bit [7:0] data;
  rand bit [4:0] shift;
  constraint c1 { data ==5 << shift;}  // data =5 means 101 then its left shift
endclass
module test;
tb tb1;
  initial
    begin
      tb1=new();
      
      repeat(5)
        begin
        tb1.randomize();
          $display("data = %b",///////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: data = 00101000
# KERNEL: data = 00101000
# KERNEL: data = 00010100
# KERNEL: data = 00000101
# KERNEL: data = 10100000
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Q -Generate 7-bit random number with consecutive 3 bit high (should not use $countones).
class tb;
  rand bit [7:0] data;
  rand bit [4:0] shift;
  constraint c1 { data ==7 << shift;}  // data =7 means 111 then its left shift
endclass
module test;
tb tb1;
  initial
    begin
      tb1=new();
      
      repeat(5)
        begin
        tb1.randomize();
          $display("data = %b",tb1.data);
        end
    end
endmodule
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: data = 00111000
# KERNEL: data = 00111000
# KERNEL: data = 00011100
# KERNEL: data = 00000111
# KERNEL: data = 11100000
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class tb;
  rand bit [7:0] data;
  constraint c1 { $countones(data)==5;}  //total no of ones should be 5
endclass
module test;
tb tb1;
  initial
    begin
      tb1=new();
      
      repeat(10)
        begin
        tb1.randomize();
          $display("data = %b",tb1.data);
        end
    end
endmodule
////////////////////////////////////////////////////////////////////
# KERNEL: data = 10011101
# KERNEL: data = 10011011
# KERNEL: data = 00101111
# KERNEL: data = 01110110
# KERNEL: data = 00111110
# KERNEL: data = 11101010
# KERNEL: data = 01110011
# KERNEL: data = 10110110
# KERNEL: data = 10110011
# KERNEL: data = 01011101
/////////////////////////////////////////////////////////////////
Q2 -Write a code to generate a random number between 1.35 to 2.57  ? //////////////////
class random_number_constraint;
  rand int b;
 real num;
  constraint my_constraint {
    b inside {[135:257]};
  }
  function void post_randomize();
 num = b/100.0;
 endfunction
endclass

module top;
  random_number_constraint rand_num;
  initial begin
    // Create a new random number generator
    rand_num = new();
    repeat(5)begin
    // Generate a random number between 1.35 and 2.57
    rand_num.randomize();
    // Print the generated random number
      $display("Random number: %0d and num=%0f", rand_num.b,rand_num.num);
  end
  end
endmodule
//////////////////////////////////////////
Q3 -Write a code to generate even and odd random_number with_constraint  ? 
///////////////////////////////////
class main;
  randc bit [5:0] a;
  randc bit [5:0] b;
  constraint c1 {a%2==0;
                  b%2==1; }
  function void print();
    $display("even=%0d and odd =%0d",a,b);
  endfunction
endclass

module tb;
  main m;
  initial begin
    m= new();
	repeat(5) begin
    m.randomize();
    m.print();
	end
  end
endmodule
/////////////////////////////////////////////////////////
# even=24 and odd =63
# even=44 and odd =51
# even=4 and odd =59
# even=42 and odd =5
# even=2 and odd =13
/////////////////////////////////////////////////////////////////////
 Q -Write a of Constraint to generate bit[7:0] array1[10] with unique values and also multiple of 3 ?
 class main;
 rand bit [7:0] arr[10];
  constraint c1 { 
    unique { arr };
    foreach (arr[i]) {
      arr[i] % 3 == 0;              
    }
  }
  function void print();
    $display("arr=%p",arr);
  endfunction
endclass

module tb;
  main m;
  initial begin
    m= new();
      m.randomize();
      m.print();
  end
endmodule
////////////////////////////////////////////////////////////////////////
# KERNEL: arr='{213, 165, 174, 3, 255, 120, 231, 33, 42, 90}
////////////////////////////////////////////////////////////////////
Q4-Write a code to generate even number b/w 1 to 100 random_number with_constraint  ? 
//////////////////////////////////////////////////////////
class main;
  randc bit [5:0] a;
  constraint c1 { a inside{[1:100]};
                      a%2==0;
                   }
  function void print();
    $display("even=%0d ",a);
  endfunction
endclass

module tb;
  main m;
  initial begin
    m= new();
	repeat(10) begin
    m.randomize();
    m.print();
	end
  end
endmodule
/////////////////////////////////
# even=30
# even=46
# even=50
# even=16
# even=6
# even=20
# even=36
# even=14
# even=22
# even=24
//////////////////////////////////////////
Q5 -Write a constraint with and without an inside function to generate vari value within the range of 34 to 43?
class main;
  randc bit [5:0] a;
  constraint c1 { a>34; a<43;
                   }
  function void print();
    $display("a=%0d ",a);
  endfunction
endclass

module tb;
  main m;
  initial begin
    m= new();
	repeat(5) begin
    m.randomize();
    m.print();
	end
  end
endmodule
/////////////////////////////////////
# a=41
# a=36
# a=35
# a=40
# a=37
/////////////////////////////////////////
Q - same question but without using rand keyword ,we randomize the value ?
class main;
   bit [5:0] a;
  constraint c1 { a>34; a<43;
                   }
  function void print();
    $display("a=%0d ",a);
  endfunction
endclass

module tb;
  main m;
  initial begin
    m= new();
        repeat(5) begin
    m.randomize(a);
    m.print();
        end
  end
endmodule
///////////////////////////////////////////////////////////
Q6-Write a code to generate random_number of multiplication of 3   ? 
class main;
  randc bit [5:0] a;
  constraint c1 { a%3==0;
                   }
  function void print();
    $display("Random multiple of 3: %d ",a);
  endfunction
endclass

module tb;
  main m;
  initial begin
    m= new();
	repeat(5) begin
    m.randomize();
    m.print();
	end
  end
endmodule
//////////////////////////
# Random multiple of 3: 12
# Random multiple of 3:  9
# Random multiple of 3: 42
# Random multiple of 3: 21
# Random multiple of 3:  6
///////////////////////////////////////
Q7 -How to generate Unique array of element in randomization with constraint ?
class main;
  randc bit [5:0] a[10];
  constraint c1 { unique{a};
                  foreach(a[i])
				  a[i]>10;
                   }
  function void print();
    $display("array =%p ",a);
  endfunction
endclass

module tb;
  main m;
  initial begin
    m= new();
    m.randomize();
    m.print();
  end
endmodule
//////////////////////////////
# array ='{61, 38, 24, 62, 16, 32, 43, 19, 20, 18}
/////////////////////////////////////////////////////
Q8 -how to generate an array of even random number in SV randomization ? 
class main;
  randc bit [7:0] a[10];
  constraint c1 { 
                  foreach(a[i])
				  a[i]%5==0;
                   }
  function void print();
    $display("array =%p ",a);
  endfunction
endclass

module tb;
  main m;
  initial begin
    m= new();
    m.randomize();
    m.print();
  end
endmodule
////////////////////////////////////////////////
# array ='{20, 125, 200, 15, 160, 200, 45, 55, 105, 135}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
-Write an constrains  with array size 100 to 200 values and the each array value assigned to 200  ?// ask in interview
 class main;
 rand bit [7:0] arr[];
  constraint c1 { arr.size() inside{[100:200]};
    foreach (arr[i]) {
      arr[i]  == 200;              
    }
  }
  function void print();
    $display("arr=%p",arr);
  endfunction
endclass

module tb;
  main m;
  initial begin
    m= new();
      m.randomize();
      m.print();
  end
endmodule
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: arr='{200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, ........................................200 , 200 }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
Q9-Write an constrains  with array size 5 to 10 values and the array value should be ascending or descending order ? 
class main;
  randc bit [5:0] a [];
  constraint c1 { a.size inside{[5:10]};
                  foreach(a[i])                   
                    if (i>0){
                      a[i] >= a[i-1];}    //for ascending order use
                      unique{a};
                  }
  function void print();
    $display("array =%p ",a);
  endfunction
endclass

module tb;
  main m;
  initial begin
    m= new();
    m.randomize();
    m.print();
  end
endmodule
/////////////////////////////  Output /////////////////////////////////////////////////
# KERNEL: array ='{25, 34, 50, 51, 52, 53, 54, 57, 63} 
///////////////////////////////////////////////////////////////////////////////////////
class main;
  randc bit [5:0] a [];
  constraint c1 { a.size inside{[5:10]};
                  foreach(a[i])
                    
                    if (i>0){
                      a[i] <= a[i-1];}   // //for  descending order use
                      unique{a};
                   }
  function void print();
    $display("array =%p ",a);
  endfunction
endclass

module tb;
  main m;
  initial begin
    m= new();
    m.randomize();
    m.print();
  end
endmodule
////////////////////////output ///////////////////////////////
# KERNEL: array ='{62, 26, 24, 23, 21, 12, 9, 8, 3} 
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Q9-Write an constrains  to generate pattern 0, 2, 1, 3, 4, 6, 5, 7, 8 ?
class main;
  randc bit [5:0] a [];
  constraint c1 { a.size == 9;
    a[0] == 0;
    a[1] == 2;
    a[2] == 1;
    a[3] == 3;
    a[4] == 4;
    a[5] == 6;
    a[6] == 5;
    a[7] == 7;
    a[8] == 8;             
                }
  function void print();
    $display("array =%p ",a);
  endfunction
endclass

module tb;
  main m;
  initial begin
    m= new();
    m.randomize();
    m.print();
  end
endmodule
/////////////////output /////////////////////////
# KERNEL: array ='{0, 2, 1, 3, 4, 6, 5, 7, 8} 
/////////////////////////////////////////////////
Q9-Write an constrains  to generate pattern 0 1 0 2 0 3 0 4 0 5 ?
class main;
  randc bit [5:0] a [];
  constraint c1 { a.size() == 10;
                 foreach(a[i])
                   if (i%2==0)
                     a[i]==0;
                 else if(i==1)
                   a[i]==1;
                 else if (i%2!=0)
                   a[i]==(a[i-2])+1;  }
   
  function void print();
    $display("array =%p ",a);
  endfunction
endclass

module tb;
  main m;
  initial begin
    m= new();
    m.randomize();
    m.print();
  end
endmodule
/////////////////////////output /////////////////////////
# KERNEL: array ='{0, 1, 0, 2, 0, 3, 0, 4, 0, 5} 
/////////////////////////////////////////////////////////
Q - Write a single constrains to generate random values for bit [8:0] variable in the range  1-34,127,129-156,192-202,257-260 ?
class main;
  rand bit [8:0] a ;
  constraint c1 {a inside {[1:34],127,[129:156],[192:202],[257:260]};}
   
  function void print();
    $display("value of a =%0d ",a);
  endfunction
endclass

module tb;
  main m;
  initial begin
    m= new();
    repeat(10)begin
    m.randomize();
    m.print();
    end
  end
endmodule
///////////////////////output//////////////////////////////////////////////////////////////
# KERNEL: value of a =25 
# KERNEL: value of a =28 
# KERNEL: value of a =260 
# KERNEL: value of a =24 
# KERNEL: value of a =5 
# KERNEL: value of a =10 
# KERNEL: value of a =143 
# KERNEL: value of a =260 
# KERNEL: value of a =144 
# KERNEL: value of a =139 
//////////////////////////////////////////////////////////////////////////////////////////////
Q -Write a code to generate a unique element in an array without using the keyword unique ?
class main;
  randc bit [5:0] a [10];
  constraint c1 { foreach (a[i]) 
                  foreach (a[j]) 
                 if (i != j) 
                 a[i] != a[j];}
   
  function void print();
    $display("array =%p ",a);
  endfunction
endclass

module tb;
  main m;
  initial begin
    m= new();
    m.randomize();
    m.print();
  end
endmodule
//////////////////////output/////////////////////////////////////////////////////////
# KERNEL: array ='{3, 23, 12, 10, 31, 44, 34, 33, 61, 18} 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
Q -write a constraint to generate odd number b/w 10 to 30 in SV randomization ?
class main;
  randc bit [5:0] a;
  constraint c1 { a inside{[10:30]};
                      a%2==1;
                   }
  function void print();
    $display("odd values =%0d ",a);
  endfunction
endclass

module tb;
  main m;
  initial begin
    m= new();
    repeat(6) begin
    m.randomize();
    m.print();
	end
  end
endmodule
////////////////////output///////////////////////////////////////
# KERNEL: odd values =19 
# KERNEL: odd values =23 
# KERNEL: odd values =27 
# KERNEL: odd values =13 
# KERNEL: odd values =21 
# KERNEL: odd values =25 
////////////////////////////////////////////////////////////////////
  Q -Write constraint on 2 dimensional array(int array1[2][4]) for generating even number in first 4 location and odd number in next 4 location.
Also the even number should be in multiple of 4 and odd number should be multiple of 3.
class main;
 
  randc bit [7:0] array1[2][4];
  constraint c1 { 
    foreach(array1[i,j]) {
      if (i == 0) {
        array1[i][j] % 2 == 0;
        array1[i][j] % 4 == 0;
      }
      else {
        array1[i][j] % 2 != 0;
        array1[i][j] % 3 == 0;
      }
    }
  }

  function void print();
      foreach(array1[a,b]) begin
      $display("array1 [%0d][%0d] = %0d", a, b, array1[a][b]);
    end
  endfunction
endclass
module tb;
  main m;
  initial begin
    m = new();
    m.randomize();
    m.print();
   
  end
endmodule
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: array1 [0][0] = 140
# KERNEL: array1 [0][1] = 72
# KERNEL: array1 [0][2] = 68
# KERNEL: array1 [0][3] = 168
# KERNEL: array1 [1][0] = 237
# KERNEL: array1 [1][1] = 99
# KERNEL: array1 [1][2] = 249
# KERNEL: array1 [1][3] = 9
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
class main;
  randc bit [5:0] r,s,t;
  constraint c1 {  r<t; s==r; t<30; s>25;
                   }
  function void print();
    $display(" values of r =%0d ,s=%0d, t=%0d ",r,s,t);
  endfunction
endclass

module tb;
  main m;
  initial begin
    m= new();
    repeat(6) begin
    m.randomize();
    m.print();
	end
  end
endmodule
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL:  values of r =27 ,s=27, t=29 
# KERNEL:  values of r =26 ,s=26, t=28 
# KERNEL:  values of r =28 ,s=28, t=29 
# KERNEL:  values of r =26 ,s=26, t=27 
# KERNEL:  values of r =27 ,s=27, t=28 
# KERNEL:  values of r =28 ,s=28, t=29 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
class main;
  randc bit [15:0] a,b,c;
  constraint c1 {  a<c; b==a; c<30;b>25;
                   }
  function void print();
    $display(" values of a =%0d ,b=%0d, c=%0d ",a,b,c);
  endfunction
endclass

module tb;
  main m;
  initial begin
    m= new();
    repeat(6) begin
    m.randomize();
    m.print();
	end
  end
endmodule
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL:  values of a =27 ,b=27, c=29 
# KERNEL:  values of a =26 ,b=26, c=28 
# KERNEL:  values of a =28 ,b=28, c=29 
# KERNEL:  values of a =26 ,b=26, c=27 
# KERNEL:  values of a =27 ,b=27, c=28 
# KERNEL:  values of a =28 ,b=28, c=29 
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
Q - Write a piece of code to declare a dynamic array to hold 4 bit value &define the constraints for the conditions.
The size of the dynamic array should be in between 10 to 20.
Each elements in the array must have total 2 bits of one’s.(eg:1010)

class main;
  rand bit [3:0] arr[];
  
  constraint c1 { arr.size() inside {[10:20]}; }
  
  constraint c2 {
    foreach (arr[i]) {
      $countones(arr[i]) == 2;
    }
  }
  function void print();
    $display("arr=%p", arr);
  endfunction
endclass

module tb;
  main m;
  
  initial begin
    m = new();
    if (!m.randomize()) // Check if randomization was successful
      $error("Failed to randomize 'm.arr' array.");   
    m.print();
  end
endmodule
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: arr='{9, 5, 9, 9, 6, 10, 5, 9, 3, 5, 9, 10, 6, 6, 9, 9, 9}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	
