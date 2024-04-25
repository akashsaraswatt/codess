class agent_b extends uvm_agent;
  
  `uvm_component_utils(agent_b)
  
  driver_b drv_b;
  sequencer_b seqr_b;
  
  function new(string name = "agent_b", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    drv_b = driver_b::type_id::create("drv_b",this);
    seqr_b = sequencer_b::type_id::create("seqr_b",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    drv_b.seq_item_port.connect(seqr_b.seq_item_export);
  endfunction
  
endclass