extends RigidBody
export (float, 0.01, 100) var speed = 5
export (float, 1, 10000) var jumpForce = 5
export (float, 1, 10000) var fallForce = 500
export (float, 1, 10000) var radius = 40
export (float, 1, 360) var angle = 0

var _this
var _x
var _y = 10
var _z

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	_this = $"."
	_x = _this.translation.x

func _input(event):	
#	print(_this.translation)
	var force = Vector3(0,0,0)
	if event is InputEventKey and event.pressed :
			if event.scancode == KEY_SPACE:
				force = Vector3(0, jumpForce, 0)
#				_this.translation.y += jumpForce
	elif event is InputEventScreenTouch :
		print("touched")
		force = Vector3(0, jumpForce, 0)
#		_this.translation.y += jumpForce		
	apply_central_impulse(force.normalized() * speed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_x = radius * cos(angle)
	_z = radius * sin(angle)
	var vector3 = Vector3(_x, _y, _z)
	_this.translation = vector3
	print(_this.translation)
	angle += speed * ((PI*2)/360) * delta
	
