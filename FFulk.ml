open Graph
exception Culdesac

(* Pathfinding algorithm *)
let parcour graph s t=
let rec loop visited acc head neighboors=
  if head <> t then
    match neighboors with
    |[]-> raise Culdesac (* There are no more neighboors *)
    |(id,a)::nx-> if (List.for_all ((<>) id) visited && a!=0) then (*if not visited and weight different from 0*)
        try loop (id::visited) (id::acc) id (out_arcs graph id) with Culdesac -> loop (id::visited) acc head nx (* if Culdesac raised then go back and keep searching *)
      else
        loop visited acc head nx
  else
    List.rev(acc)
in
loop [s] [s] s (out_arcs graph s)


(* Calculate the lowest flow found in the path *)
let find_delta gr chemin=
 let d=1000 in (* Infini *) 
 let rec loop delta list=match list with
 |[]->delta
 |x::[]->delta
 |x::y::nxt->match (find_arc gr x y) with
  |None->failwith "Oops delta"
  |Some v-> if (v < delta) then loop v (y::nxt) else loop delta (y::nxt)
in
loop d chemin


(* Substract the min flow achieved in the path from the arcs and add the flow to the backward arcs *)
let update graph delta chemin=
 let rec loop gr d list=match list with
 |[]->gr
 |x::[]->gr
 |x::y::nxt->match (find_arc gr x y),(find_arc gr y x) with
  |None, _->failwith "Oops Update"
  |Some v, None-> loop (add_arc (add_arc gr y x (d)) x y (v-d)) d (y::nxt) (* If there's no backward arc we only add delta *)
  |Some v,Some w-> loop (add_arc (add_arc gr y x (w+d)) x y (v-d)) d (y::nxt)
in 
 loop graph delta chemin
