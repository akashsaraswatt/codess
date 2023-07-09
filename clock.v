Q -write a Verilog code of clock generation to generate 50 % duty cycle ?
module main;
reg clk;
initial begin
clk=1;
forever begin
  #5 clk =~clk;
  $display(" clk=%0b & time is =%0t",clk,$realtime);
  end
end
initial begin
    #50 $finish;
end
initial begin
     $dumpvars;
     $dumpfile("dump.vcd");
end
endmodule
//////////////////////////////OR/////////////////////////////////////
module main;
reg clk=1;
always begin
  #5 clk =~clk;
 $display(" clk=%0b & time is =%0t",clk,$realtime);
  end
initial begin
    #50 $finish;
end
initial begin
     $dumpvars;
     $dumpfile("dump.vcd");
end
endmodule
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL:  clk=0 & time is =5
# KERNEL:  clk=1 & time is =10
# KERNEL:  clk=0 & time is =15
# KERNEL:  clk=1 & time is =20
# KERNEL:  clk=0 & time is =25
# KERNEL:  clk=1 & time is =30
# KERNEL:  clk=0 & time is =35
# KERNEL:  clk=1 & time is =40
# KERNEL:  clk=0 & time is =45
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Q -write a Verilog code of clock generation to generate 60 % duty cycle ?
module main;
reg clk;
initial begin
clk=1;
forever begin
  #6 clk =~clk;
  $display(" clk=%0b & time is =%0t",clk,$time);
  #4 clk=~clk;
  $display(" clk=%0b & time is =%0t",clk,$time);
  end
end
initial begin
    #50 $finish;
end
initial begin
     $dumpvars;
     $dumpfile("dump.vcd");
end
endmodule

////////////////////////////////////////////////////OR/////////////////////////////////////
module main;
reg clk=1;
always begin
  #6 clk =~clk;
 $display(" clk=%0b & time is =%0t",clk,$realtime);
#4 clk =~clk;
 $display(" clk=%0b & time is =%0t",clk,$realtime);
  end
initial begin
    #50 $finish;
end
initial begin
     $dumpvars;
     $dumpfile("dump.vcd");
end
endmodule

//////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL:  clk=0 & time is =6
# KERNEL:  clk=1 & time is =10
# KERNEL:  clk=0 & time is =16
# KERNEL:  clk=1 & time is =20
# KERNEL:  clk=0 & time is =26
# KERNEL:  clk=1 & time is =30
# KERNEL:  clk=0 & time is =36
# KERNEL:  clk=1 & time is =40
# KERNEL:  clk=0 & time is =46
///////////////////////////////////////////////////////////////////////////////////////////////////
Q -write a Verilog code of clock generation to generate 75 % duty cycle ?
`timescale 1ns/1ps
module main;
reg clk;
initial begin
clk=1;
forever begin
  #7.5 clk =~clk;
  $display(" clk=%0b & time is =%0t",clk,$realtime);
  #2.5 clk=~clk;
  $display(" clk=%0b & time is =%0t",clk,$realtime);
  
  end
end
initial begin
    #50 $finish;
end
initial begin
     $dumpvars;
     $dumpfile("dump.vcd");
end

endmodule
/////////////////////////////////////////////////////OR/////////////////////////////////////
`timescale 1ns/1ps
module main;
reg clk=1;

always begin
 
  #7.5 clk =~clk;
 $display(" clk=%0b & time is =%0t",clk,$realtime);
#2.5clk =~clk;
 $display(" clk=%0b & time is =%0t",clk,$realtime);
  end

initial begin
    #50 $finish;
end
initial begin
     $dumpvars;
     $dumpfile("dump.vcd");
end
endmodule
///////////////////////////////////////////////////OR///////////////////////////////////// simplest version/////////
module main;
reg clk=1;

always begin
 
  #75 
  clk =~clk;
 $display(" clk=%0b & time is =%0t",clk,$realtime);
#25
  clk =~clk;
 $display(" clk=%0b & time is =%0t",clk,$realtime);
  end

initial begin
    #500 $finish;
end
initial begin
     $dumpvars;
     $dumpfile("dump.vcd");
