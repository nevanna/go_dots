extends Node

#const g_d = 'путь к файлу';

#game_data
var name_pl_1 = "";
var name_pl_2 = "";
var step = 0;
var winner = 0;
var fd = File.new();
var content = '';
var flag = 1;

#net params
var l = 8;
var y_min = 50;
var x_min = 200;
var cell = 63;
var finish_in = cell * l;
var y_max = y_min + finish_in;
var x_max = x_min + finish_in;

#mass
var table = [[0 , 0 , 0 , 0 , 0 , 0 , 0 , 0] , [0 , 0 , 0 , 0 , 0 , 0 , 0 , 0] , [0 , 0 , 0 , 0 , 0 , 0 , 0 , 0] , [0 , 0 , 0 , 0 , 0 , 0 , 0 , 0], [0 , 0 , 0 , 0 , 0 , 0 , 0 , 0] , [0 , 0 , 0 , 0 , 0 , 0 , 0 , 0], [0 , 0 , 0 , 0 , 0 , 0 , 0 , 0], [0 , 0 , 0 , 0 , 0 , 0 , 0 , 0]];

#colors
var c_net = "#5DCFC3";
var c_pl_1 = "#FF7A00";
var c_pl_2 = "#83F03C";
#var c_chosen = ;
func _ready():
	print("loaded");
	pass 
	
func hello():
	print("hello");
	pass

#change scene
func scene(name):
	get_tree().change_scene("res://" + name + ".tscn");
	pass;
#exit game
func exit():
	get_tree().quit();
	
#wor woth file
#func ft_save():
#	fd.open(g_d, File.WRITE);
#	var str_new = winner + ' ' + str(step) + '\n';
#	fd.store_string(str_new);
#	fd.close();
#	print("saved");
#	pass
#
#func ft_load():
#	fd.open(g_d, File.READ);
#	content = fd.get_as_text()
#	fd.close()
#	print("load");
#	pass
	

