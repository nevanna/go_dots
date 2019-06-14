extends Button




func ft_load():
    var file = File.new()
    file.open("res://rez.txt", File.READ)
    var content = file.get_as_text()
    file.close()
    return content


func _pressed():
	var fd = File.new();
	var buf;
	var d;
	var sp;
	var i = 0;
	
	if (fd.file_exists("res://rez.txt")):
		buf = ft_load();
		buf = buf + G.to_file + "\n";
		if (fd.open("res://rez.txt", File.WRITE) != 0):
			print("Error openning file");
			return ;
		else:
			fd.store_string(buf);
			fd.close();
	pass 

