extends Node2D

func ft_make_net():
	var p_1;
	var p_2;
	var c = Color("#5DCFC3");
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
		
func _draw():
	ft_make_net();
	pass