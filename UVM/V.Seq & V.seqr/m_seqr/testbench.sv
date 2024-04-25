`include "uvm_macros.svh"
import uvm_pkg::*;

typedef enum {AGENT_A, AGENT_B} agt_type;

`include "seq_item.sv"
`include "sequence_a.sv"
`include "sequence_b.sv"


`include "sequencer_a.sv"
`include "driver_a.sv"
`include "agent_a.sv"

`include "sequencer_b.sv"
`include "driver_b.sv"
`include "agent_b.sv"

`include "virtual_sequencer.sv"
`include "virtual_sequence.sv"

`include "environment.sv"
`include "test.sv"

module top();
  
  initial 
    begin
      run_test("test");
    end
  
endmodule