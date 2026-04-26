extends Node2D

const horse := preload("uid://s4020yi4ur6x")

@export var horse_textures: Array[Texture2D]
@export var map: Polygon2D
@export var collision: CollisionPolygon2D
@export var spawns: Node

func _ready() -> void:
	assert(map != null and collision != null and spawns != null)
	collision.polygon = map.polygon
	collision.position = map.position
	spawn_horses(3)

func spawn_horses(num_horses: int) -> void:
	var horse_spawns := spawns.get_children()
	var horse_names = ["Souvlaki","Natural Bridge","Toxicity"]
	
	assert(horse_spawns.size() >= num_horses)
	
	# This assumes that all children of spawns are Node2Ds
	for i in range(num_horses):
		var new_horse = horse.instantiate()
		
		new_horse.add_to_group("horses")
		new_horse.global_position = horse_spawns[i].global_position
		new_horse.update_name(horse_names[i])
		add_child(new_horse)
		new_horse.get_node("Sprite2D").texture = horse_textures[i]
	
	await get_tree().create_timer(7.5).timeout
	unpause_horses()
	
func pause_horses() -> void:
	var all_horses = get_tree().get_nodes_in_group("horses")
	for horse in all_horses:
		horse.paused = true
		
func unpause_horses() -> void:
	var all_horses = get_tree().get_nodes_in_group("horses")
	for horse in all_horses:
		horse.paused = false
		horse.hide_label()
