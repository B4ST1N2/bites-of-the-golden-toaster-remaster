extends CharacterBody2D

@export var move_speed: float  
@export var jump_speed: float
var is_facing_rigth =  true 
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta): 
	if Input.is_action_just_pressed("jump"): 
		velocity.y = -jump_speed 
		
	velocity.y += gravity * delta
	
	move_x()
	flip()
	move_and_slide()

func flip():
	if (is_facing_rigth and velocity.x < 0) or (not is_facing_rigth and velocity.x > 0): 
		scale.x *= -1
		is_facing_rigth = not is_facing_rigth	

func move_x():
	var input_axis = Input.get_axis("move_left","move_rigth")
	velocity.x = input_axis * move_speed
