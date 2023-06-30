////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module enum_example;
  typedef enum logic [2:0] {SUNDAY, MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY} Weekday;
  initial begin
    Weekday today;
    // Assigning a value to the enum variable
    today = MONDAY;
    // Displaying the enum variable and its value
    $display("Today is %0s", $sformatf("%s (%0d)", today.name(), today));
    // Using enum in conditional statements
    case (today)
      SUNDAY, SATURDAY: $display("It's the weekend!");
      MONDAY: $display("Monday busy day");
      TUESDAY, WEDNESDAY, THURSDAY: $display("Weekday hustle");
      FRIDAY: $display("TGIF!");
      default: $display("Invalid day");
    endcase
  end
endmodule
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: Today is MONDAY (1)
# KERNEL: Monday busy day
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module tb;
  int ma = 20;
  function automatic void pass(ref int fa);
    fa = fa * 2;
    $display("value of fa = %0d", fa);
  endfunction
  initial begin
    pass(ma);
    $display("value of ma = %0d", ma);
  end
endmodule
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: value of fa = 40
# KERNEL: value of ma = 40
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module tb;
  int ma = 20;

  function automatic void pass(const ref int fa);
    int temp_fa = fa * 2;
    $display("value of fa = %0d", temp_fa);
  endfunction

  initial begin
    pass(ma);
    $display("value of ma = %0d", ma);
  end
endmodule
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: value of fa = 40
# KERNEL: value of ma = 20
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class base; 
static int i; 
static function void get(); 
  int a; 
  a++; 
  i++; 
  $display("a=%0d",a); 
  $display("i=%0d",i); 
endfunction 
endclass 
base b1_h,b2_h; 
module test(); 
initial begin 
  b1_h.get(); 
  b1_h.get(); 
  b2_h.get(); 
end 
endmodule
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: a=1
# KERNEL: i=1
# KERNEL: a=1
# KERNEL: i=2
# KERNEL: a=1
# KERNEL: i=3
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class base; 
static int i; 
function static  void get(); 
  int a; 
  a++; 
  i++; 
  $display("a=%0d",a); 
  $display("i=%0d",i); 
endfunction 
endclass 
base b1_h,b2_h; 
module test(); 
initial begin 
  b1_h.get(); 
  b1_h.get(); 
  b2_h.get(); 
end 
endmodule
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: a=1
# KERNEL: i=1
# KERNEL: a=2
# KERNEL: i=2
# KERNEL: a=3
# KERNEL: i=3
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class base; 
 
function static  void get(); 
   int i;
  int a; 
  a++; 
  i++; 
  $display("a=%0d",a); 
  $display("i=%0d",i); 
endfunction 
endclass 
base b1_h,b2_h; 

module test(); 
initial begin 
  b1_h.get(); 
  b1_h.get(); 
  b2_h.get(); 
end 
endmodule
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: a=1
# KERNEL: i=1
# KERNEL: a=2
# KERNEL: i=2
# KERNEL: a=3
# KERNEL: i=3
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class base; 
 
function void get(); 
   int i;
  int a; 
  a++; 
  i++; 
  $display("a=%0d",a); 
  $display("i=%0d",i); 
endfunction 
endclass 
base b1_h,b2_h; 

module test(); 
initial begin 
  b1_h.get(); 
  b1_h.get(); 
  b2_h.get(); 
end 
endmodule
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: a=1
# KERNEL: i=1
# KERNEL: a=1
# KERNEL: i=1
# KERNEL: a=1
# KERNEL: i=1
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module top;
initial begin
$display("%0t Fork join start", $time);
fork
#10 $display("%0t This is thread 1", $time);
#20 $display("%0t This is thread 2", $time);
#30 $display("%0t This is thread 3", $time);
join_any
$display("%0t Fork join end", $time);
end
endmodule
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: 0 Fork join start
# KERNEL: 10 This is thread 1
# KERNEL: 10 Fork join end
# KERNEL: 20 This is thread 2
# KERNEL: 30 This is thread 3
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class parent_class;
  bit [31:0] addr;
  function display();
    $display("Addr = %0d",addr);
  endfunction
endclass

class child_class extends parent_class;
  bit [31:0] data;
  function display();
    super.display();
    $display("Data = %0d",data);
  endfunction
endclass

