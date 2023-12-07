extends PolyInst

func _ready():
	pass # Replace with function body.

## Value = music option based on the array SFXArray
## Default values: 0, 1, 1, 1
## Volume = -80 to 24
## Pitch = 0.01 to 4
## Attenuation = 0.00 to 100
#func play_sfx(value, volume, pitch, atten):
	#$SoundFX.stream = SFXArray[value]
	#$SoundFX.volume_db = volume
	#$SoundFX.pitch_scale = pitch
	#$SoundFX.attenuation = atten
	#$SoundFX.play(value)

func play_sfx(value, offset, volume, pitch): 
	$SoundFX.stream = SFXArray[value]
	#create_audio_instance()
	create_audio_instance(value, offset, volume, pitch)
	#create_audio_instance().play_stream(value, offset, volume, pitch)
	
func create_audio_instance(value, offset, volume, pitch):
#func create_audio_instance():
	var instance = audio.instantiate()
	get_parent().add_child(instance)
	$SoundFX.play()
	$SoundFX.get_stream_playback()
	#instance.play_stream(value, offset, volume, pitch)
	instance.queue_free()

func _on_sound_fx_finished():
	pass