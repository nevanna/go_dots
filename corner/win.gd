extends Node2D


func _ready():
	var nd = get_node("Label");
	var st = str(int(G.step));
	nd.set_text(G.winner + " is winner!!! with " + st + " steps");
	pass #

