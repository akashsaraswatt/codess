class agent2_config extends uvm_object;
  
  `uvm_object_utils(agent2_config)
  
  uvm_active_passive_enum is_active = UVM_ACTIVE;
  
  function new(string name = "agent2_config");
    super.new(name);
  endfunction
  
endclass