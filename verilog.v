Q -Verilog code of D -Flip flop.with synchronous and Asynchronous reset ?
/////////////////////////////RTL/////////////////////////
module dff (input clk,rst,d, output reg q, output qb);
  always@(posedge clk)  //for synchronous reset 
    //always @(posedge clk or posedge reset ) for  asynchronous reset
    begin
      if (rst)
        q<=1'b0;
      else 
        q<= d;
    end
  assign qb =~q;
endmodule

/////////////////////////////TB/////////////////////////////////////
module tb;
  reg clk,rst,d;
  wire q,qb;
  main DUT(clk,rst,d,q,qb);
  initial begin
    clk=1'b0;
    forever #5 clk=~clk;
  end
  initial begin
    d=0; rst=1;
    #10 d=1; rst=0;
    #10 d=0; rst=0;
    #10 d=1; rst=0;
    
  end
endmodule
Q -Verilog code of D -Latch With TB ?
//////////////////////////RTL/////////////////////////////////////////
module dff (input enb,rst,d, output reg q, output qb);
  always@(enb or rst or d)  
begin
      if (rst)
        q<=1'b0;
  else if(enb)
        q<= d;
    end
  assign qb =~q;
endmodule
////////////////////////////////////TB///////////////////////////////////
module tb;
  reg enb,rst,d;
  wire q,qb;
  main DUT(enb,rst,d,q,qb);
  initial begin
    d=0; rst=1; enb=0;
    #10 d=1; rst=0; enb=1;
    #10 d=0; rst=0; enb=1;
    #10 d=1; rst=0; enb=1;
    
  end
endmodule
Q -Verilog code of T - Flip flop with TB ?
///////////////////////////////////////RTL ///////////////////////////////
module tff (input clk,rst ,t, output reg q,output qb);
  always@(posedge clk)
    begin
      if(rst)
        q<=0;
      else if(t)
        q<=~q;
      else
        q<=q;
 end
  assign qb=~q;
endmodule
///////////////////////////////TB///////////////////////////////////////////////
module tb;
  reg clk,rst,t;
  wire q,qb;
  main DUT (clk,rst,t,q,qb);
  initial begin
    clk=1'b0;
    forever #5 clk=~clk;
  end
  initial begin
    t=0; rst=1;
    #10 t=1; rst=0;
    #10 t=0; rst =0;
    #10 t=1; rst=0;
      #10 t=0; rst =0;
  end
endmodule
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Q - Verilog code of JK flip flop with TB ?
/////////////////////////////////RTL ///////////////////////////////////////////////
module jkff(input clk,rst,j,k, output reg q, output qb);
  always @(posedge clk)
    begin
      if(rst)
        q<=1'b0;
      else begin
        case({j,k})
          2'b00 : q<=q;
          2'b01 :q<=1'b0;
          2'b10 : q<=1'b1;
          2'b11 :q<=~q;
        endcase
    end
    end
      assign qb=~q;
endmodule
///////////////OR///////////////
module jkf(j,k,clk,rst,q,qb);
input j,k,clk,rst;
output reg q;
output qb;
parameter HOLD=2'b00,
          SET= 2'b01,
         RESET= 2'b10,
         TOGGLE= 2'b11;
always@(posedge clk)
begin
if(rst)
 q<=1'b0;
else
begin
case({j,k})
HOLD:  q<=q;
SET:   q<=1'b1;
RESET: q<=1'b0;
TOGGLE:q<=~q;
endcase
end
end
assign qb=~q;
endmodule 
////////////////////////////////////////////////////////TB//////////////////////////////
      module tb;
        reg clk ,rst,j,k;
        wire q,qb;
        main DUT(clk,rst,j,k,q,qb);
        initial begin
          clk=1'b0;
          forever #5 clk=~clk;
        end
        initial begin
          j=0;k=0; rst=1;
          #10 j=0; k=1; rst=0;
          #10 j=1; k=0; rst =0;
          #10 j=1; k=1; rst =0;
        end
      endmodule
 ///////////////////////////////////////////////////////////////////////////////////////////////////////
      Q - Verilog code of SR flip flop with TB ?
      module jkff(input clk,rst,s,r, output reg q, output qb);
  always @(posedge clk)
    begin
      if(rst)
        q<=1'b0; qb<=1'b1;
      else begin
        case({s,r})
          2'b00 : begin q<=q; qb<=qb; end
          2'b01 :begin q<=1'b0; qb<=1'b1; end
          2'b10 :begin q<=1'b1; qb<= 1'b0; end
          2'b11 :begin q<=x; qb<= x; end
        endcase
    end
