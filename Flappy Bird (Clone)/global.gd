extends Node

var score = 0
var stop = false
var finishScene = preload("res://finish.tscn")
var highest = 0
var start = false

const SAVE_PATH = 'res://savegame.bin'

func _ready():
	loadGame()
	
func on_stop():
	stop = true
	var finish = finishScene.instantiate()
	add_child(finish)
	
func reset():
	score = 0
	stop = false
	start = false
	
func saveGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data: Dictionary = {
		"highest": Global.highest
	}
	print(file, data)
	var jstr = JSON.stringify(data)
	file.store_line(jstr)
	
func loadGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if FileAccess.file_exists(SAVE_PATH) == true:
		if not file.eof_reached():
			var current_line = JSON.parse_string(file.get_line())
			if current_line:
				Global.highest = current_line['highest']
