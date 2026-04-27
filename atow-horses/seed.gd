extends Node

var global_seed = 123459789

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	global_seed = randi()
	seed(global_seed)
	print("using seed ", global_seed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
