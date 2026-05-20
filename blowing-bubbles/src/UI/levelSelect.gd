extends Node

const TUT = preload("res://levels/levelTut.tscn")
#const LEVEL1 = preload("res://levels/level01.tscn")
const LEVEL2 = preload("res://levels/level02.tscn")
const LEVEL3 = preload("res://levels/level03.tscn")
#const LEVEL4 = preload("res://Actors/Level Scenes/level_final.tscn")

#func _on_level_select_button_1_pressed() -> void:
#	get_tree().change_scene_to_packed(LEVEL1)

func _on_level_select_button_2_pressed() -> void:
	get_tree().change_scene_to_packed(LEVEL2)
	
func _on_level_select_button_3_pressed() -> void:
	get_tree().change_scene_to_packed(LEVEL3) 

#func _on_level_select_button_4_pressed() -> void:
	#get_tree().change_scene_to_packed(LEVEL4)


func _on_level_select_tutorial_pressed() -> void:
	get_tree().change_scene_to_packed(TUT)
