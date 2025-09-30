extends CharacterBody2D

var gravity = 10
var speed = 25
var moving_left = true

func _ready() -> void:
	$AnimationPlayer.play("Walk")
	
func _process(delta: float) -> void:
	move_character(delta)

func move_character(delta: float) -> void:
	velocity.y += gravity * delta
	velocity.x = -speed
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get_name() == "ss_bread":
		body._loseLife()
		pass
		