module inheritence;
  initial begin
    parent_class p=new();
    child_class  c=new();
    c.addr = 10;
    c.data = 20;
   
    c.display();
  end
endmodule
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: Addr = 10
# KERNEL: Data = 20
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class parent_class;
 bit [31:0] addr;
 endclass

 class child_class extends parent_class;
 bit [31:0] data;
 endclass

 module inheritence;
 initial
begin
 child_class c = new();
 c.addr = 10;
 c.data = 20;
 $display("Value of addr = %0d data = %0d",c.addr,c.data);
 end
 endmodule
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Value of addr = 10 data = 20
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////




class base_class;
 virtual function void display();
 $display("Inside base class");
 endfunction
 endclass

 // child class 1
 class child_class_1 extends base_class;
 function void display();
 $display("Inside child class 1");
 endfunction
 endclass

 // child class 2
 class child_class_2 extends base_class;
 function void display();
 $display("Inside child class 2");
 endfunction
 endclass


 module class_polymorphism;

 initial
 begin

   base_class b_h =new(); //declare and create child class
 child_class_1 c_1 = new();
 child_class_2 c_2 = new();
b_h.display();
  c_1.display();
   c_2.display();
   $display("////////////////////////////////////////////////////////////////");
 
  b_h = c_1; //assigning child class to base class
 b_h = c_2;
 //accessing child class methods using base class handle
 b_h.display();
  c_1.display();
   c_2.display();
 end
 endmodule
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: Inside child class 1
# KERNEL: Inside child class 2
# KERNEL: ////////////////////////////////////////////////////////////////
# KERNEL: Inside child class 2
# KERNEL: Inside child class 1
# KERNEL: Inside child class 2
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class main;
  int x,y;
  function new(int x,y);
   this.x=x;
    this.y=y;
  endfunction
  function void print();
    $display("value of x=%0d and y=%0d",x,y);
  endfunction
endclass
module tb;
  main m;
  initial begin
    m=new(20,30);
    m.print();
    
    m=new(5,10);
    m.print();
  end
endmodule
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: value of x=20 and y=30
# KERNEL: value of x=5 and y=10
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
class parent;
  int i;
  function void print();
    $display("value of parent i=%0d",i);
  endfunction
endclass

class child extends parent;
  int i=10;
  function void print();
    super.i=30;
    super.print();
    $display("value of child i=%0d",i);
  endfunction
  
endclass

module tb;
  child c;
  initial begin
    c= new();
    c.i=20;
    c.print();
  end
endmodule
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: value of parent i=30
# KERNEL: value of child i=20
///////////////////////////////////////////////////////////////////////////////
class parent;
  int i;
  function new(int b);
    i=b;
    $display("value of parent i=%0d",i);
  endfunction
endclass

class child extends parent;
  function new (int c);
    super.new(c);
  
  endfunction
  
endclass

module tb;
  child c;
  initial begin
    c= new(100);
    
  end
endmodule
/////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: value of parent i=100
//////////////////////////////////////////////////////////////////////////////////////////////
class parent;
   virtual function f1;
    $display("its parent class");
  endfunction
endclass

class child extends parent;
  function f1;
    $display("its child class");
  endfunction
endclass

module main;
  parent p=new();
  child c=new();
  initial 
    begin
     c.f1;
      p.f1;
      p=c;
      p.f1;
    end
endmodule
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: its child class
# KERNEL: its parent class
# KERNEL: its child class
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class base_class;
 virtual function void display();
 $display("Inside base class");
 endfunction
 endclass
 // child class 1
 class child_class_1 extends base_class;
 function void display();
 $display("Inside child class 1");
 endfunction
 endclass
 // child class 2
 class child_class_2 extends base_class;
 function void display();
 $display("Inside child class 2");
 endfunction
 endclass
module class_polymorphism;
 initial
 begin
   base_class b_h =new(); //declare and create child class
 child_class_1 c_1 = new();
 child_class_2 c_2 = new();
 
 b_h = c_1;  
 b_h = c_2;
 b_h.display();
 end
 endmodule
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: Inside child class 2
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class base_class;
 virtual function void display();
 $display("Inside base class");
 endfunction
 endclass

 // child class 1
 class child_class_1 extends base_class;
 function void display();
 $display("Inside child class 1");
 endfunction
 endclass

 // child class 2
 class child_class_2 extends base_class;
 function void display();
 $display("Inside child class 2");
 endfunction
 endclass


