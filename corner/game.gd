extends Node2D

func ft_fill_start(start, symbol):
	var i = int(start);
	var j = int (start);
	var lim = start + 3;
	
	while (i < lim):
		j = start;	
		while(j < lim):
			G.table[j][i] = int(symbol);
			j += 1;
		i += 1;
	pass
			
func ft_get_name():
	var pl1 = get_node("pl1_name");
	var pl2 = get_node("pl2_name");
	pl1.set_text(G.name_pl_1);
	pl2.set_text(G.name_pl_2);
	pass
	
func _ready():
	ft_fill_start(0, 1);
	ft_fill_start(5, 2);
	ft_get_name();
	pass