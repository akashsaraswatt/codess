// ---------------Binary to Gray code Converter---------//
module binary_to_gray(B,G);
  input [3:0] B;
  output [3:0] G;
  
  assign G[3] = B[3];
  assign G[2] = B[3]^B[2];
  assign G[1] = B[2]^B[1];
  assign G[0] = B[1]^B[0];
  
endmodule
//////////////////////TB///////////////////////////
module tb;
  reg [3:0] B;
  wire [3:0] G;
  
  binary_to_gray DUT (B,G);
  initial
    begin
      B=4'b1001;
      #10
      B=4'b1100;
      #10
      B=4'b1110;
      #100
      $finish();
    end
  initial
    begin
      $monitor("B=%0b G=%0b",B,G);
    end
endmodule
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: B=1001 G=1101
# KERNEL: B=1100 G=1010
# KERNEL: B=1110 G=1001
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Gray to Binary code converter//

module gray_to_binary(G,B);
  input [3:0] G;
  output [3:0] B;
  
  assign B[3] = G[3];
  assign B[2] = B[3]^G[2];
  assign B[1] = B[2]^G[1];
  assign B[0] = B[1]^G[0];
  
endmodule
///////////////////////////////////TB///////////////////////////////
module tb;
  reg [3:0] G;
  wire [3:0] B;
  
  gray_to_binary DUT (G,B);
  
  initial
    begin
      G=4'b1100;
      #10;
      G=4'b0111;
      #10
      G=4'b0101;
      #100
      $finish();
    end
  initial
    begin
      $monitor("G=%b B=%b",G,B);
    end
endmodule
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: G=1100 B=1000
# KERNEL: G=0111 B=0101
# KERNEL: G=0101 B=0110
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Binary to 2's complement converter//

module bin_complement_2s(in,out);
  
  input [3:0] in;
  output  [3:0] out;
  
  wire [3:0] temp;
  
  assign temp = 4'b1111-in;
  assign out = temp+4'b0001;
endmodule
////////////////////////////TB///////////////////////////
module tb;
  reg [3:0] in;
  wire  [3:0] out;
  
  bin_complement_2s DUT (in,out);
  initial
    begin
      in=4'b1110;
      #10
      in=4'b1101;
      #10
      in=4'b0001;
      #100
      $finish();
    end
  initial
    begin
      $monitor("in=%b out=%b",in,out);
    end
endmodule
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: in=1110 out=0010
# KERNEL: in=1101 out=0011
# KERNEL: in=0001 out=1111
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Binary to 1's complement converter//

module bin_complement_2s(in,out);
  
  input [3:0] in;
  output  [3:0] out;
  
  wire [3:0] temp;
  
  assign temp = 4'b1111-in;
  assign out = temp;
endmodule
//////////////////////////////TB///////////////
module tb;
  reg [3:0] in;
  wire  [3:0] out;
  
  bin_complement_2s DUT (in,out);
  
  initial
    begin
      in=4'b1110;
      #10
      in=4'b1101;
      #10
      in=4'b0001;
      #100
      $finish();
    end
  initial
    begin
      $monitor("in=%b out=%b",in,out);
    end
endmodule
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# KERNEL: in=1110 out=0001
# KERNEL: in=1101 out=0010
# KERNEL: in=0001 out=1110
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ----------------UP_DOWN COUNTER-------------------------//

module up_down_counter(clk,rst,up_down,q);
  input logic clk,rst,up_down;
  output logic [3:0] q;
  
  always@(posedge clk)
    begin
      if(!rst)
        begin
          q<= 4'b0000;
        end
      else if(up_down==1)
        begin
          q <= q+1;
        end
      else
        begin
        q <= q-1;
        end
    end
endmodule
/////////////////////////////TB//////////////////////////
module tb;
  logic clk,rst,up_down;
  logic [3:0] q;
  
  up_down_counter DUT (.*);
  
  always #5 clk = !clk;
  
  initial
    begin
      clk=0;
      rst=0;
      #10
      rst=1;
      up_down=1;
      #10;
      up_down=0;
      #100
      $finish();
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars();
    end
endmodule
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//---------------------------RING COUNTER------------------------------//
module ring_counter #(parameter N=4)(clk,rst,count);
  
  input logic clk,rst;
  output logic [N-1:0] count;
  
  always@(posedge clk)
    begin
      if(!rst)
        count <= 4'b0001;
      else
        count <= {count[0],count[N-1:1]};
    end
endmodule
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//------RING COUNTER TB---------------------//
module tb;
  parameter N=4;
  
  logic clk,rst;
  logic [N-1:0] count;
  
  ring_counter DUT(.*);
  
  
  always #5 clk=!clk;
  
  initial
    begin
      clk=0;
      rst=0;
      #10
      rst=1;
      #100
      $finish();
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars();
    end
endmodule
  
 ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
