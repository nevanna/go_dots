extends Node

var score = 0;
var name_pl_1 = "";
var name_pl_2 = "";

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

