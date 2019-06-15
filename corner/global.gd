extends Node

#const g_d = 'путь к файлу';

#game_data
var name_pl_1 = "";
var name_pl_2 = "";
var step = 0;
var winner = "";
var fd = File.new();
var content = '';
var flag = 1;
var flag_ch = 0;
var to_file = "";
#net params
var l = 8;
var y_min = 50;
var x_min = 200;
var cell = 63;
var finish_in = cell * l;
var y_max = y_min + finish_in;
var x_max = x_min + finish_in;

#mass
var table = [[0 , 0 , 0 , 0 , 0 , 0 , 0 , 0],
				[0 , 0 , 0 , 0 , 0 , 0 , 0 , 0],
				[0 , 0 , 0 , 0 , 0 , 0 , 0 , 0],
				[0 , 0 , 0 , 0 , 0 , 0 , 0 , 0], 
				[0 , 0 , 0 , 0 , 0 , 0 , 0 , 0], 
				[0 , 0 , 0 , 0 , 0 , 0 , 0 , 0], 
				[0 , 0 , 0 , 0 , 0 , 0 , 0 , 0], 
				[0 , 0 , 0 , 0 , 0 , 0 , 0 , 0]];

#colors
var c_net = "#5DCFC3";
var c_pl_1 = "#FF7A00";
var c_pl_2 = "#83F03C";
var c_chosen = "#C2F56E";
var c_way = "#FFDA73";
#change scene
func scene(name):
	get_tree().change_scene("res://" + name + ".tscn");
	pass;
#exit game
func exit():
	get_tree().quit();
	
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

	

