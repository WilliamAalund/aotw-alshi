extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Collision/CollisionPolygon2D.polygon = $Map.polygon


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
