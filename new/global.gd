extends Node
var score  = 15;

func print_score():
	print(score);
	pass


func hello():
	print("hello");
	pass

func scene(name):
	get_tree().change_scene("res://" + name + ".tscn");
	pass;
	
func _ready():
	print("loaded");
	pass 