endmodule
      /////////////////////////Testbench //////////////////////////////
module sr_ff_tb;
reg clk,rst,s,r;
wire q,qb;
sr_ff DUT(clk,rst,s,r,q,qb);
initial
begin
clk =1'b0;
forever #5 clk=~clk;
end
initial begin
s=1'b0; r=1'b0; rst=1'b1; 
#10 s=1'b0; r=1'b1; rst=1'b0; 
#10 s=1'b1; r=1'b0; rst=1'b0; 
#10 s=1'b1; r=1'b1; rst=1'b0; 
end
initial
begin
$monitor($time,"s=%b,r=%b,clk=%b,q=%b,qb=%b",s,r,clk,q,qb);
end
endmodule
///////////////or/////////////////
module sr_ff(input s,r,clk,output reg q, qbar);
always@(posedge clk)
begin
if(s == 1)
begin
q = 1;
qbar = 0;
end
else if(r == 1)
begin
q = 0;
qbar =1;
end
else if(s == 0 & r == 0) 
begin 
q <= q;
qbar <= qbar;
end
end
endmodule
////////////////
module sr_ff_tb;
reg S,R,clk;
wire Q, QBAR;
sr_ff dut(.q(Q), .qbar(QBAR), .s(S), .r(R), .clk(clk));
initial begin
  clk=0;
     forever #10 clk = ~clk;  
end 
initial begin 
 S= 1; R= 0;
 #100; S= 0; R= 1; 
 #100; S= 0; R= 0; 
 #100;  S= 1; R=1; 
end 
endmodule
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      ///////////////////////////////////////////////////////////////////////////////////////////////////
Q -Write a verilog code for  Mod 6 UP counter ?
module mod6_up_counter(
    input clk,
    input reset,
    output reg [2:0] count);
always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 0;
    end else if (count == 5) begin
        count <= 0;
    end else begin
        count <= count + 1;
    end
end
endmodule
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
Q -Write a verilog code for  Mod 5 UP counter ?
module mod5_up_counter(
    input clk,
    input reset,
    output reg [2:0] count);
always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 0;
    end else if (count == 4) begin
        count <= 0;
    end else begin
        count <= count + 1;
    end
end
endmodule
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Q -Write a verilog code for  Mod 12 UP counter ?
module mod12_up_counter(
    input clk,
    input reset,
    output reg [3:0] count);
always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 0;
    end else if (count == 11) begin
        count <= 0;
    end else begin
        count <= count + 1;
    end
end
endmodule
      //////////////////////////////4bit -Loadable UP-DOWM Counter///////////////////////////////////////////////////
module counter (input clk,rst,mode,load,input[3:0] datain,output reg [3:0]q);
always @(posedge clk)
begin
if(rst)
q<=4'b0;
else if (load)
q<=datain;
else
begin
case (mode)
1'b1: q<q+1;
1'b0: q<q-1;
end
endmodule
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Q -verilog code of simple 4-bit Asynchronous Counter-UP Counter ?    
  module AsyncCounter(
  input wire clk,
  input wire reset,
  output wire [3:0] count
);

  reg [3:0] count;

  always @(posedge clk or posedge reset) begin
    if (reset)
      count <= 4'b0000;
    else
      count <= count + 1;
  end
endmodule
  //////////////////////////   4bit -SISO   //////////////////////////////////////////////
