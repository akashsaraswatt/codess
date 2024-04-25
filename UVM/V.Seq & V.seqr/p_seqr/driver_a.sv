class driver_a extends uvm_driver#(seq_item);
  
  `uvm_component_utils(driver_a)
  
  function new(string name = "driver_a", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  task run_phase(uvm_phase phase);
    forever
      begin
        seq_item_port.get_next_item(req);
        void'(req.randomize());
        drive(req);
        seq_item_port.item_done();
      end
  endtask
  
  virtual task drive(seq_item req);
    `uvm_info(get_type_name(),"Driving from Agent A Driver",UVM_NONE);
    #50;
  endtask
  
endclass