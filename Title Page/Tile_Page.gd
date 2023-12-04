extends Control

func _ready():
	MusicController.play_music(0)
	SFX.play_sfx(0)

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Title Page/LevelSelect.tscn")

func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://Title Page/OptionsPage.tscn")

func _on_quit_button_pressed():
	get_tree().quit()

