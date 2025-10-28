extends CharacterBody2D

var gravity = 10
var speed = 25
var moving_left = true

func _ready() -> void:
	$AnimationPlayer.play("Walk")
	
func _process(delta: float) -> void:
	move_character(delta)
	turn()

func move_character(delta: float) -> void:
	velocity.y += gravity * delta
	
	if (moving_left):
		velocity.x = -speed
		move_and_slide()
	else:
		velocity.x = speed
		move_and_slide()
		


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get_name() == "ss_bread":
		body._loseLife()
		pass
		
		
func turn():
	if not $RayCast2D.is_colliding() or $WallCheck.is_colliding():
		moving_left = !moving_left
		scale.x = -scale.x

		
