extends CharacterBody2D

@export var speed : float = 200.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	var ymove = Input.get_axis("ui_down","ui_up")
	var xmove = Input.get_axis("ui_left","ui_right")
	var direction = Vector2(xmove, ymove).normalized()
	
	global_position += direction * delta * speed
	
	
	