module class_polymorphism;
 initial
 begin
   base_class b_h =new(); //declare and create child class
 child_class_1 c_1 = new();
 child_class_2 c_2 = new();
 
 b_h = c_1;  
b_h.display();
 b_h = c_2;
 
 b_h.display();
 end
 endmodule

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: Inside child class 1
# KERNEL: Inside child class 2
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class base_class;
 virtual function void display();
 $display("Inside base class");
 endfunction
 endclass

 // child class 1
 class child_class_1 extends base_class;
 function void display();
 $display("Inside child class 1");
 endfunction
 endclass

 // child class 2
 class child_class_2 extends base_class;
 function void display();
 $display("Inside child class 2");
 endfunction
 endclass


module class_polymorphism;
 initial
 begin
   base_class b_h =new(); //declare and create child class
 child_class_1 c_1 = new();
 child_class_2 c_2 = new();
 
 b_h = c_1;  
b_h.display();
 b_h = c_2;
 
 b_h.display();
 end
 endmodule

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: Inside child class 1
# KERNEL: Inside child class 2
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class base_class;
 virtual function void display();
 $display("Inside base class");
 endfunction
 endclass
 // child class 
 class child_class extends base_class;
 function void display();
 $display("Inside child class ");
 endfunction
 endclass
 // grand_child
 class grand_child extends child_class;
 function void display();
 $display("Inside grand child class");
 endfunction
 endclass
module class_polymorphism;
 initial
 begin
   base_class b_h =new();
 child_class c_h = new();
 grand_child g_h = new();
 b_h=g_h;
   b_h.display();

 end
 endmodule
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: Inside grand child class
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class base_class;
 virtual function void display();
 $display("Inside base class");
 endfunction
 endclass
 // child class 
 class child_class extends base_class;
 function void display();
 $display("Inside child class ");
 endfunction
 endclass
 // grand_child
 class grand_child extends child_class;
 function void display();
 $display("Inside grand child class");
 endfunction
 endclass
module class_polymorphism;
 initial
 begin
   base_class b_h =new();
 child_class c_h = new();
 grand_child g_h = new();
   b_h = c_h;
   c_h = g_h; 
   b_h.display();

 end
 endmodule
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: Inside child class
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class base_class;
 virtual function void display();
 $display("Inside base class");
 endfunction
 endclass
 // child class 
 class child_class extends base_class;
 function void display();
 $display("Inside child class ");
 endfunction
 endclass
 // grand_child
 class grand_child extends child_class;
 function void display();
 $display("Inside grand child class");
 endfunction
 endclass
module class_polymorphism;
 initial
 begin
   base_class b_h =new();
 child_class c_h = new();
 grand_child g_h = new();
   c_h = g_h;
   b_h = c_h;
    
   b_h.display();

 end
 endmodule
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: Inside grand child class
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module tb;
  mailbox mail=new();
  
  initial begin
    bit[3:0] a;
    repeat(3) begin
      a=$random;
    mail.put(a);
    $display("data send is %0d",a);
    end
  end
 
  initial begin
    forever begin
    bit [3:0] b;
    mail.get(b);
    $display("data receive is %0d",b);
    end
  end
endmodule
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: data send is 4
# KERNEL: data send is 1
# KERNEL: data send is 9
# KERNEL: data receive is 4
# KERNEL: data receive is 1
# KERNEL: data receive is 9
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module semaphore_ex;
  semaphore sema; //declaring semaphore sema
  initial begin
    sema=new(1); //creating sema with '1' key
    fork
      display1(); //process-1
      display2(); //process-2
    join
  end
  task  display1();
    sema.get(); //getting '1' key from sema
    $display("Process A got the key at time %0t",$time);
    #30;
    sema.put(); //putting '1' key to sema
    $display("Process A return the key at time %0t",$time);
  endtask
  task  display2();
    sema.get(); //getting '1' key from sema
    $display("Process B got the key at time %0t",$time);
    #30;
    sema.put(); //putting '1' key to sema
    $display("Process B return the key at time %0t",$time);
  endtask
 
