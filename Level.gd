extends Spatial

export (float, 0.0001, 100) var rotation_speed = PI
var score = 0
var crashes = 0
var gameState = "running"
var highScore = 0
var saveGame = File.new() #file
var save_path = "user://saveGame.save" #place of the file
var save_data = {"highscore": 0} #variable to store the data

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if not saveGame.file_exists(save_path):
		_create_save()
	highScore = _read_saveGame()
	print("highscore: %s" %highScore)
		
	var obstacles = get_tree().get_nodes_in_group("Obstacle")
#	print(obstacles.size())
	for obstacle in obstacles:
		obstacle.connect("crashed", self, "_on_obstacle_crash")
		
	var scorePlains = get_tree().get_nodes_in_group("ScorePlain")
	for scorePlain in scorePlains :
		scorePlain.connect("scored", self, "_on_score_collision")
func _on_score_collision():
	score += 1
	$UI/ScoreLabel.text = "Score: %s" % score
	
func _on_obstacle_crash():
#	print(crashes)
	if crashes == 23 :
		score = 0
	if crashes > 23 :
		if score > highScore:
			highScore = score
			_save(highScore)
		gameState = "ended"
		get_tree().paused = true
		$UI/HighscoreLabel.text = "Highscore: %s" %highScore
		$UI/HighscoreLabel.visible = true
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

#https://godotengine.org/qa/2080/save-record
func _create_save():
	saveGame.open(save_path, File.WRITE)
	saveGame.store_var(save_data)
	saveGame.close()
	
func _save(highScore):
	save_data["highscore"] = highScore #data to save
	saveGame.open(save_path, File.WRITE) #open file to write
	saveGame.store_var(save_data) #store the data
	saveGame.close() #close the file
	
func _read_saveGame():
	saveGame.open(save_path, File.READ) #open file
	save_data = saveGame.get_var() #get the value
	saveGame.close() #close the file
	return save_data["highscore"] #return the value

