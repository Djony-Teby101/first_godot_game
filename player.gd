extends KinematicBody2D

var velocity=Vector2(0,0)
const speed=150
const gravity=30
const jumpforce=-800

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x=speed
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h=false
		
		
		
	elif Input.is_action_pressed("ui_left"):
		velocity.x=-speed
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h=true
		
	else:
		$AnimatedSprite.play("idle")
		
	if not is_on_floor():
		$AnimatedSprite.play("jump")
		
	velocity.y=velocity.y+gravity
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y=jumpforce
		
	
	velocity = move_and_slide(velocity,Vector2.UP)
	velocity.x=lerp(velocity.x,0,0.2)


func _on_fallZone_body_entered(body):
	get_tree().change_scene("res://rush_lady2D.tscn")
