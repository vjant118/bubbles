extends Label

var totalTime: float = 0.0
var inProgress: bool = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation = 0
	if(inProgress):
		totalTime += delta
		updateTimer()

	
func updateTimer():
	var minutes = int(totalTime) / 60
	var seconds = int(totalTime) % 60
	var milliseconds = int((totalTime - int(totalTime)) * 100)
	
	text = "%02d:%02d:%02d" % [minutes, seconds, milliseconds]

func stopTimer():
	inProgress = false
