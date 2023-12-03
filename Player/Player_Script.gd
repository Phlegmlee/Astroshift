extends CharacterBody2D

var playerHealth = 20
const SPEED = 300.0
const JUMP_VELOCITY = -450.0
const powerSPEED = 350.0
const powerJUMP = -500.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var anim = get_node("AnimationPlayer")
const bulletPath = preload("res://Player/Bullet.tscn")




func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if GlobalVariables.powerup == false:
	
		# Handle Jump.
		if Input.is_action_just_pressed("player_jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			anim.play("BaseAnimations/Jump")
		
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("player_left", "player_right")
		if direction == -.01:
			get_node("Astro").flip_h = true
		elif direction == .01:
			get_node("Astro").flip_h = false
			
		
		if direction:
			velocity.x = direction * SPEED
			if velocity.y == 0:
				anim.play("BaseAnimations/Run")
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			anim.play("BaseAnimations/Idle")
			if velocity.y > 0:
				anim.play("BaseAnimations/Fall")

	if GlobalVariables.powerup == true:
			# Handle Jump.
		if Input.is_action_just_pressed("player_jump") and is_on_floor():
			velocity.y = powerJUMP
			anim.play("PowerAnimations/PowerJump")
		
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("player_left", "player_right")
		if direction == -1:
			get_node("Astro").flip_h = true
		elif direction == 1:
			get_node("Astro").flip_h = false
			
		
		if direction:
			velocity.x = direction * powerSPEED
			if velocity.y == 0:
				anim.play("PowerAnimations/PowerRun")
		else:
			velocity.x = move_toward(velocity.x, 0, powerSPEED)
			anim.play("PowerAnimations/PowerIdle")
			if velocity.y > 0:
				anim.play("PowerAnimations/PowerFall")
				
		if Input.is_action_just_pressed("player_attack") and velocity.x > 0:
			anim.play("PowerAnimations/PowerRunningShoot")
			
			shoot()
		elif Input.is_action_just_pressed("player_attack"):
			anim.play("PowerAnimations/PowerShoot")
			shoot()
			

	
	move_and_slide()

	if playerHealth <= 0:
		print("Player Death")
		queue_free()
		get_tree().change_scene_to_file("res://Levels/Level_1_Normal.tscn")

signal playerDirection(direction)

func shoot():
	var bullet = bulletPath.instantiate()
	get_parent().add_child(bullet)
	bullet.position = $ShootPosition.global_position
	
	
	
	
	
	
	
	
	
	
	
