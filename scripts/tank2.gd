extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -400.0

signal shoot(bullet_pos: Vector2, bullet_dir)

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())

func _physics_process(delta: float) -> void:

	var direction := Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity = Vector2.ZERO
	
	if(Input.is_action_just_pressed("shoot")):
		var bullet_pos = $barrel_1.global_position
		var bullet_dir = $barrel_1.global_position - $barrel_base_1.global_position
		shoot.emit(bullet_pos, bullet_dir)
		
		bullet_pos = $barrel_2.global_position
		bullet_dir = $barrel_2.global_position - $barrel_base_2.global_position
		shoot.emit(bullet_pos, bullet_dir)

	move_and_slide()
	
## TODO: ADD ANOTHER CLASS OF TANK
	
