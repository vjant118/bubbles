extends StaticBody2D

@export var speed: float = 200.0
@export var activated: bool = true
var target: RigidBody2D = null

func _ready():
	target = get_tree().get_first_node_in_group("player")

func _process(delta):
	if target and activated:
		var direction = (target.global_position - global_position).normalized()
		global_position += direction * speed * delta
