extends StaticBody2D

@export var rotationalSpeed: float = 5
@export var oppositeRotation: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(oppositeRotation):
		rotate(-rotationalSpeed/1000)
	else:
		rotate(rotationalSpeed/1000)
