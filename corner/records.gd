extends Node


func _ready():
	var fd = File.new();
	var buf = "";
	var nd;
	var tmp = "";
	var i  = 0;
	var k = 1;
	var z = 0;
	
	nd = get_node("RichTextLabel");
	fd.open("res://rez.txt", File.READ);
	buf = fd.get_as_text();
	fd.close();
	var l = len(buf);
	if (buf && l > 0):
		while (i < l):
			if (buf[i] == '\n'):
				k = k + 1
				if (z == 10):
						break ;	
				if (k % 2 == 0):
					i = i + 1;
					z = z + 1;
					
					if ( i >= l):
						break ;
					tmp = tmp  + " ---->";
			tmp = tmp + " " + buf[i];
			i = i + 1;
		nd.set_text(tmp);
	pass 


