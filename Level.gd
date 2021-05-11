extends Spatial

export (float, 0.0001, 100) var rotation_speed = PI

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	$CameraRef/Camera.look_at($Center/Player.translation, Vector3(0,0,0))
#	$CameraRef/Camera.rotate_y($Center/Player.translation.x + $Center/Player.translation.z)
	var target = $Center/Player.global_transform.origin
	$CameraRef/Camera.look_at(target, Vector3.UP)
	#https://kidscancode.org/godot_recipes/basics/rotation/
#	$Center.rotate_y(rotation_speed * delta)
	

