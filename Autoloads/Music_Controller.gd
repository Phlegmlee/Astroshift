extends Node

var menu = load("res://Assets/Audio/Music/Sci-fi/Billy's Sacrifice.mp3")
var intro = load("res://Assets/Audio/Music/Sci-fi/Crash Landing.mp3")
var levelOne = load("res://Assets/Audio/Music/Sci-fi/platformer_level04.mp3")

var musicPlaying = false

var MusicArray = [
	menu,
	intro,
	levelOne,
]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

# Value = music option based on the array MusicArray
# Current values: 0 = menu, 1 = intro, 2 = levelOne
func play_music(value, volume, pitch):
	$Music.stream = MusicArray[value]
	$Music.volume_db = volume
	$Music.pitch_scale = pitch
	print(value)
	$Music.play(value)
	


func _on_music_finished():
	musicPlaying = false