module siso(input clk,rst,serial_in, output reg serial_out);
reg [3:0]q;
always@(posedge clk)
begin
if (rst)
q<=4'b0;
else
begin
q[3]<=serial_in;
q[2]<=q[3];
q[1]<=q[2];
q[0]<=q[1];
serial_in<=q[0];
end
end
endmodule
 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Following is the Verilog code for a 4-bit unsigned up counter with asynchronous clear.
 module counter (clk, clr, q);
 input clk, clr;
 output [3:0] q;
 reg [3:0] tmp;
 always @(posedge clk or posedge clr)
 begin
 if (clr)
 tmp <= 4’b0000;
 else
 tmp <= tmp + 1’b1;
 end
 assign q = tmp;
 endmodule 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 Following is the Verilog code for a 4-bit unsigned down counter with synchronous set.
 module counter (clk, s, q);
 input clk, s;
 output [3:0] q;
 reg [3:0] tmp;
 always @(posedge clk)
 begin
 if (s) 
 tmp <= 4’b1111;
 else
 tmp <= tmp - 1’b1;
 end
 assign q = tmp;
 endmodule  
      
 ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 Following is the Verilog code for a 4-bit unsigned up counter with an asynchronous load from the primary input.

 module counter (clk, load, d, q);
 input clk, load;
 input [3:0] d;
 output [3:0] q;
 reg [3:0] tmp;
 always @(posedge clk or posedge load)
 begin
 if (load)
 tmp <= d;
 else
 tmp <= tmp + 1’b1;
 end
 assign q = tmp;
 endmodule 
     
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 Following is the Verilog code for a 4-bit unsigned up counter with an asynchronous clear and a clock
enable. 
 module counter (clk, clr, ce, q);
 input clk, clr, ce;
 output [3:0] q;
 reg [3:0] tmp;
 always @(posedge clk or posedge clr)
 begin
 if (clr)
 tmp <= 4’b0000;
 else if (ce)
 tmp <= tmp + 1’b1;
 end
 assign q = tmp;
 endmodule   
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 Following is the Verilog code for a 4-bit unsigned up/down counter with an asynchronous clear.
 module counter (clk, clr, up_down, q);
 input clk, clr, up_down;
 output [3:0] q;
 reg [3:0] tmp;
 always @(posedge clk or posedge clr)
 begin
 if (clr)
 tmp <= 4’b0000;
 else if (up_down)
 tmp <= tmp + 1’b1;
 else
 tmp <= tmp - 1’b1;
 end
 assign q = tmp;
 endmodul     
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 Following is the Verilog code for a 4-bit signed up counter with an asynchronous reset.
 module counter (clk, clr, q);
 input clk, clr;
 output signed [3:0] q;
 reg signed [3:0] tmp;
 always @ (posedge clk or posedge clr)
 begin
 if (clr)
 tmp <= 4’b0000;
 else
 tmp <= tmp + 1’b1;
 end
 assign q = tmp;
 endmodule   
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 Following is the Verilog code for a 4-to-1 1-bit MUX using an If statement.
 module mux (a, b, c, d, s, o);
 input a,b,c,d;
 input [1:0] s;
 output o;
 reg o;
 always @(a or b or c or d or s)
 begin
 if (s == 2’b00)
 o = a;
 else if (s == 2’b01)
 o = b; 
 else if (s == 2’b10)
 o = c;
 else
 o = d;
 end
 endmodule  
   
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 Following is the Verilog Code for a 4-to-1  , 1-bit MUX using a Case statement.
 module mux (a, b, c, d, s, o);
 input a, b, c, d;
 input [1:0] s;
 output o;
 reg o;
 always @(a or b or c or d or s)
 begin
 case (s)
 2’b00 : o = a;
 2’b01 : o = b;
 2’b10 : o = c;
 default : o = d;
 endcase
 end
 endmodule  
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Following is the Verilog code for a 3-to-1, 1-bit MUX with a 1-bit latch.
 module mux (a, b, c, d, s, o);
 input a, b, c, d;
 input [1:0] s;
 output o;
 reg o;
 always @(a or b or c or d or s)
 begin
 if (s == 2’b00)
 o = a;
 else if (s == 2’b01)
 o = b;
 else if (s == 2’b10)
 o = c;
 end
 endmodule   
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 Following is the Verilog code for a 1-of-8 decoder  
  module mux (sel, res);
 input [2:0] sel;
 output [7:0] res;
 reg [7:0] res;
 always @(sel or res)
 begin
 case (sel)
 3’b000 : res = 8’b00000001;
 3’b001 : res = 8’b00000010;
 3’b010 : res = 8’b00000100;
 3’b011 : res = 8’b00001000;
 3’b100 : res = 8’b00010000;
 3’b101 : res = 8’b00100000;
 3’b110 : res = 8’b01000000;
 default : res = 8’b10000000;
 endcase
 end
 endmodule 
 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Following is the Verilog code for an unsigned 8-bit adder/subtractor.
 module addsub(a, b, oper, res);
 input oper;
 input [7:0] a;
 input [7:0] b;
 output [7:0] res;
 reg [7:0] res;
 always @(a or b or oper)
 begin
 if (oper == 1’b0)
 res = a + b;
 else
 res = a - b;
 end
 endmodule   
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Q - Write an verilog code which can count 4 ,9 ,11 ,14 and repeat again ?
  module co (input clk,  output reg [3:0] count );

