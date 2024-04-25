class xtn1 extends uvm_sequence_item;
  
  `uvm_object_utils(xtn1)
  
  function new(string name = "xtn1");
    super.new(name);
  endfunction
  
  rand bit [15:0] data;
  rand bit [3:0] addr;
  
endclass