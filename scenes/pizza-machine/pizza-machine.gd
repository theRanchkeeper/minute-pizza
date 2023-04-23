extends Node2D


var stop_machine : bool = false


func _on_Timer_timeout() -> void:
	
	if stop_machine:
		
		print("it stopped production")

	else:

		var pizza : Area2D = preload("res://scenes/pizza/Pizza.tscn").instance()
		pizza.global_position = $PizzaSpawner.global_position 
		get_tree().get_current_scene().add_child(pizza)


func _ready() -> void:
	$Timer.start()
