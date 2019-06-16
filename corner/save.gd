extends Button


func ft_prepare():
	var buf = "";
	var name_pl = [];
	var numb_st = [];
	var new_name_pl = [];
	var new_numb_st = [];
	var i = 0;
	var j = 0;
	var index = -1;
	var t = 0;
	var to_fl = "";
	var tmp = 1;
	var fd = File.new();
	fd.open("res://rez.txt", File.READ);
	while (1):
		buf = fd.get_line();
		if (buf):
			if (tmp % 2):
				name_pl.push_back(buf);
				i = i + 1;
			else:
				numb_st.push_back(int(buf));
		else:
			break ;
		tmp = tmp + 1;
	fd.close();
	if (i > 0):
		if (numb_st[i - 1] < G.step && i == 10):
			return (-1);
		while (j < i):
			if (numb_st[j] > G.step):
				index = j;
				break ; 
			j = j + 1;
		if (index == -1):
			index = i;
		while (t <= i):
			if (t < index):
				new_name_pl.push_back(name_pl[t]);
				new_numb_st.push_back(numb_st[t]);
			elif (t == index):
				new_name_pl.push_back(G.winner);
				new_numb_st.push_back(G.step);
			elif (t > index):
				if ( t > 0):
					new_name_pl.push_back(name_pl[t - 1]);
					new_numb_st.push_back(numb_st[t - 1]);
			t = t + 1;
			if (t == 10):
				break ;

	t = 0;
	if (i == 0):
		to_fl = G.to_file;
	else:	
		to_fl = new_name_pl[0] + "\n" + str(new_numb_st[0]) + "\n";
		t = t + 1;
		while(t <= i):
			to_fl = to_fl + new_name_pl[t] + "\n" + str(new_numb_st[t]) + "\n";
			t = t + 1;
			if (t == 10):
				break ;
	fd.open("res://rez.txt", File.WRITE);
	fd.store_line(to_fl);
	fd.close();
	return(1);

func _pressed():
	var nd;
	nd = get_node("../../error");
	nd.show();
	if (ft_prepare() == -1):
		nd.set_text("a lot of steps, it is not record(");
		self.hide();
	else:
		nd.set_text("saved");
		self.hide();	
	pass 


