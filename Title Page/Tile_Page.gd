extends Control

func _ready():
	if Music.music.is_playing() == false:
		Music.play_music(Music.menu, 0, -15, 0.95)
	else:
		pass
	
func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Title Page/LevelSelect.tscn")

func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://Title Page/OptionsPage.tscn")

func _on_quit_button_pressed():
	get_tree().quit()

