class seq_item extends uvm_sequence_item;
  
  `uvm_object_utils(seq_item)
  
  agt_type agent;
  
  function new(string name = "seq_item");
    super.new(name);
  endfunction
  
endclass