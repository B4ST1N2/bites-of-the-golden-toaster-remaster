extends Control


func _on_play_pressed() -> void:
	$PlaySound.playing = true
	await $PlaySound.finished
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")


func _on_quit_pressed() -> void:
	$PlaySound.playing = true
	await $PlaySound.finished
	get_tree().quit()


func _on_character_pressed() -> void:
	$PlaySound.playing = true
	await $PlaySound.finished
	get_tree().change_scene_to_file("res://scenes/CharacterSelection.tscn")
