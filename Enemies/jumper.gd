extends CharacterBody2D

var mobHealth = 2
const SPEED = 70
const JUMP_VELOCITY = -200
const mobDamage = 5
var gravity = 300

#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#player node for mob to use
@onready var player = get_node("../../Player/Player")
var chase = false

func _process(_delta):
	_on_timer_timeout()

#gravity
func _physics_process(delta):
	velocity.y += gravity * delta
	
	move_and_slide()

func _on_player_detection_body_entered(body):
	if body.name == "Player":
		chase = true

func _on_player_detection_body_exited(body):
	if body.name == "Player":
		chase = false

func _on_damage_hitbox_body_entered(body):
	if body.name == "Bullet":
		mobHurt()
		
func _on_attack_hitbox_body_entered(body):
	if body.name == "Player":
		body.playerHealth -= mobDamage
		
func mobHurt():
	mobHealth -= GlobalVariables.bulletDmg
	if mobHealth <= 0:
		death()
	
func death():
	print("mob death")
	chase = false
	get_node("AnimatedSprite2D").play("Death")
	await get_node("AnimatedSprite2D").animation_finished
	self.queue_free()



func _on_timer_timeout():
	var direction = (player.position - self.position).normalized()
	if chase == true and is_on_floor():
		print("TIMOUT")
		print("JUMP")
		velocity.y = JUMP_VELOCITY
		get_node("AnimatedSprite2D").play("Move")
		$SFX.play()
	elif chase == true and velocity.y <= 0:
		velocity.x = direction.x * SPEED
	else:
		velocity.x = 0
		if get_node("AnimatedSprite2D").animation != "Death":
			get_node("AnimatedSprite2D").play("Idle")










