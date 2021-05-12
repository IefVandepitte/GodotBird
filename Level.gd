extends Spatial

export (float, 0.0001, 100) var rotation_speed = PI
var score = 0
var crashes = 0
var gameState = "running"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var obstacles = get_tree().get_nodes_in_group("Obstacle")
#	print(obstacles.size())
	for obstacle in obstacles:
		obstacle.connect("crashed", self, "_on_obstacle_crash")
		
	var scorePlains = get_tree().get_nodes_in_group("ScorePlain")
	for scorePlain in scorePlains :
		scorePlain.connect("scored", self, "_on_score_collision")
func _on_score_collision():
	score += 1
	$UI/Label.text = "Score: %s" % score
	
func _on_obstacle_crash():
	if crashes >= 4 :
		gameState = "ended"
		get_tree().paused = true
		$UI/GameOverControl.visible = true
		$UI/Button.visible = true
	crashes += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var target = $Center/Player.global_transform.origin
	$CameraRef/Camera.look_at(target, Vector3.UP)
#	pass

	#https://kidscancode.org/godot_recipes/basics/rotation/
#	$Center.rotate_y(rotation_speed * delta)
	

func _on_Button_pressed():
	print("pressed")
	get_tree().reload_current_scene()
	get_tree().paused = false



