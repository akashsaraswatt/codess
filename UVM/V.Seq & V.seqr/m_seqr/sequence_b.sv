class sequence_b extends uvm_sequence#(seq_item);
  
  seq_item req;
  
  `uvm_object_utils(sequence_b)
  
  function new(string name = "sequence_b");
    super.new(name);
  endfunction
  
  task body();
    `uvm_info(get_type_name(),"Agent_B Sequence :: Inside Body",UVM_NONE);
    req = seq_item::type_id::create("req");
    req.agent = AGENT_B;
    //wait_for_grant();
    start_item(req);
    assert(req.randomize());
    finish_item(req);
    //send_request(req);
    //wait_for_item_done();
  endtask
  
endclass