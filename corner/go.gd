extends Button
func ft_bzero_data():
	G.name_pl_1 = "";
	G.name_pl_2 = "";
	G.step = 0;
	G.winner = "";
	G.flag_ch = 0;
	G.flag = 1;
	G.table = [[0 , 0 , 0 , 0 , 0 , 0 , 0 , 0] ,
				[0 , 0 , 0 , 0 , 0 , 0 , 0 , 0],
				[0 , 0 , 0 , 0 , 0 , 0 , 0 , 0],
				[0 , 0 , 0 , 0 , 0 , 0 , 0 , 0],
				[0 , 0 , 0 , 0 , 0 , 0 , 0 , 0] ,
				[0 , 0 , 0 , 0 , 0 , 0 , 0 , 0],
				[0 , 0 , 0 , 0 , 0 , 0 , 0 , 0],
				[0 , 0 , 0 , 0 , 0 , 0 , 0 , 0]];
	G.to_file = "";
	pass

func ft_str_cmp(str1, str2):
	var i = 0;
	var len1 = len(str1);
	var len2 = len(str2);
	
	if (len1 > 28 || len2 > 28):
		return (0);
	while (i < len1  && i < len2 && str1[i] == str2[i]):
		i += 1;
	if (i == len1 && i == len2):
		return(1);
	else:
		return(0);
	pass

func _pressed():
	
	var pl1 = get_node("../../data/L_E_p_1").get_text();
	var pl2 = get_node("../../data/L_E_p_2").get_text();
	var cmp = 0 ;
	var er;	
	
	ft_bzero_data();
	cmp = ft_str_cmp(pl1, pl2);
	if (!pl1 || !pl2 || cmp):
		er = get_node("error");
		er.show();
	else:
		G.name_pl_1 = str(pl1);
		G.name_pl_2 = str(pl2);
		G.scene('game');
	pass


