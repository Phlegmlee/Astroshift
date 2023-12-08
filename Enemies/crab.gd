extends CharacterBody2D

# Unique Mob Attributes
var mobHealth = 3
var SPEED = 60
var mobDamage = 3

# SFX array variables
var crabChase = 0

# Global Mob Attributes
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Player node for mob to use
@onready var player = get_node("../../Player/Player")
var chase = false

# Gravity
func _physics_process(delta):
	velocity.y += gravity * delta
	if chase == true:
		get_node("AnimatedSprite2D").play("Move")
		var direction = (player.position - self.position).normalized()
		if direction.x > 0:
			get_node("AnimatedSprite2D").flip_h = true
		else:
			get_node("AnimatedSprite2D").flip_h = false
			
		velocity.x = direction.x * SPEED
	else:
		velocity.x = 0
		if get_node("AnimatedSprite2D").animation != "Death":
			get_node("AnimatedSprite2D").play("Idle")
	move_and_slide()

func _on_player_detection_body_entered(body):
	if body.name == "Player":
		$talk.play()
		chase = true

func _on_player_detection_body_exited(body):
	if body.name == "Player":
		chase = false

func _on_damage_hitbox_body_entered(body):
	if body.name == "Bullet":
		mobHurt()
		
func _on_attack_hitbox_body_entered(body):
	if body.name == "Player":
		$attack.play()
		body.playerHealth -= mobDamage
		
func mobHurt():
	mobHealth -= Global.bulletDmg
	$hurt.play()
	print("Mob Hurt, Health = ", mobHealth)
	if mobHealth <= 0:
		death()
	
func death():
	print("mob death")
	chase = false
	get_node("AnimatedSprite2D").play("Death")
	$talk.play()
	$die.play()
	await get_node("AnimatedSprite2D").animation_finished
	self.queue_free()



