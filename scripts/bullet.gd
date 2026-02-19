extends Area2D

@export var distance_to_destroy: float = 350.0
const SPEED = 15.0

var direction: Vector2
var spawn_position: Vector2

func setup(pos: Vector2, dir: Vector2) -> void:
	spawn_position = pos

	position = pos
	direction = dir
	
func _process(delta: float) -> void:
	
	position += direction * SPEED * delta

	if position.distance_to(spawn_position) > distance_to_destroy:
		queue_free()