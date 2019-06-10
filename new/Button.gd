extends Button

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func on_btn_press():
	var x = get_node('../LineEdit');
	
	print(x.get_text());
	pass
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed", self, "on_btn_press");
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
