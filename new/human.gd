var name;
var age; 

func _init(_name, _age = 25):
	name = _name;
	age = _age;
func say(text):
	print(name, '(age:', age, ')', ":", text);