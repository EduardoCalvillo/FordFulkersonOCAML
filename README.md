# FordFulkersonOCAML
<b>ftest.ml</b> -> Est le programme que nous executons dans le terminal. Celui ci prend en paramètre le graph, le noeud initial, le noeud final et le nom du fichier dans lequel nous mettons le nouveau graphe: ./ftest.byte graph.txt NoeudInit NoeudFinal graphFinal.

<b>FFulk.ml</b> -> On y trouve 3 fonctions principales: parcour du graphe, find_delta et update. Vous trouverez la définition des fonctions dans le document.

<b>gfile.ml</b> -> Cette fonction nous permet d'ecrire et lire les différents fichiers.

<b>graph.ml</b> -> Permet d'éditer le graphe, il s'occupe de la liaison entre la fonction et notre graphe.

Dans le dossier Graphs, on trouve un ensemble de Graphs compatible avec ce <a href="https://www-m9.ma.tum.de/graph-algorithms/flow-ford-fulkerson/index_en.html">site web</a>. Sur ce même site nous nous sommes amusés à dessiner de nombreux graphs que nous avons ensuite exporté et éxecuté avec notre programme.
Nous avons mis un exemple de dessin d'un graph dans le dossier graph1. Par ailleurs, nous avons décidé de dessiner ce graph en pondérant l'épaisseur des flèches avec le flow résiduel.

José Eduardo Calvillo Abrego | 
Claire Gaigeot
