open Graph
open FFulk
let () =

	if Sys.argv.(2) = Sys.argv.(3) then raise (Failure "ERROR! Sink and Source must be different");
  	if Array.length Sys.argv <> 5 then
    	begin
      	Printf.printf "\nUsage: %s infile source sink outfile\n\n%!" Sys.argv.(0) ;
      	exit 0
    end ;

  	let infile = Sys.argv.(1)
  	and outfile = Sys.argv.(4)
  
  	and _source = Sys.argv.(2)
  	and _sink = Sys.argv.(3) 
  	in


  	(* Open file *)
  	let graph_flo =Gfile.from_file infile in 
	(* Change the graph into integers for easy calculations *)
	let intgraph_flo = Graph.map graph_flo int_of_string in

	(* Recursive function that finds paths until there are no more or we reach maximum flow possible *)
	let rec fire intgraph_floo flow= 
		let chemin_new= FFulk.parcour intgraph_floo _source _sink in (* Find a path *)
		let delta_new= FFulk.find_delta intgraph_floo chemin_new in (* Calculate the min flow of that specific path *)
		let accflow=flow+delta_new in (* Update the cumulative flow of the graph *)

		Printf.printf "The chosen path is: ";
		List.iter (fun x->Printf.printf "%s " x) chemin_new; (* Display the path and its flow *)
		Printf.printf "\nThe delta is: %d\n" delta_new;

		let intgraph_flo_new=FFulk.update intgraph_floo delta_new chemin_new in (* Update the graph by substracting and adding flow as needed *)


		Gfile.export outfile (Graph.map intgraph_flo_new string_of_int); (* Make the dot file *)


		Printf.printf ("The cumulative flow is %d\n") accflow;
		fire intgraph_flo_new accflow;
	in
	try fire intgraph_flo 0  with Culdesac -> Printf.printf ("--Algorithm Finished--\n")
