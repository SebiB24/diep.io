extends Node

signal change_direction(direction: Vector2)
signal shoot()
signal flashlight()

func _process(delta: float) -> void:
	var direction := Input.get_vector("left", "right", "up", "down")
	if direction:
		change_direction.emit(direction)
	else:
		change_direction.emit(Vector2.ZERO)
	
	if(Input.is_action_just_pressed("shoot")):
		shoot.emit()

	if(Input.is_action_just_pressed("flashlight")):
		flashlight.emit()
