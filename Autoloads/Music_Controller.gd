extends Node

var menu_music = load("res://Assets/Audio/Music/Sci-fi/Billy's Sacrifice.mp3")
var intro_music = load("res://Assets/Audio/Music/Sci-fi/Crash Landing.mp3")

var musicPlaying = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func play_cinematic_music():
	$Music.stream = intro_music
	$Music.play()

func play_music():
	
	$Music.stream = menu_music
	
	if musicPlaying == true:
		pass
	else:
		$Music.play()
		musicPlaying = true
	


func _on_music_finished():
	musicPlaying = false
	play_music()
