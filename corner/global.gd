extends Node

#const g_d = 'путь к файлу';

var score = 0;
var name_pl_1 = "";
var name_pl_2 = "";
var step = 0;
var winner = 0;
var fd = File.new();
var content = '';

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
	

