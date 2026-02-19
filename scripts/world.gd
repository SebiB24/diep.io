extends Node2D

@export var tank: PackedScene = preload("res://scenes/tank_1.tscn")
@export var bullet_scene: PackedScene = preload("res://scenes/bullet.tscn")

var tank_instance: Tank

func _ready() -> void:
	tank.instantiate().position = Vector2(400, 300)
	tank_instance = tank.instantiate()
	add_child(tank_instance)

	tank_instance.shoot.connect(_on_tank_shoot)

func _process(delta: float) -> void:
	pass
	
func _on_tank_shoot(bullet_pos, bullet_dir):
	var bullet = bullet_scene.instantiate()
	
	bullet.setup(bullet_pos, bullet_dir)
	
	add_child(bullet)
	
