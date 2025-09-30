extends CharacterBody2D

var gravity = 10
var speed = 25

func _ready() -> void:
	$AnimationPlayer.play("Walk")
	
func _process(delta: float) -> void:
	move_character(delta)

func move_character(delta: float) -> void:
	velocity.y += gravity * delta
	velocity.x = -speed
	move_and_slide()
