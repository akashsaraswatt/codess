class agent_a extends uvm_agent;
  
  `uvm_component_utils(agent_a)
  
  driver_a drv_a;
  sequencer_a seqr_a;
  
  function new(string name = "agent_a", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    drv_a = driver_a::type_id::create("drv_a",this);
    seqr_a = sequencer_a::type_id::create("seqr_a",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    drv_a.seq_item_port.connect(seqr_a.seq_item_export);
  endfunction
  
endclass