always @(posedge clk)
  begin
  case(count)
    4: count <= 9;
    9: count <= 11;
    11: count <= 14;
    14: count <= 4;
    default: count <= 4;
  endcase
end
endmodule

   /////////////////////////and TB as shown below  //////////////////////////////////////////////////
module tb;
  reg clk;
  
  wire count;
 co DUT (.clk(clk),.count(count));
  initial begin
    clk=0;
    repeat(30)
      #5 clk=~clk;
  end
  initial begin
    $dumpvars;
    $dumpfile("dump.vcd");  //// to see the waveform in the EDA playground 
  end
  
  
endmodule
   
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Q -Verilog Code of MUX 4X1 using behavioural model ?
   module muxbeh(input [0:1]sel,
		input[0:3]a,
		output reg y);
always @(sel,a)
 begin 
  case(sel)
   2'b00 : y=a[0];
   2'b01 : y=a[1];
   2'b10 : y=a[2];
   2'b11 : y=a[3];
  endcase
 end 
endmodule  
 ////////or//////
module mux4to1(input a,b,c,d,input s0,s1,output reg y);
assign y = s1 ? (s0 ? d : c) : (s0 ? b : a); 
endmodule
//////////////Testbench(TB)////////////////////
module top;
wire  y;
reg  a,b,c,d,s0,s1;
m41 name(a,b,c,d,s0,s1,y);
 initial
 begin
 a=1'b0; b=1'b0; c=1'b0; d=1'b0;
 s0=1'b0; s1=1'b0;
 #500 $finish;
end
always #40 a=~a;
always #20 b=~b;
always #10 c=~c;
always #5 d=~d;
always #80 s0=~s0;
always #160 s1=~s1;
always@(a or b or c or d or s0 or s1) 
$monitor("At time = %t, y= %d", $time, y);
endmodule;

 ////////////////////////////////3X1 - MUX//////////////////////////////////////////////////////
module mux3to1(input a,b,c,input[1:0] sel,output reg y);
always@(*)
begin
case (sel)
2'b00: y=a;
2'b01: y=b;
2'b10: y=c;
default : y=1'b0;
endcase
end
endmodule
/////////////////////////////////////////////////////////////////////////////////////////////////////
module m31( input a,b,c, s0,s1,output reg Y);
assign Y=(s1)? c: (s0?b:a);
endmodule
/////////////////////////////////////2x1 - MUX///////////////////////////////////////////////////////
/////////////////RTL-CODE///////////////////
module m21( input D0, D1, S,output reg Y);
always @(D0 or D1 or S)
begin
if(S) 
Y= D1;
else
Y=D0;
end
endmodule
/////////////////////
module m21( input D0, D1, S,output reg Y);
assign Y=(S)?D1:D0;
endmodule
///////////////TESTBENCH (TB)//////////////////////
module top;
wire y;
reg D0, D1, S;
m21 name(D0, D1, S,y);
initial
begin
D0=1'b0;
D1=1'b0;
S=1'b0;
#100 $finish;
end
always #40 D0=~D0;
always #20 D1=~D1;
always #10 S=~S;
always@(D0 or D1 or S)
$monitor("At time = %t, y = %d", $time, y);
endmodule
//////////////////////////////// 8x1 - MUX //////////////////////////////////////////////////
module m81(input wire D0, D1, D2, D3, D4, D5, D6, D7, S0, S1, S2,output reg out);
always@(*)
begin
case(S0 & S1 & S2)
3'b000: out=D0;
3'b001: out=D1;
3'b010: out=D2;
3'b011: out=D3;
3'b100: out=D4;
3'b101: out=D5;
3'b110: out=D6;
3'b111: out=D7;
default: out=1'b0;
endcase
end
endmodule
///////////////////////////////6X1 -MUX///////////////////////////////////////////////////
module mux6x1(input wire i0,i1,i2,i3,i4,i5,s0,s1,s2,output reg y);
always@(*)
begin
case(s0 & s1 & s2)
3'b000 :y=i0;
3'b001 :y=i1;
3'b010 :y=i2;
3'b011 :y=i3;
3'b100 :y=i4;
3'b101 :y=i5;
default :y=3'bx;
endcase
end
endmodule
  
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////      
Q -Verilog code of half_adder ?
   module half_adder(input a,
		  input b,
		  output sum,
		  output carry);
   assign sum = a^b;
   assign carry = a&b;
