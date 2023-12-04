extends Node

var mobDeath = load("res://Assets/Audio/Effects/Ambience/AMBIENCE_HEARTBEAT_LOOP.wav")
var mobVoice = load("res://Assets/Audio/Effects/Enemies/Enemy.wav")

var SFXArray = [
	mobDeath,
	mobVoice,
]

#var mobDeathFX = SFXArray[0]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Value = music option based on the array MusicArray
# Current values: 0 = mobDeath, 1 = mobHurt, 2 = mobDetect
#                 3 = mobAttack
func play_sfx(value, volume, pitch):
	$SoundFX.stream = SFXArray[value]
	$SoundFX.volume_db = volume
	$SoundFX.pitch_scale = pitch
	print(value)
	$SoundFX.play(value)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
