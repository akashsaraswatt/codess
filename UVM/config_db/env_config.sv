class env_config extends uvm_object;
  
  `uvm_object_utils(env_config)
  
  function new(string name = "env_config");
    super.new(name);
  endfunction
  
  agent1_config cfg_1[];
  agent2_config cfg_2[];
  
  //if it has agent or not 
  bit has_agent1 = 1;
  bit has_agent2 = 1;
  
  //number of agent
  int no_of_agent1;
  int no_of_agent2;
  
endclass