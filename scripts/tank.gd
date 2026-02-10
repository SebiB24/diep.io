extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

signal shoot(bullet_pos: Vector2)

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())

func _physics_process(delta: float) -> void:

	var direction := Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity = Vector2.ZERO
	
	if(Input.is_action_just_pressed("shoot")):
		var bullet_pos = $Marker2D.global_position
		shoot.emit(bullet_pos)

	move_and_slide()
	
