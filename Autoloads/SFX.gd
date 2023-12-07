extends AF

@onready var player = $SoundFX

func _ready():
	pass

func play_sfx(value, offset, volume, pitch): 
	#var instance = audio.instantiate()
	#add_child(instance)
	player.stream = AudioStreamPolyphonic.new()
	player.playing = true
	#print("PLAYER.STREAM:", player.stream)
	#print("VALUE:", value)
	var playback = player.get_stream_playback() as AudioStreamPlaybackPolyphonic
	#print("GET STREAM PLAYBACK:", player.get_stream_playback())
	var _instanceID = playback.play_stream(value, offset, volume, pitch)
	#print("VALUE AFTER PLAY:", value)
	#instance.queue_free()
	
#func create_audio_instance(value, offset, volume, pitch):
	#value = AudioStreamPolyphonic.new()
	#print("create_audio_instance value:",value)
	#var playback = player.get_stream_playback() as AudioStreamPlaybackPolyphonic
	#var _instanceID = playback.play_stream(value, offset, volume, pitch)


	#var instance = audio.instantiate()
	#get_parent().add_child(instance)
	#instance.play_stream(value, offset, volume, pitch)
	
	#$SoundFX.play()
	#$SoundFX.get_stream_playback()

	

func _on_sound_fx_finished():
	pass
