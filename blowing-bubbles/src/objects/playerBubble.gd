extends RigidBody2D
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if ! freeze: 
		check_bodies()
		checkWin()

func check_bodies(): 
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.is_in_group("hazards"):
			%Timer.stopTimer()
			$AnimatedSprite2D.hide()
			$McIdle.hide()
			$AudioStreamPlayer.play()
			set_deferred("freeze", true)
			$CanvasLayer/DiedUi.show()
			
			
func checkWin():
	var bodies = $Area2D.get_overlapping_areas()
	
	for body in bodies:
		if body.is_in_group("levelEndPoint"):
			%Timer.stopTimer()
			set_deferred("freeze", true)
			if get_tree().current_scene.name != "LevelTut":
				saveScore()
			$CanvasLayer/Control.show()
			$CanvasLayer/Control/Cleared/Label2.text = "Time: " + str(%Timer.text)

func saveScore():
	var level = get_tree().current_scene.name
	var time = %Timer.totalTime
	print(savedata.d[level]["time"])
	if savedata.d[level]["time"] is String:
		savedata.d[level]["time"] = time
		getRank(level, time)		
	elif savedata.d[level]["time"] < time:
		savedata.d[level]["time"] = time
		getRank(level, time)
	unlockLevel(level)

func getRank(level, time: float):
	if time <= 80.00:
		savedata.d[level]["rank"] = "S"
	elif time <= 90.00:
		savedata.d[level]["rank"] = "A"
	elif time <= 100.00:
		savedata.d[level]["rank"] = "B"
	else:
		savedata.d[level]["rank"] = "C"
	$CanvasLayer/Control/Cleared/rank.texture = load("res://assets/UI Assets/" + savedata.d[level]["rank"] + ".png")

func unlockLevel(level):
	var cur = savedata.d["current_level"]
	if level == "level1" and cur == 1:
		savedata.d["current_level"] = 2
	elif level == "level2" and cur == 2:
		savedata.d["current_level"] = 3
	elif level == "level3" and cur == 3:
		savedata.d["current_level"] = 4
		
		
