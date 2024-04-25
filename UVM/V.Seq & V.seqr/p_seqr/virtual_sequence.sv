class virtual_sequence extends uvm_sequence#(seq_item);
  
  `uvm_object_utils(virtual_sequence)
  
  `uvm_declare_p_sequencer(virtual_sequencer)
  
  // all sequences handles
  sequence_a seq_a;
  sequence_b seq_b;
  
  //all sequencers handles
  sequencer_a seqr_a;
  sequencer_b seqr_b;
  
  function new(string name = "virtual_sequence");
    super.new(name);
  endfunction
  
  task body();
    `uvm_info(get_type_name(),"Virtual Sequence: Inside body",UVM_NONE);
    seq_a = sequence_a::type_id::create("seq_a");
    seq_b = sequence_b::type_id::create("seq_b");
    //starting all sequences on to the respective sequencers
    seq_a.start(p_sequencer.seqr_a);
    seq_b.start(p_sequencer.seqr_b);
  endtask 
  
endclass