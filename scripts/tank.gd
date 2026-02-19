class_name Tank extends CharacterBody2D

@onready var input_handler = $InputHandler

signal shoot(bullet_pos: Vector2, bullet_dir)

@export var speed = 200.0
@export var friction = 3.0
var direction = Vector2.ZERO
var force = Vector2.ZERO

func _ready() -> void:
	input_handler.shoot.connect(on_shoot)
	input_handler.change_direction.connect(on_change_direction)

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())

func _physics_process(delta: float) -> void:

	var target_velocity = Vector2.ZERO
	if direction != Vector2.ZERO:
		target_velocity = direction * speed

	velocity = velocity.move_toward(target_velocity, friction * 100 * delta)

	# if i try to apply force on target_velocity, it will not work because the target_velocity is being calculated every frame !
	velocity += force 
	force = force.move_toward(Vector2.ZERO, friction/15)

	velocity = velocity.limit_length(speed)
	move_and_slide()

func on_change_direction(dir: Vector2) -> void:
	direction = dir.normalized()

func on_shoot():
	var bullet_pos = $barrel.global_position
	var bullet_dir = $barrel.global_position - $barrle_base.global_position
	force = bullet_dir.normalized() * -8.0
	shoot.emit(bullet_pos, bullet_dir)
