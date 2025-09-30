extends CharacterBody2D

@export var move_speed: float  
@export var jump_speed: float 
@onready var animated_sprite = $animatedSpriteCheese
var is_facing_rigth =  true 
var lifes = 3
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta): 
	jump(delta)
	move_x()
	flip()
	update_animations()
	move_and_slide()

func update_animations(): 
	if not is_on_floor(): 
		if velocity.y < 0: 
			animated_sprite.play("jumping")
		return
	if velocity.x: 
		animated_sprite.play("walking")
	else:
		animated_sprite.play("idle") 

func jump(delta):
	if Input.is_action_just_pressed("jump") and is_on_floor(): 
		velocity.y = -jump_speed 
	
	if not is_on_floor():	
		velocity.y += gravity * delta
	

func flip():
	if (is_facing_rigth and velocity.x < 0) or (not is_facing_rigth and velocity.x > 0): 
		scale.x *= -1
		is_facing_rigth = not is_facing_rigth	

func move_x():
	var input_axis = Input.get_axis("move_left","move_rigth")
	velocity.x = input_axis * move_speed

func _loseLife() -> void:
	lifes -= 1
	$AudioStreamPlayer2D.playing = true
	await $AudioStreamPlayer2D.finished
	
	var canvas_layer := get_tree().root.find_child("CanvasLayer", true, false)
	if canvas_layer and canvas_layer.has_method("handle_hearts"):
		canvas_layer.handle_hearts(lifes)

	if lifes <= 0:
		get_tree().call_deferred("reload_current_scene")
