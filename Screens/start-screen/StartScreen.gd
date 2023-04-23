extends Node2D

func _ready() -> void:
	pass
	

func _on_Yes_pressed() -> void:
	
	Global._change_scene("res://level/Main.tscn")


func _on_No_pressed() -> void:
	
	get_tree().quit()
