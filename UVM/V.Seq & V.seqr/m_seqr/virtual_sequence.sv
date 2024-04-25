class virtual_sequence extends uvm_sequence#(seq_item);
  
  `uvm_object_utils(virtual_sequence)
  
  virtual_sequencer v_seqr;
  
  //all sequences handles
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
    
    // casting between m_sequencer and v_seqr which is there in v_seq
    // m_sequencer which derived from inheritance concept
    // and its of uvm_sequencer type
    if( !$cast(v_seqr, m_sequencer)) 
      begin			
        `uvm_error(get_full_name(),"Virtual sequencer pointer cast failed");	
      end
    
    //object assignment statement so the seqr which is there in the virtual sequence
    //(equivalent to physical seqr i.e LHS)will be point to the seqr which is there in v_seqr of v_seq
    seqr_a = v_seqr.seqr_a;
    seqr_b = v_seqr.seqr_b;

    
    //starting all sequences on to the respective sequencers
    seq_a.start(seqr_a);
    seq_b.start(seqr_b);
    
  endtask 
  
endclass