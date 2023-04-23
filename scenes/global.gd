extends Node


var score = 0


func _increase_score() -> void :
	
	score += 15


func _decrease_score() -> void :
	
	if score > 0 :
		score -= 5

func _change_scene(path):
	get_tree().change_scene(path)
