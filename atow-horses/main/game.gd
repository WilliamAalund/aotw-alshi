extends Node

const MAP1 := preload("res://maps/Map1.tscn")

var map: Node = null
@onready var start_sfx = $StartPlayer
@onready var end_sfx = $EndPlayer

func _ready() -> void:
	GameSignals.start_game.connect(_on_game_start)
	GameSignals.finish_game.connect(_on_game_finish)
	GameSignals.to_main.connect(_on_to_main)

func _on_game_start() -> void:
	print("Starting game...")
	assert(map == null)
	map = MAP1.instantiate()
	add_child(map)
	start_sfx.play()

func _on_game_finish() -> void:
	print("Finishing game...")
	end_sfx.play()
	assert(map != null)
	map.pause_horses()
	map.set_process(false)

func _on_to_main() -> void:
	print("Ending game...")
	assert(map != null)
	map.queue_free()
	map = null
