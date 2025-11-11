extends CharacterBody2D

var gravity = 10
var speed = 25
var moving_left = true
@onready var animated_sprite = $BossAnimated



func _ready() -> void:
	print("DEBUG: _ready ejecutado en ", self.name)
	print("DEBUG: Boss _ready() ejecutado. Area2D encontrado? -> ", has_node("Area2D"))
	animated_sprite.play("Walk")
	
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
		


func _on_area_2d_body_entered(body: Node) -> void:
	print("DEBUG: boss collision with -> ", body, " parent=", body.get_parent())
	var target = body
	if body.get_parent() and (body.get_parent().has_method("lose_life") or body.get_parent().has_method("_loseLife")):
		target = body.get_parent()
	if target.has_method("lose_life"):
		target.call("lose_life")
	elif target.has_method("_loseLife"):
		target.call("_loseLife")
	else:
		print("DEBUG: El objeto colisionado no tiene lose_life/_loseLife.")

		
		
func turn():
	if not $RayCast2D.is_colliding() or $WallCheck.is_colliding():
		moving_left = !moving_left
		scale.x = -scale.x
