class environment extends uvm_env;
  
  `uvm_component_utils(environment)
  
  env_config cfg;
  
  agent1 a1[];
  agent2 a2[];
  
  function new(string name = "environment", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    if(!uvm_config_db#(env_config)::get(this,"","config",cfg))
      `uvm_fatal("ENV","Cannot get Config access");
    
    //for agent1
    if(cfg.has_agent1)
      begin
        a1 = new[cfg.no_of_agent1];
        foreach(a1[i])
          begin
            uvm_config_db#(agent1_config)::set(this,$sformatf("a1[%0d]*",i),"cfg_1",cfg.cfg_1[i]);
            a1[i] = agent1::type_id::create($sformatf("a1[%0d]",i),this);
          end
      end
    
    //for agent2
    if(cfg.has_agent2)
      begin
        a2 = new[cfg.no_of_agent2];
        foreach(a2[i])
          begin
            uvm_config_db#(agent2_config)::set(this,$sformatf("a2[%0d]*",i),"cfg_2",cfg.cfg_2[i]);
            a2[i] = agent2::type_id::create($sformatf("a2[%0d]",i),this);
          end
      end
    
    
  endfunction
  
  function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    uvm_top.print_topology();
  endfunction
  
endclass