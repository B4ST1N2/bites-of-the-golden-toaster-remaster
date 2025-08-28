extends CharacterBody2D

@export var move_speed: float 
var is_facing_rigth =  true

func _physics_process(delta): 
	var input_axis = Input.get_axis("move_left","move_rigth")
	velocity.x = input_axis * move_speed
	
	#Si está mirando a la derecha y presiono a la izquierda 
	#Si está mirando a la izquierda y presiono a la derecha
	if (is_facing_rigth and velocity.x < 0) or (not is_facing_rigth and velocity.x > 0): 
		scale.x *= -1
		is_facing_rigth = not is_facing_rigth	
	
	move_and_slide()
