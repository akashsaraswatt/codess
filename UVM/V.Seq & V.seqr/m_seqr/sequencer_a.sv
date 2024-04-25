class sequencer_a extends uvm_sequencer#(seq_item);
  
  `uvm_component_utils(sequencer_a)
  
  function new(string name = "sequencer_a", uvm_component parent);
    super.new(name,parent);
  endfunction
  
endclass