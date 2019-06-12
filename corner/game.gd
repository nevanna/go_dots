extends Node2D

var x = 0;
var y = 0;



func ft_print_arr():
	var i = 0;
	var j = 0;
	
	while (i < 8):
		j = 0;
		while (j < 8):
			print(G.table[j][i]);
			j += 1;
		print('\n');
		i += 1;
	pass

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
	

#func ft_were_at_x(j):
#	var cartesian  = G.l / 2;
#	var k = G.x_min + cartesian * 63;
#	if (j < G.x_min || j > G.x_max):
#		return(-1);
#	while (1):
#		if (j < k):
#			tmp = (cartesian / 2);
#			cartesian = cartesian - tmp;
#			if ( cartesian == 0):
#				return(cartesian);
#			k = cartesian * G.cell + G.x_min;
#		else:
#			tmp = (
#			if ( cartesian == 8
#
#
#	return();
#	pass
#
#
#func ft_where_am_i():
#	var i;
#	var j;
#	ft_were_at_x();
#	ft_were_at_j();
#		pass
#mouse_move	
func _input(event):
   # Mouse in viewport coordinatestest
	if (event is InputEventMouseButton) && (event.get_button_index() == 1):
		x = event.position.x;
		y = event.position.y;
		print("Mouse Click/Unclick at: ", x," " ,y);
	pass	

func _ready():
	ft_fill_start(0, 1);
	ft_fill_start(5, 2);
	ft_get_name();
	
	#dont forget del
	ft_print_arr();
	
	pass 

