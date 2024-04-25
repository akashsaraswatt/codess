class virtual_sequencer extends uvm_sequencer#(seq_item);
  
  `uvm_component_utils(virtual_sequencer)
  
  sequencer_a seqr_a;
  sequencer_b seqr_b;
  
  function new(string name = "virtual_sequencer", uvm_component parent);
    super.new(name,parent);
  endfunction
  
endclass