endmodule
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: Process A got the key at time 0
# KERNEL: Process A return the key at time 30
# KERNEL: Process B got the key at time 30
# KERNEL: Process B return the key at time 60
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module semaphore_ex;
  semaphore sema; //declaring semaphore sema
  initial begin
    sema=new(2); //creating sema with '1' key
    fork
      display1(); //process-1
      display2(); //process-2
    join
  end
  task  display1();
    sema.get(); //getting '1' key from sema
    $display("Process A got the key at time %0t",$time);
    #30;
    sema.put(); //putting '1' key to sema
    $display("Process A return the key at time %0t",$time);
  endtask
  task  display2();
    sema.get(); //getting '1' key from sema
    $display("Process B got the key at time %0t",$time);
    #30;
    sema.put(); //putting '1' key to sema
    $display("Process B return the key at time %0t",$time);
  endtask
 
endmodule
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: Process A got the key at time 0
# KERNEL: Process B got the key at time 0
# KERNEL: Process A return the key at time 30
# KERNEL: Process B return the key at time 30
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module semaphore_ex;
  semaphore sema; //declaring semaphore sema
  initial begin
    sema=new(6); //creating sema with '1' key
    fork
      display1(2); //process-1
      display2(3); //process-2
    join
  end
  task  display1(int key);
    sema.get(key); //getting '1' key from sema
    $display("Process A got the key %0d at time %0t",key,$time);
    #30;
    sema.put(key); //putting '1' key to sema
    $display("Process A return the key %0d at time %0t",key,$time);
  endtask
  task  display2(int key);
    sema.get(key); //getting '1' key from sema
    $display("Process B got the key %0d at time %0t",key,$time);
    #30;
    sema.put(key); //putting '1' key to sema
    $display("Process B return the key %0d at time %0t",key,$time);
  endtask
endmodule
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: Process A got the key 2 at time 0
# KERNEL: Process B got the key 3 at time 0
# KERNEL: Process A return the key 2 at time 30
# KERNEL: Process B return the key 3 at time 30
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module semaphore_ex;
  semaphore sema; //declaring semaphore sema
  initial begin
    sema=new(6); //creating sema with '1' key
    fork
      display1(2); //process-1
      display2(5); //process-2
    join
  end
  task  display1(int key);
    sema.get(key); //getting '1' key from sema
    $display("Process A got the key %0d at time %0t",key,$time);
    #30;
    sema.put(key); //putting '1' key to sema
    $display("Process A return the key %0d at time %0t",key,$time);
  endtask
  task  display2(int key);
    sema.get(key); //getting '1' key from sema
    $display("Process B got the key %0d at time %0t",key,$time);
    #30;
    sema.put(key); //putting '1' key to sema
    $display("Process B return the key %0d at time %0t",key,$time);
  endtask
endmodule
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: Process A got the key 2 at time 0
# KERNEL: Process A return the key 2 at time 30
# KERNEL: Process B got the key 5 at time 30
# KERNEL: Process B return the key 5 at time 60
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module semaphore_ex;
  semaphore sema; //declaring semaphore sema
  initial begin
    sema=new(6); //creating sema with '1' key
    fork
      display1(2); //process-1
      display2(10); //process-2
    join
  end
  task  display1(int key);
    sema.get(key); //getting '1' key from sema
    $display("Process A got the key %0d at time %0t",key,$time);
    #30;
    sema.put(key); //putting '1' key to sema
    $display("Process A return the key %0d at time %0t",key,$time);
  endtask
  task  display2(int key);
    sema.get(key); //getting '1' key from sema
    $display("Process B got the key %0d at time %0t",key,$time);
    #30;
    sema.put(key); //putting '1' key to sema
    $display("Process B return the key %0d at time %0t",key,$time);
  endtask
endmodule
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: Process A got the key 2 at time 0
# KERNEL: Process A return the key 2 at time 30
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module semaphore_ex;
  mailbox mail=new();
  
  semaphore sema=new(1); //declaring semaphore sema
  initial begin
     //creating sema with '1' key
    fork
      display1(); //process-1
      display2(); //process-2
    join
  end
  task  display1(int key);
    int a;
    sema.get(key); //getting '1' key from sema
    $display("Process A got the key %0d at time %0t",key,$time);
    #30;
    mail.put(a);
    $display("data send is %0d",a);
    sema.put(key); //putting '1' key to sema
    $display("Process A return the key %0d at time %0t",key,$time);
  endtask
  task  display2(int key);
    int b;
    mail.get(b);
    $display("data receive is %0d",b);
    sema.get(key); //getting '1' key from sema
    $display("Process B got the key %0d at time %0t",key,$time);
    #30;
    sema.put(key); //putting '1' key to sema
    $display("Process B return the key %0d at time %0t",key,$time);
  endtask
