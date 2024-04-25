class sequencer_b extends uvm_sequencer#(seq_item);
  
  `uvm_component_utils(sequencer_b)
  
  function new(string name = "sequencer_b", uvm_component parent);
    super.new(name,parent);
  endfunction
  
endclass