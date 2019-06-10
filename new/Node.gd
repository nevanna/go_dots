extends Node

var human = preload("res://human.gd");
var student = preload("res://student.gd");

func _ready():
	
	var petr = human.new('Petr', 16);
	var ivan = student.new('Ivan', 48);
	ivan.name = 'Vasya';
	#ivan.say("Hello");
	G.hello();
	ivan.quest();
	pass
  