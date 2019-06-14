extends Node2D
var x;
var y;

var x_2;
var y_2;

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
				elif (G.table[j][i] == 2):
					draw_circle(center, 30, G.c_pl_2);
				elif (G.table[j][i] == 5):
					draw_circle(center, 30, G.c_way);
				elif (G.table[j][i] == 3):
					draw_circle(center, 30,  G.c_chosen);
				elif (G.table[j][i] == 4):
					draw_circle(center, 30,  G.c_chosen);
			j += 1;
		i += 1;
	pass
	
func ft_select_names():
	var p_1 = Vector2(0, 50);
	var p_2 = Vector2(p_1.x + 100, p_1.y);
	draw_line(p_1, p_2, G.c_pl_1, 5, false);
	p_1.x = 750;
	p_1.y = 550;
	p_2 = Vector2(p_1.x + 100, p_1.y);
	draw_line(p_1, p_2, G.c_pl_2, 5, false);
	pass	
	
func ft_who():
	var p_1 = Vector2(780, 120);
	var p_2 = Vector2(p_1.x + 220, p_1.y);
	if (G.flag == 1):
		draw_line(p_1, p_2, G.c_pl_1, 5, false);
	else:
		draw_line(p_1, p_2, G.c_pl_2, 5, false);
	pass	
	
func _draw():
	ft_make_net();
	ft_select_names();
	ft_who();
	ft_draw_circle();
	pass
	
func ft_were_at_x(j):
	j = (j - G.x_min) / G.cell;
	return(j);
	pass
	
func ft_were_at_y(i):
	i = (i - G.y_min) / G.cell;
	return(i);
	pass


func ft_new(tmp_xx, tmp_yy):
	var tmp_x = tmp_xx;
	var tmp_y = tmp_yy;
	G.table[tmp_x][tmp_y] = 5;
	
	var t = tmp_x - 1;
	var t_max = tmp_x + 1;
	var r = tmp_y - 1;
	var r_max = tmp_y + 1;
	while (r <= r_max):
		t = tmp_x -1;
		while (t <= t_max):
			if (t >= 0 &&  t <=7 && r >= 0 && r <= 7):
				if(G.table[t][r] == 1 || G.table[t][r] == 2):
					var tmp_xxx = tmp_x + (t - tmp_x) * 2;
					var tmp_yyy = tmp_y + (r - tmp_y) * 2;
					if (tmp_xxx >= 0 && tmp_yyy >= 0 && tmp_xxx <= 7 && tmp_yyy <= 7):
						if (G.table[tmp_xxx][tmp_yyy] == 0):
							ft_new(tmp_xxx, tmp_yyy);
			t += 1;
		r += 1;	
	pass
	
func ft_find_way():
	var t = x - 1;
	var t_max = x + 1;
	var r = y - 1;
	var r_max = y + 1;
	var cout = 0;
	while( r <= r_max):
		t = x -1;
		while (t <= t_max):
			if (t >= 0 &&  t <=7 && r >= 0 && r <= 7):
				if(G.table[t][r] == 0):
					G.table[t][r] = 5;
				else:
					var tmp_x = x + (t - x) * 2;
					var tmp_y = y + (r - y) * 2;
					if (tmp_x >= 0 && tmp_y >= 0 && tmp_x <= 7 && tmp_y <= 7):
						if (G.table[x + (t - x) * 2][y + (r - y) * 2] == 0):
							ft_new(tmp_x, tmp_y);
			t += 1;
		r += 1;	
	print(cout);	
	pass	
	
func ft_clear_board():
	var i = 0;
	var j = 0;
	while (j < 8):
		i = 0;
		while (i < 8):
			if (G.table[i][j] == 5):
				G.table[i][j] = 0;
			i += 1;
		j += 1;
	if (G.table[x][y] == 3):
		G.table[x][y] = 1;
	elif (G.table[x][y] == 4):
		G.table[x][y] = 2;
	pass
	
	
func ft_half_step():
	if (G.table[x_2][y_2] == 5):
		G.table[x][y] = 0;
		G.table[x_2][y_2] = G.flag + 2;
		x = x_2;
		y = y_2;
		ft_clear_board();
		G.table[x][y] = G.flag + 2;
		ft_find_way();
		update();
		G.flag_ch = 3;
	pass

func ft_is_win_1():
	var t_x = 5;
	var t_y = 5;
	var rez = 0;
	
	while (t_y < 8):
		t_x = 5;
		while(t_x < 8):
			if (G.table[t_x][t_y] == 1):
				t_x += 1;
				rez += 1;
			else:
				print("win11 " + str(rez));
				return (rez);
		t_y += 1;
	print("win1 " + str(rez));
	return (rez);	

func ft_is_win_2():
	var t_x = 0;
	var t_y = 0;
	var rez = 0;
	
	while (t_y < 3):
		t_x = 0;
		while (t_x < 3):
			if (G.table[t_x][t_y] == 2):
				t_x += 1;
				rez += 1;
			else:
				print("win22 " + str(rez));
				return (rez);
		t_y += 1;
	print("win2 " + str(rez));
	return (rez);	
	
func ft_is_win():
	print("is win");
	if (ft_is_win_1() == 9):
		G.winner = G.name_pl_1;
		G.scene("win");
		return(1);
	if (ft_is_win_2() == 9):
		G.winner = G.name_pl_2;
		G.scene("win");
		return(2);
	return(0);	
	pass		
	
func ft_show_who():
	var nd = get_node("../who");
	if (G.flag == 1):
		nd.set_text(G.name_pl_1 + " turns");
	else:
		nd.set_text(G.name_pl_2 + " turns");
	pass
	
func ft_step():
	var nd = get_node("../step");
	var st = str(int(G.step) + 1);
	nd.set_text("steps: " + st);
	pass
	
func _physics_process(delta):
	var po = Vector2();
	var nd;
	ft_show_who();
	ft_step();
	if (Input.is_action_just_pressed("ui_click")):
		po = get_viewport().get_mouse_position();
		if (G.flag_ch == 0):
			x =  int(ft_were_at_x(po.x));
			y =  int(ft_were_at_y(po.y));
			if ( x >= 0 && y >=0 && x <= 7 && y <= 7):
				if (G.table[x][y] == G.flag):
					G.table[x][y] = G.flag + 2;
					G.flag_ch = G.flag;
					ft_find_way();
					update();
		elif (G.flag_ch == 1 || G.flag_ch == 2):
			x_2 =  int(ft_were_at_x(po.x));
			y_2 =  int(ft_were_at_y(po.y));
			if (x_2 == x && y_2 == y):
				ft_clear_board();
				G.flag_ch = 0;
				update();
			elif (x_2 != x || y_2 != y):
				ft_half_step();
		elif (G.flag_ch == 3):
			G.table[x][y] = G.flag;
			if ( G.flag == 1):
				G.flag = 2;
			else:
				G.flag = 1;
			ft_clear_board();
			update();
			G.step += 0.5;
			G.flag_ch = 0;
			ft_is_win();
			if (G.step >= 32):
				G.scene("win");
			 
	pass				