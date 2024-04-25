class agent1 extends uvm_agent;
  
  `uvm_component_utils(agent1)
  
  driver1 drv1;
  uvm_sequencer#(xtn1) sqr1;
  monitor1 mon1;
  
  agent1_config cfg_1;
  
  int value_1;
  
  
  function new(string name = "agent1", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    if(!uvm_config_db#(agent1_config)::get(this,"","cfg_1",cfg_1))
      `uvm_fatal("Agent1","cannot get value");
    
    mon1 = monitor1::type_id::create("mon1",this);
    if(cfg_1.is_active == UVM_ACTIVE)
      begin
        drv1 = driver1::type_id::create("drv1",this);
        sqr1 = uvm_sequencer#(xtn1)::type_id::create("sqr1",this);
      end
  endfunction
  
  /*task run_phase(uvm_phase phase);
    `uvm_info("AGENT1",$sformatf("Getting the Value Using Config_db Value_1 = %0d",value_1),UVM_NONE);
  endtask*/
  
endclass