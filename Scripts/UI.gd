# UI.gd
extends CanvasLayer

@onready var heart1 = $Heart1    # hijos directos del CanvasLayer
@onready var heart2 = $Heart2
@onready var heart3 = $Heart3

func handle_hearts(lifes: int) -> void:
	# Muestra/oculta según vidas restantes
	heart1.visible = lifes >= 1
	heart2.visible = lifes >= 2
	heart3.visible = lifes >= 3
