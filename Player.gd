extends RigidBody
export (float, 0.01, 100) var speed = 5
export (float, 1, 10000) var jumpForce = 0.1
export (float, -2, 10000) var fallForce = 0.05
export (float, 1, 10000) var radius = 40
export (float, 1, 360) var angle = 0

var _this
var _x
var _y 
var _z

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	_this = $"."
	_x = _this.translation.x
	_y = _this.translation.y
	_z = _this.translation.z

func _input(event):	
#	var force = Vector3(0,0,0)
	if event is InputEventKey and event.pressed :
			if event.scancode == KEY_SPACE:
				_y = _y + jumpForce
	elif event is InputEventScreenTouch :
		if event.is_pressed():
#			print("touched")
			_y = _y + jumpForce

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_y = _y - fallForce
	_x = radius * cos(angle)
	_z = radius * sin(angle)
	var vector3 = Vector3(_x, _y, _z)
	_this.translation = vector3
	angle += speed * ((PI*2)/360) * delta
	
