//////RTL -CODE////////
module dff(input clk,rst,d,output reg q,output qb);
always @(posedge clk)
begin
if(rst)
q<=1'b0;
else
q<=d;
end
assign qb=~q;
endmodule



//////testbench (TB)/////
module dff_tb;
reg clk,rst,d;
wire q,qb;
dff DUT(clk,rst,d,q,qb);
initial
begin
clk =1'b0;
forever
#5 clk=~clk;
end
initial
begin
 d=0;
 #10 d=1;
 #10 d=0;
 #10 d=1;
end
initial
begin
$monitor($time,"d=%b,clk=%b,q=%b,qb=%b",d,clk,q,qb);
end
endmodule
