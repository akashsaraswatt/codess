class monitor2 extends uvm_monitor;
  
  `uvm_component_utils(monitor2)
  
  function new(string name = "monitor2", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
endclass