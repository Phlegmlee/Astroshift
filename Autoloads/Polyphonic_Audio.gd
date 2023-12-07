extends Node
class_name PolyInst

# Load Node for Instancing
const audio = preload("res://Autoloads/SFX.tscn")

# Asset Files
var powerUp = load("res://Assets/Audio/Effects/Player/Powerup_Sound.wav")
var teleIn = load("res://Assets/Audio/Effects/Player/Teleport_In.wav")
var teleOut = load("res://Assets/Audio/Effects/Player/Teleport_Out.wav")
var bullet = load("res://Assets/Audio/Effects/Combat/Bullet.wav")
var blaster = load("res://Assets/Audio/Effects/Combat/Blaster.wav")
var bulletImpact = load("res://Assets/Audio/Effects/Combat/Impact.wav")
var fleshImpact = load("res://Assets/Audio/Effects/Combat/LIQImpt_Goo Splatter_09.wav")
var lowHealth = load("res://Assets/Audio/Effects/Combat/Low_Health.wav")
var playerDeath = load("res://Assets/Audio/Effects/Combat/player_death.wav")
var mobDeath = load("res://Assets/Audio/Effects/Ambience/AMBIENCE_HEARTBEAT_LOOP.wav")
var mobVoice = load("res://Assets/Audio/Effects/Enemies/Enemy.wav")

# SFX Storage Array
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

# Instance Creation
#func create_audio_instance(value, offset, volume, pitch):
#func create_audio_instance():
   #var instance = audio.instantiate()
    #get_parent().add_child(instance)
    #instance.play_stream(value, offset, volume, pitch)


class phonics: extends AudioStreamPlaybackPolyphonic
