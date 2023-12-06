extends Node

# Player Loads
var powerUp = load("res://Assets/Audio/Effects/Player/Powerup_Sound.wav")
var teleIn = load("res://Assets/Audio/Effects/Player/Teleport_In.wav")
var teleOut = load("res://Assets/Audio/Effects/Player/Teleport_Out.wav")

# Combat Loads
var bullet = load("res://Assets/Audio/Effects/Combat/Bullet.wav")
var blaster = load("res://Assets/Audio/Effects/Combat/Blaster.wav")
var bulletImpact = load("res://Assets/Audio/Effects/Combat/Impact.wav")
var fleshImpact = load("res://Assets/Audio/Effects/Combat/LIQImpt_Goo Splatter_09.wav")
var lowHealth = load("res://Assets/Audio/Effects/Combat/Low_Health.wav")
var playerDeath = load("res://Assets/Audio/Effects/Combat/player_death.wav")

# Mob Loads
var mobDeath = load("res://Assets/Audio/Effects/Ambience/AMBIENCE_HEARTBEAT_LOOP.wav")
var mobVoice = load("res://Assets/Audio/Effects/Enemies/Enemy.wav")

var SFXArray = [
	# Player
	powerUp, # 0
	teleIn, # 1
	teleOut, # 2
	
	# Combat
	bullet, # 3
	blaster, # 4
	bulletImpact, # 5
	fleshImpact, # 6
	lowHealth, # 7
	playerDeath, # 8
	
	# Mobs
	mobDeath, # 9
	mobVoice, # 10
]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

## Value = music option based on the array SFXArray
## Default values: 0, 1, 1, 1
## Volume = -80 to 24
## Pitch = 0.01 to 4
## Attenuation = 0.00 to 100
func play_sfx(value, volume, pitch, atten):
	$SoundFX.stream = SFXArray[value]
	$SoundFX.volume_db = volume
	$SoundFX.pitch_scale = pitch
	$SoundFX.attenuation = atten
	$SoundFX.play(value)