endmodule
///////////////////////////  TB ////////////////////////
   module half_adder_tb;
	reg a_tb;
	reg b_tb;
	wire sum_tb;
	wire carry_tb;


	integer i;
	
	half_adder DUT(.a(a_tb),.b(b_tb),.sum(sum_tb),.carry(carry_tb));
	initial
	begin
	   for(i = 0;i < 4;i = i + 1)
	    begin
	      {a_tb,b_tb}=i;
	      #100;
	     end
	end
endmodule
////////////////////////////////////////////////////////////////////////////////////
   Q -Verilog code of full_adder ?
   module full_adder(input a,
		input b,
		input cin,
		output sum,
		output carry);
		wire w1,w2,w3;

		half_adder HA1(.a(a),.b(b),.sum(w1),.carry(w2));
		half_adder HA2(.a(w1),.b(cin),.sum(sum),.carry(w3));
		or OR1(carry,w2,w3);
endmodule
   //////////////// TB ////////////////
  module full_adder_tb;
reg a,b,cin;
wire sum,carry;
integer i;
full_adder DUT(.a(a),.b(b),.cin(cin),.sum(sum),.carry(carry));
initial 
 begin 
   a=1'b0;
   b=1'b0;
   cin=1'b0;
  end
initial
begin
  for(i=0;i<8;i=i+1)
   begin
     {a,b,cin}=i;
     #10;
    end
 end
endmodule 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Q -Verilog code of half_subtractor  ?
  module hs(input a,b,
	output diff,borr);
 
assign diff=a^b;
assign borr=~a&b;
endmodule 
/////////////////////////////////////        TB              ///////////////////////////////////////////////////////////////////
  module hs_tb();
reg a,b;
wire diff,borr;
integer i;
hs DUT(a,b,diff,borr);
initial
begin

for(i=0;i<4;i=i+1)
begin
{a,b}=i;
#10;
end
end
endmodule 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   Q -Verilog code of Full_subtractor  ?
   module fulsub(input a,b,c,
	output diff,borr);
wire w1,w2,w3;
hs hs1(.a(a),.b(b),.diff(w1),.borr(w2));
hs hs2(.a(w1),.b(c),.diff(diff),.borr(w3));
or or1(borr,w2,w3);
endmodule
   ////////////////// TB ////////////////
  module fulsub_tb();
reg a,b,c;
wire diff,borr;
integer i;
fulsub DUT(a,b,c,diff,borr);
initial
begin

for(i=0;i<8;i=i+1)
begin
{a,b,c}=i;
$display("values is a=%b,b=%b,c=%b,diff=%b,borr=%b",a,b,c,diff,borr);
#10;
end
end
endmodule 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   //////////////////////////////////////////////////////////////////////////////////////////////
   /Q- To generate random number b/w 10 and 20/////////////// /////////////////
module main;
reg [4:0] a;
  initial 
    begin
    repeat(5)begin
    a=$urandom_range(10,20);
      $display("a=%d",a);
      end
    end
endmodule
/////////////////output//////////
a=16
a=12
a=10
a=12
a=15
///////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
