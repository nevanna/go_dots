# implement Element.reversed() method which relink list in reversed order

extends Node


func _ready():
	for i in range(5):
		print("...")
	var a = Element.from_string("hello");
	var b = Element.from_string("olleh");
	var c = a
	while c:
		print("> ", c.value)
		c = c.next
	if a.reversed().eq(b):
		print("Good job, you had reverse linked list!")
	else:
		print("Try one more time!")
	

class Element:
	extends Reference
	var next:Element = null;
	var value = '';
	
	func reversed():
		var a = self;
		var tmp = a;
		var adr = null;
		var left = null;
		
		while (tmp):
			adr = tmp.next;
			tmp.next = left;
			left = tmp;
			tmp = adr;
		a = left;
		
		var i = 0;
		var d = a
		print('\n');
		while (i < 5):
			print("> ", d.value);
			d = d.next;
			i = i + 1;
		return a
	
	func eq(b):
		var a = self
		while a && b:
			if a.value != b.value:
				return false
			if a.next && !b.next || b.next && !a.next:
				return false
			a = a.next
			b = b.next
		return true
		
	static func from_string(s):
		#I changed this function, because it did not compile
		var tmp = str(s); 
		var t = len(tmp);
		var first = Element.new()
		var last = first
		var l = 0

		for c in tmp:
			last.value = c
			l += 1
			if l == t:
				break
			var next = Element.new()
			last.next = next
			last = next
		return first
		