extends Area

signal crashed
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
#	connect("body_entered", self, "_on_ObstacleRigidBody_body_entered")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

	 
func _on_ObstacleRigidBody_body_entered(body):
	print("crash")
	emit_signal("crashed")
