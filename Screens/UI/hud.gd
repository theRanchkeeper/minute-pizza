extends CanvasLayer

onready var score : Label = $Control/HBoxContainer/ScoreDisplay/Label

func _ready() -> void:
	score.text = str(Global.score)

func _update_score() -> void :
	
	score.text = str(Global.score)


func _on_Main_upadte_ui() -> void:
	
	_update_score()
