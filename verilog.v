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
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
   
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////      
