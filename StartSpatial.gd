extends Spatial


# Declare member variables here. Examples:
var saveGame = File.new() #file
var save_path = "user://saveGame.save" #place of the file
var save_data = {"highscore": 0} #variable to store the data


# Called when the node enters the scene tree for the first time.
func _ready():
	$StartUI/HighScoreLabel.text = "Highscore: %s" % _read_saveGame()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _read_saveGame():
	saveGame.open(save_path, File.READ) #open file
	save_data = saveGame.get_var() #get the value
	saveGame.close() #close the file
	return save_data["highscore"] #return the value


func _on_startButton_pressed():
	get_tree().change_scene("res://Level.tscn")
