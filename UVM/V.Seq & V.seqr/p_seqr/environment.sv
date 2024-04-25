class environment extends uvm_env;
  
  `uvm_component_utils(environment)
  
  agent_a agt_a;
  agent_b agt_b;
  virtual_sequencer v_seqr;
  
  function new(string name = "environment", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agt_a = agent_a::type_id::create("agt_a",this);
    agt_b = agent_b::type_id::create("agt_b",this);
    
    v_seqr = virtual_sequencer::type_id::create("v_seqr",this);
    
    uvm_top.print_topology();
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    v_seqr.seqr_a = agt_a.seqr_a;
    v_seqr.seqr_b = agt_b.seqr_b;
  endfunction
  
endclass