extends Node



const TUT = preload("res://levels/levelTut.tscn")
const LEVEL1 = preload("res://levels/level1.tscn")
const LEVEL2 = preload("res://levels/level2.tscn")
const LEVEL3 = preload("res://levels/level3.tscn")
const LEVEL4 = preload("res://levels/level4.tscn")

func _ready() -> void:
	var i = 1
	while i < 5:
		var levelLabel = "level_select_button"+str(i)+"/levelLabel"
		var rankLabel = "level_select_button"+str(i)+"/rank"
		var timeLabel = "level_select_button"+str(i)+"/timeLabel"
		var time = savedata.d["level"+str(i)]["time"] 
		var rank = savedata.d["level"+str(i)]["rank"] 
		
		if i <= savedata.d["current_level"]:
			get_node(levelLabel).text = "Level " + str(i)
		
		if time is String:
			get_node(timeLabel).text = time
		else:
			var text = "%02d:%02d:%02d" % [int(time) / 60, int(time) % 60, int((time - int(time)) * 100)]
			get_node(timeLabel).text = text
			
		if rank in ["S", "A", "B", "C",]:
			get_node(rankLabel).texture = load("res://assets/UI Assets/" + rank + ".png")
		i += 1
	

func _on_level_select_button_1_pressed() -> void:
	get_tree().change_scene_to_packed(LEVEL1)

func _on_level_select_button_2_pressed() -> void:
	if savedata.d["current_level"] >= 2:
		get_tree().change_scene_to_packed(LEVEL2)
	
func _on_level_select_button_3_pressed() -> void:
	if savedata.d["current_level"] >= 3:
		get_tree().change_scene_to_packed(LEVEL3) 

func _on_level_select_button_4_pressed() -> void:
	if savedata.d["current_level"] >= 4:
		get_tree().change_scene_to_packed(LEVEL4)

func _on_level_select_tutorial_pressed() -> void:
	get_tree().change_scene_to_packed(TUT)
