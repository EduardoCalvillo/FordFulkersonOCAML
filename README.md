# FordFulkersonOCAML
Pour exécuter le programme il faut compiler avec <i>ocamlbuild ftest.byte</i> et aprés dans la terminale lui donner comme paramètre    la graph à utiliser en .txt, le Noeud Initial en entier, le Noeud Final en entier, et le nom du fichier de sortie.
<blockquote>Example: ./ftest.byte graphOG.txt 0 5 GraphResultat</blockquote>

<b>ftest.ml</b> -> Est le programme qui combine les fonctions developpées dans les autres fichiers et qui applique l'algorithme de Ford Fulkerson à un graphe fournis.

<b>FFulk.ml</b> -> On y trouve 3 fonctions principales: parcour du graphe, find_delta et update. 

<b>gfile.ml</b> -> Cette fonction nous permet d'écrire et lire les différents fichiers.

<b>graph.ml</b> -> Permet d'éditer le graphe, il s'occupe de la liaison entre la fonction et notre graphe.

Dans le dossier Graphs, on trouve un ensemble de Graphs compatible avec ce <a href="https://www-m9.ma.tum.de/graph-algorithms/flow-ford-fulkerson/index_en.html">site web</a>. Sur ce même site nous nous sommes amusés à dessiner de nombreux graphs que nous avons ensuite exporté et éxecuté avec notre programme.
Nous avons mis un exemple de dessin d'un graph dans le dossier graph1. Par ailleurs, nous avons décidé de dessiner ce graph en pondérant l'épaisseur des flèches avec le flow résiduel.

José Eduardo Calvillo Abrego | 
Claire Gaigeot
