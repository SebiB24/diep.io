extends Node2D

@onready var tank = $tank
@export var bullet_scene: PackedScene = preload("res://scenes/bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tank.shoot.connect(_on_tank_shoot)
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	pass
	
func _on_tank_shoot(bullet_pos):
	var bullet = bullet_scene.instantiate()
	
	bullet.setup(bullet_pos)
	
	add_child(bullet)
