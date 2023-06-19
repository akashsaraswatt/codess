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
