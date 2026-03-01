# base tank class, all tanks will inherit from this class (should not be instanciated directly)

class_name Tank extends CharacterBody2D

@onready var input_handler = $InputHandler

signal shoot(bullet_pos: Vector2, bullet_dir)

@export var speed = 200.0
@export var weight = 0.1
var direction = Vector2.ZERO
var force = Vector2.ZERO

func _ready() -> void:
	input_handler.shoot.connect(on_shoot)
	input_handler.change_direction.connect(on_change_direction)
	input_handler.flashlight.connect(on_flashlight)


func _process(delta: float) -> void:

	look_at(get_global_mouse_position())
	
	#keep light from rotating
	if $Flashlight:
		$Flashlight.global_rotation = 0

func _physics_process(delta: float) -> void:

	var target_velocity = Vector2.ZERO
	if direction != Vector2.ZERO:
		target_velocity = direction * speed
	
	# apply force from recoil
	target_velocity += force 

	# lerp is linear interpolation, it will smoothly transition the velocity towards the target_velocity based on the weight and delta time
	velocity = velocity.lerp(target_velocity, weight * 20 * delta)
	force = force.lerp(Vector2.ZERO, weight * 20 * delta)

	if velocity.length() < 0.1:
		velocity = Vector2.ZERO
	if force.length() < 0.1:
		force = Vector2.ZERO
	
	move_and_slide()

func on_change_direction(dir: Vector2) -> void:
	direction = dir.normalized()

# this function should be implemented by the child class
func on_shoot():
	if $TimerShoot.is_stopped():
		$SoundShoot.play()
		shoot_bullets()
		$TimerShoot.start()


func shoot_bullets():
	pass

func remove_light():
	$Flashlight.queue_free()

func on_flashlight():
	if $Flashlight == null:
		return
		
	$SoundFlashlight.play()

	if $Flashlight.visible:
		$Flashlight.visible = false
	else:
		$Flashlight.visible = true
