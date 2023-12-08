extends Node

@onready var music = $Music

var menu = load("res://Assets/Audio/Music/Sci-fi/Billy's Sacrifice.mp3")
var intro = load("res://Assets/Audio/Music/Sci-fi/Crash Landing.mp3")
var levelOne = load("res://Assets/Audio/Music/Sci-fi/platformer_level04.mp3")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

# Value = music option based on the array MusicArray
# Current values: 0 = menu, 1 = intro, 2 = levelOne
#func play_music(value, volume, pitch):
	#$Music.stream = MusicArray[value]
	#$Music.volume_db = volume
	#$Music.pitch_scale = pitch
	#print("MUSIC STREAM", value)
	#$Music.play(value)
	


func play_music(value, offset, volume, pitch): 
	music.stream = AudioStreamPolyphonic.new()
	music.playing = true
	var playback = music.get_stream_playback() as AudioStreamPlaybackPolyphonic
	var _instanceID = playback.play_stream(value, offset, volume, pitch)
	
func _on_music_finished():
	pass




