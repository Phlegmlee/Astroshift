extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Music.play_music(Music.intro, 0, 0, 1)


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Title Page/TilePage.tscn")
