extends Node

var global_seed = "aotw-horses"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var temp = global_seed.hash()
	seed(temp)
	print("using seed ", temp)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
