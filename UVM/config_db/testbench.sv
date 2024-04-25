`include "uvm_macros.svh"
import uvm_pkg::*;

`include "package.sv"

module tb;
  
  
  initial
    begin
      run_test("test");
    end
  
endmodule