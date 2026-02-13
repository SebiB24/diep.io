class_name Tank extends CharacterBody2D

@onready var input_handler = $InputHandler

signal shoot(bullet_pos: Vector2, bullet_dir)

@export var speed = 200.0
@export var friction = 3.0
var direction = Vector2.ZERO

func _ready() -> void:
	input_handler.shoot.connect(on_shoot)
	input_handler.change_direction.connect(on_change_direction)

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())

func _physics_process(delta: float) -> void:
	if direction != Vector2.ZERO:
		velocity = direction * speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction)
	move_and_slide()

func on_change_direction(dir: Vector2) -> void:
	direction = dir.normalized()

func on_shoot():
	var bullet_pos = $barrel.global_position
	var bullet_dir = $barrel.global_position - $barrle_base.global_position
	shoot.emit(bullet_pos, bullet_dir)
