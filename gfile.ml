open Graph
open Printf
    
type path = string

(* Format of text files: lines of the form 
 *
 *  v id               (node with the given identifier)
 *  e label id1 id2    (arc with the given (string) label. Goes from node id1 to node id2.)
 *
 *)

let write_file path graph =

  (* Open a write-file. *)
  let ff = open_out path in

  (* Write in this file. *)
  fprintf ff "=== Graph file ===\n\n" ;

  (* Write all nodes *)
  v_iter graph (fun id _ -> fprintf ff "v %s\n" id) ;
  fprintf ff "\n" ;

  (* Write all arcs *)
  v_iter graph (fun id out -> List.iter (fun (id2, lbl) -> fprintf ff "e \"%s\" %s %s\n" lbl id id2) out) ;
  
  fprintf ff "\n=== End of graph ===\n" ;
  
  close_out ff ;
  ()

(* Reads a line with a node. *)
let read_node graph line =
  try Scanf.sscanf line "n %s" (fun id -> add_node graph id)
  with e ->
    Printf.printf "Cannot read node in line - %s:\n%s\n" (Printexc.to_string e) line ;
    failwith "from_file_read_node"

(* Reads a line with an arc. *)
let read_arc graph line =
  try Scanf.sscanf line "e %s %s %s" (fun id1 id2 label-> add_arc graph id1 id2 label)
  with e ->
    Printf.printf "Cannot read arc in line - %s:\n%s\n" (Printexc.to_string e) line ;
    failwith "from_file_read_arc"

(* Reads a file to make the graph *)
let from_file path =

  let infile = open_in path in
  (* Read all lines until end of file. *)
  let rec loop graph acu =
    try
      let line = input_line infile in
      let graph2 =
        (* Ignore empty lines *)
        if line = "" then graph

        (* The first character of a line determines its content : v or e.
         * Lines not starting with v or e are ignored. *)
        else match line.[0] with
          | 'n' -> add_node graph acu; 
          | 'e' -> read_arc graph line
          | _ -> graph
      in                 
      loop graph2 (string_of_int( ( int_of_string(acu) +1 ) ) )
    with End_of_file -> graph
  in

  let final_graph = loop empty_graph "-1" in
  
  close_in infile ;
  final_graph
 

(* Make the dot file for the graph img creation *)
let export path graph chemin=

  (* Open a write-file. *)
  let ff = open_out path in

  (* Write in this file. *)
  fprintf ff "digraph finite_state_machine {\n \n size=\"8,5\"\n node [shape = circle];\n";

  (* Write the arcs in the dot file with line width according to flow available through the arc *)
  v_iter graph (fun id out -> List.iter (fun (id2, lbl) -> fprintf ff "%s -> %s [ label = \"%s\", penwidth = \"%f\" ];\n" id id2 lbl (((float_of_string lbl)/.4.0)+.0.2)) out) ;
  
  fprintf ff "}\n" ;
  
  close_out ff ;
  ()
