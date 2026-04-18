extends Node2D

const horse := preload("res://Horse.tscn")

@export var map: Polygon2D
@export var collision: CollisionPolygon2D
@export var spawns: Node

func _ready() -> void:
	assert(map != null and collision != null and spawns != null)
	collision.polygon = map.polygon
	collision.position = map.position
	spawn_horses(2)

func spawn_horses(num_horses: int) -> void:
	var horse_spawns := spawns.get_children()
	
	assert(horse_spawns.size() >= num_horses)
	
	# This assumes that all children of spawns are Node2Ds
	for i in range(num_horses):
		var new_horse = horse.instantiate()
		new_horse.global_position = horse_spawns[i].global_position
		add_child(new_horse)