endmodule
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Q -write a complete code for  a processor,  which is accessing two process ,But with one key, when accessing one process 
then other process should wait for get  key ,after that return key to mailbox  and then second process get the key  from mailbox 
and then processor access the second process? in system verilog
module semaphore_ex;
  int Proc1_key;
  int Proc2_key;

  mailbox  mail=new();
  semaphore sema=new(1); //declaring semaphore sema
  initial
 begin
   fork
      processor1(); //process-1
      processor2(); //process-2
    join
  end
  task  processor1();
    Proc1_key=1;
    sema.get(Proc1_key);
    $display("Process A got the key at time %0t",$time);
    #30;
    $display("Process A task is finished time %0t",$time);
    mail.put(Proc1_key);  
    
  endtask
  task  processor2();   
   mail.get(Proc2_key);
    $display("Process B got the key at time %0t",$time);
    #30;
    $display("Process B task is finished time %0t",$time);
    sema.put(Proc2_key);
  endtask
endmodule
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: Process A got the key at time 0
# KERNEL: Process A task is finished time 30
# KERNEL: Process B got the key at time 30
# KERNEL: Process B task is finished time 60
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 ////////////////////////////////////////////////////////////////////////////////////////////////////
Q - Find the output of the below code of queue ?
module main;
  int que[$] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
  initial begin
    for (int i = 0; i < que.size(); i++) begin
      int x = que.pop_front();
      $display("i = %0d, X = %0d", i, x);
    end
  end
endmodule
////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: i = 0, X = 1
# KERNEL: i = 1, X = 1
# KERNEL: i = 2, X = 1
# KERNEL: i = 3, X = 1
# KERNEL: i = 4, X = 1
# KERNEL: i = 5, X = 1
# KERNEL: i = 6, X = 1
# KERNEL: i = 7, X = 1
////////////////////////////////////////////////////////////////////////////////////////////////////
module main;
  int que[$] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
  int new_que[$]; 
  initial begin
    for (int i = 0; i < que.size(); i++) begin
      int x = que.pop_front();
      new_que.push_back(x);
      $display("i = %0d, X = %0d", i, x);
    end
    $display("new_que: %p", new_que);
  end
endmodule
///////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: i = 0, X = 1
# KERNEL: i = 1, X = 1
# KERNEL: i = 2, X = 1
# KERNEL: i = 3, X = 1
# KERNEL: i = 4, X = 1
# KERNEL: i = 5, X = 1
# KERNEL: i = 6, X = 1
# KERNEL: i = 7, X = 1
# KERNEL: new_que: '{1, 1, 1, 1, 1, 1, 1, 1}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
queue examples
module main;
  int k;
  int q[$] = {1, 2, 3, 4, 5, 6};
  initial begin
    for (int i = 0; i < q.size(); i++) begin
      k = q.pop_front();
      $display("value of k = %0d", k);
    end
    $display("value of q = %p", q);
  end
endmodule
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: value of k = 1
# KERNEL: value of k = 2
# KERNEL: value of k = 3
# KERNEL: value of q = '{4, 5, 6}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module main;
  int k;
  int q[$] = {1, 2, 3, 4, 5, 6};
  initial begin
    for (int i = 0; i < q.size(); i++) begin
      k = q.pop_back();
      $display("value of k = %0d", k);
    end
    $display("value of q = %p", q);
  end
endmodule
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: value of k = 6
# KERNEL: value of k = 5
# KERNEL: value of k = 4
# KERNEL: value of q = '{1, 2, 3}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module main;
  int k;
  int new_que[$]; 
  int q[$] = {1, 2, 3, 4, 5, 6,7,8,9};
  initial begin
    for (int i = 0; i < q.size(); i++) begin
      k = q.pop_back();
      new_que.push_front(k);
      $display("value of k = %0d", k);
    end
   
    $display("value of q = %p", q);
     $display("new_que: %p", new_que);
  end
endmodule
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: value of k = 9
# KERNEL: value of k = 8
# KERNEL: value of k = 7
# KERNEL: value of k = 6
# KERNEL: value of k = 5
# KERNEL: value of q = '{1, 2, 3, 4}
# KERNEL: new_que: '{5, 6, 7, 8, 9}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
