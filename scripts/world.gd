extends Node2D

@onready var tank = $tank
@export var bullet_scene: PackedScene = preload("res://scenes/bullet.tscn")

func _ready() -> void:
	tank.shoot.connect(_on_tank_shoot)

func _process(delta: float) -> void:
	pass
	
func _on_tank_shoot(bullet_pos, bullet_dir):
	var bullet = bullet_scene.instantiate()
	
	bullet.setup(bullet_pos, bullet_dir)
	
	add_child(bullet)
	
