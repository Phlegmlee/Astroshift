extends CharacterBody2D

# Player Attribute Variables
var playerHealth = 20
const SPEED = 150.0
const JUMP_VELOCITY = -300.0
const powerSPEED = 200.0
const powerJUMP = -350.0
var direction = Vector2(0,0)
var leftShoot = Vector2(-16,0)
var rightShoot = Vector2(16,0)

# Get the gravity from the project settings.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Animations and Asset Loading
const bulletLoad = preload("res://Player/Bullet.tscn")
@onready var astro = $Astro

# Begin Bodyd
func _ready():
	pass
	
func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://Title Page/TilePage.tscn")

func _physics_process(delta):
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Handle Death
	#TODO: FIX DEATH
	#BUG: CURENTLY QUEUE_FREE CALLS TOO SOON, SO DEATH SOUND CAN'T PLAY
	#     COULD FIX WITH AN ANIMATION
	if playerHealth <= 0:
		$Death.play()
		Death()
	
	# Handle Pain
	#TODO: Handle Pain
		
	if Global.powerup == false:
	
		# Handle Jump.
		if Input.is_action_just_pressed("player_jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		
		# Get the input direction and handle the movement/deceleration.
		direction = Input.get_axis("player_left", "player_right")
		if direction == -1:
			astro.flip_h = true
		elif direction == 1:
			astro.flip_h = false
			
		if direction:
			velocity.x = direction * SPEED
			$Anim.play("BaseRun")
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			$Anim.play("BaseIdle")

	if Global.powerup == true:
		
		# Handle Jump.
		if Input.is_action_just_pressed("player_jump") and is_on_floor():
			velocity.y = powerJUMP
		
		# Get the input direction and handle the movement/deceleration.
		direction = Input.get_axis("player_left", "player_right")
		if direction == -1:
			astro.flip_h = true
			$ShootPosition.set_position(leftShoot)
		elif direction == 1:
			astro.flip_h = false
			$ShootPosition.set_position(rightShoot)
			
		if direction:
			velocity.x = direction * SPEED
			$Astro.play("PowerRun")
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			$Astro.play("PowerIdle")
				
		if Input.is_action_just_pressed("player_attack") and velocity.x > 0:
			$Astro.play("PowerRunningShoot")
			shoot()
			
		elif Input.is_action_just_pressed("player_attack"):
			$Astro.play("PowerShoot")
			shoot()
			

	move_and_slide()

func shoot():
	var bullet = bulletLoad.instantiate()
	get_parent().add_child(bullet)
	bullet.position = $ShootPosition.global_position
	if $ShootPosition.get_position() == leftShoot:
		bullet.SPEED = SPEED * -1
	$Shoot.play()

func Death():
	print("Player Death")
	#$Death.play()
	Global.powerup = false
	self.queue_free()
	get_tree().change_scene_to_file("res://Levels/Level_1_Normal.tscn")


