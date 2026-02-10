extends Node

var numbers = [1, 2, 3, 4] 

func _ready() -> void:
	var even = numbers.filter(func(n): return n % 2 == 0)
	print(even)
	
	var evenx2 = numbers.filter(func(n): return n % 2 == 0).map(func(n): return n * 2)
	print(evenx2)
	
func _process(delta: float) -> void:
	pass
