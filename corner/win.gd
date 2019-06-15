extends Node2D


func _ready():
	var nd = get_node("Label");
	var st;
	if (G.winner == G.name_pl_1):
		st = str(int(G.step + 1))
	else:
		st = str(int(G.step));	
	G.to_file = G.winner + "\n" + st;
	nd.set_text(G.winner + " is winner!!! with " + st + " steps");
	pass 