end
endmodule
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL:  clk=0 & time is =7500
# KERNEL:  clk=1 & time is =10000
# KERNEL:  clk=0 & time is =17500
# KERNEL:  clk=1 & time is =20000
# KERNEL:  clk=0 & time is =27500
# KERNEL:  clk=1 & time is =30000
# KERNEL:  clk=0 & time is =37500
# KERNEL:  clk=1 & time is =40000
# KERNEL:  clk=0 & time is =47500
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Q -write a Verilog code of clock generation to generate 83% duty cycle ?
`timescale 1ns/1ps
module main;
reg clk;
initial begin
clk=1;
forever begin
  #8.3 clk =~clk;
  $display(" clk=%0b & time is =%0t",clk,$realtime);
  #1.7 clk=~clk;
  $display(" clk=%0b & time is =%0t",clk,$realtime);
  
  end
end
initial begin
    #50 $finish;
end
initial begin
     $dumpvars;
     $dumpfile("dump.vcd");
end

endmodule

////////////////////////////////////////////////////////////////////////OR/////////////////////////////////////
module main;
reg clk=1;

always begin
  #83 
  clk =~clk;
 $display(" clk=%0b & time is =%0t",clk,$realtime);
#17
  clk =~clk;
 $display(" clk=%0b & time is =%0t",clk,$realtime);
  end

initial begin
    #500 $finish;
end
initial begin
     $dumpvars;
     $dumpfile("dump.vcd");
end
endmodule
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL:  clk=0 & time is =8300
# KERNEL:  clk=1 & time is =10000
# KERNEL:  clk=0 & time is =18300
# KERNEL:  clk=1 & time is =20000
# KERNEL:  clk=0 & time is =28300
# KERNEL:  clk=1 & time is =30000
# KERNEL:  clk=0 & time is =38300
# KERNEL:  clk=1 & time is =40000
# KERNEL:  clk=0 & time is =48300

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Q-Verilog code for sequence detector 101 moore model ?
module sequence_detector(seq_in, clock, reset, det_o);

parameter IDLE   = 2'b00;
parameter STATE1 = 2'b01;
parameter STATE2 = 2'b10;
parameter STATE3 = 2'b11;

input seq_in,clock,reset;
output det_o;
reg [1:0]state,next_state;
////////////////////////
always@(posedge clock or posedge reset)
begin
if(reset)
state <= IDLE;
else
state <= next_state;
end
/////////////////////			
always@(state,seq_in)
begin
case(state)
IDLE   : begin
           if(seq_in==1) 
		   next_state=STATE1;
	       else
	       next_state=IDLE;
		   end
STATE1 : begin
           if(seq_in==0)
	       next_state=STATE2;
	       else
	       next_state=STATE1;
		   end
STATE2 : begin
           if(seq_in==1)
	       next_state=STATE3;
	       else 
	       next_state=IDLE;
		   end
STATE3 : begin
           if(seq_in==1)
	       next_state=STATE1;
	       else 
	       next_state=STATE2;
		   end


default: next_state=IDLE;
endcase
end

assign det_o = (state ==  STATE3) ? 1'b1:1'b0;

endmodule

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Q-Verilog code for sequence detector 1011 moore model ?
module sequence_detector(seq_in, clock, reset, det_o);

parameter IDLE   = 3'b000,
          STATE1 = 3'b001,
          STATE2 = 3'b010, 
          STATE3 = 3'b011,
          STATE4 = 3'b100;

input seq_in,clock,reset;
output det_o;
reg [2:0]state,next_state;
////////////////////////
always@(posedge clock or posedge reset)
begin
if(reset)
state <= IDLE;
else
state <= next_state;
end
/////////////////////			
always@(state,seq_in)
begin
case(state)
IDLE   : begin
           if(seq_in==1) 
		   next_state=STATE1;
	       else
	       next_state=IDLE;
		   end
STATE1 : begin
           if(seq_in==0)
	       next_state=STATE2;
	       else
	       next_state=STATE1;
		   end
STATE2 : begin
           if(seq_in==1)
	       next_state=STATE3;
	       else 
	       next_state=IDLE;
		   end
STATE3 : begin
           if(seq_in==1)
	       next_state=STATE4;
	       else 
	       next_state=STATE2;
		   end
STATE4 : begin
           if(seq_in==1)
	       next_state=STATE1;
	       else 
	       next_state=STATE2;
		   end

default: next_state=IDLE;
endcase
end

assign det_o = (state ==  STATE4) ? 1'b1:1'b0;

endmodule  

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
