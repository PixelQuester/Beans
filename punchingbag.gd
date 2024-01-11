extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	linear_velocity *= 0.95

func knockback(other_position, strength):
	var direction : Vector2 = (global_position - other_position).normalized()
	linear_velocity += direction * strength

func die():
	queue_free()
