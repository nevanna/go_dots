extends Node2D

func ft_make_net():
	var p_1;
	var p_2;
	var c = G.c_net;
	var x = G.x_min;
	var y = G.y_min;

	while (y <= G.y_max):
		p_1 = Vector2(x, y);
		p_2 = Vector2(x + G.finish_in, y);
		draw_line(p_1, p_2, c, 1, false);
		y += G.cell;
	y = G.y_min;
	while (x <= G.x_max):
		p_1 = Vector2(x, y);
		p_2 = Vector2(x, y + G.finish_in);
		draw_line(p_1, p_2, c, 1, false);
		x += G.cell;
	pass


func ft_draw_circle():
	
	var i = 0;
	var j = 0;
	var center;
	var x;
	var y;

	while (i < G.l):
		j = 0;
		while (j < G.l):
			if (G.table[j][i] != 0):
				x = (G.x_min + G.cell / 2) + 1 + j * G.cell;
				y = (G.y_min + G.cell / 2) + 1 + i * G.cell;
				center = Vector2(x, y);
				if (G.table[j][i] == 1):
					draw_circle(center, 30, G.c_pl_1);
				else:
					draw_circle(center, 30, G.c_pl_2);
			j += 1;
		i += 1;
	pass
	
func _draw():
	ft_make_net();
	ft_draw_circle();
	pass