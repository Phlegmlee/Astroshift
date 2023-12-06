extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.play_music(2, -20, 1)
