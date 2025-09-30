extends Control

@export var Personajes: Array[CharacterData]

@onready var spr = $Sprite2D

var cont: int = 0

func _ready() -> void:
	spr.texture = Personajes[0].Imagen

func sig() -> void:
	$butons.playing = true
	await $butons.finished
	if cont < Personajes.size() -1:
		cont += 1
		spr.texture = Personajes[cont].Imagen
	
func ant() -> void:
	$butons.playing = true
	await $butons.finished
	if cont >= 0:
		cont -=1
		spr.texture = Personajes[cont].Imagen

func _on_siguiente_pressed() -> void:
	sig()


func _on_anterior_pressed() -> void:
	ant()


func _on_select_pressed() -> void:
	$butons.playing = true
	await $butons.finished
	pass # Replace with function body.
