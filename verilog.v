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
      


