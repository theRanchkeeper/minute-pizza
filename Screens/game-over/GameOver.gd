extends Node2D


func _ready() -> void:
	
	$Control/HBoxContainer/TotalScore.text = str(Global.score)


func _on_Button_pressed() -> void:
	get_tree().quit()
