class agent2 extends uvm_agent;
  
  `uvm_component_utils(agent2)
  
  driver2 drv2;
  uvm_sequencer#(xtn2) sqr2;
  monitor2 mon2;
  
  agent2_config cfg_2;
  
  int value_2;
  
  function new(string name = "agent2", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    if(!uvm_config_db#(agent2_config)::get(this,"","cfg_2",cfg_2))
      `uvm_fatal("Agent2","cannot get value");
    
    mon2 = monitor2::type_id::create("mon2",this);
    if(cfg_2.is_active == UVM_ACTIVE)
      begin
        drv2 = driver2::type_id::create("drv2",this);
        sqr2 = uvm_sequencer#(xtn2)::type_id::create("sqr2",this);
      end
  endfunction
  
  /*task run_phase(uvm_phase phase);
    `uvm_info("AGENT2",$sformatf("Getting the Value Using Config_db Value_2 = %0d",value_2),UVM_NONE);
  endtask*/
  
endclass