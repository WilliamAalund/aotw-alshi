extends Node2D

@export var map: Polygon2D
@export var collision: CollisionPolygon2D

func _ready() -> void:
	assert(map != null and collision != null)
	collision.polygon = map.polygon
	collision.position = map.position

func spawn_horses() -> void:
	pass # TODO
