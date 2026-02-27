# base tank class, all tanks will inherit from this class (should not be instanciated directly)

class_name Tank extends CharacterBody2D

@onready var input_handler = $InputHandler

signal shoot(bullet_pos: Vector2, bullet_dir)

@export var speed = 200.0
@export var weight = 0.1
var direction = Vector2.ZERO
var force = Vector2.ZERO

# instanciate common nodes in base class so they can be used in child classes without needing to redefine them
var camera: Camera2D
var shoot_timer: Timer
var sound_shoot: AudioStreamPlayer2D
var sound_flashlight: AudioStreamPlayer2D
var flashlight: PointLight2D

func _ready() -> void:
	input_handler.shoot.connect(on_shoot)
	input_handler.change_direction.connect(on_change_direction)
	input_handler.flashlight.connect(on_flashlight)

	# camera setup
	camera = Camera2D.new()
	add_child(camera)
	camera.zoom = Vector2(1.3, 1.3)

	# shoot timer setup
	shoot_timer = Timer.new()
	add_child(shoot_timer)
	shoot_timer.wait_time = 0.5
	shoot_timer.one_shot = true

	# sound setup
	sound_shoot = AudioStreamPlayer2D.new()
	add_child(sound_shoot)
	sound_shoot.stream = preload("res://resources/pop_sound.wav")

	sound_flashlight = AudioStreamPlayer2D.new()
	add_child(sound_flashlight)
	sound_flashlight.stream = preload("res://resources/flashlight.wav")

	# flashlight setup
	flashlight = PointLight2D.new()
	add_child(flashlight)
	flashlight.texture = preload("res://resources/light.png")
	flashlight.energy = 0.65
	flashlight.shadow_enabled = true
	flashlight.texture_scale = 0.35



func _process(delta: float) -> void:

	look_at(get_global_mouse_position())
	
	#keep light from rotating
	if flashlight:
		flashlight.global_rotation = 0

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
	pass

func remove_light():
	flashlight.queue_free()

func on_flashlight():
	if flashlight == null:
		return
		
	sound_flashlight.play()

	if flashlight.visible:
		flashlight.visible = false
	else:
		flashlight.visible = true
