extends Node

const MAP1 := preload("res://maps/Map1.tscn")

var map: Node = null

func _ready() -> void:
	GameSignals.start_game.connect(_on_game_start)
	GameSignals.finish_game.connect(_on_game_finish)
	GameSignals.to_main.connect(_on_to_main)

func _on_game_start() -> void:
	print("Starting game...")
	assert(map == null)
	map = MAP1.instantiate()
	add_child(map)

func _on_game_finish() -> void:
	print("Finishing game...")
	assert(map != null)
	map.set_process(false)

func _on_to_main() -> void:
	print("Ending game...")
	assert(map != null)
	map.queue_free()
	map = null
