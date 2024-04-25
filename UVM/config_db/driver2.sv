class driver2 extends uvm_driver#(xtn2);
  
  `uvm_component_utils(driver2)
  
  function new(string name = "driver2", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
endclass