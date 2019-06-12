extends Node2D


func ft_get_name():
	var pl1 = get_node("pl1_name");
	var pl2 = get_node("pl2_name");
	pl1.set_text(G.name_pl_1);
	pl2.set_text(G.name_pl_2);
	pass
	
func _ready():
	ft_get_name();
	pass 

