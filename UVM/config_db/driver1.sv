class driver1 extends uvm_driver#(xtn1);
  
  `uvm_component_utils(driver1)
  
  function new(string name = "driver1", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
endclass