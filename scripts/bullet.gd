extends Area2D

const SPEED = 20.0

var direction: Vector2

func setup(pos: Vector2, dir: Vector2) -> void:
	position = pos
	direction = dir
	
func _process(delta: float) -> void:
	position += direction * SPEED * delta
