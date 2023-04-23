extends Node2D

signal upadte_ui

onready var timer_display : Label = $Timer/Clock/Label
onready var game_clock  : Timer = $GameClock
onready var pizza_counter : Area2D = $PizzaCounter

onready var counter_one : Position2D = $CounterOne
onready var counter_two : Position2D = $CounterTwo

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	$GameClock.start()
	pizza_counter.global_position = counter_one.global_position
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	
	

func _on_PizzaCounter_pizza_deliverd() -> void:
	
	Global._increase_score()
	emit_signal("upadte_ui")



func _on_TrashCan_pizza_trashed() -> void:
	
	Global._decrease_score()
	emit_signal("upadte_ui")


func _on_GameClock_timeout() -> void:
	
	get_tree().change_scene("res://Screens/game-over/GameOver.tscn")

func _process(delta: float) -> void:
	
	timer_display.text = str(game_clock.time_left).get_slice('.',0)
	

func _on_SwapCounter_timeout() -> void:
	
	if pizza_counter.global_position != counter_two.global_position :
		
		pizza_counter.global_position = counter_two.global_position
		
	elif pizza_counter.global_position != counter_one.global_position:
		
		pizza_counter.global_position = counter_one.global_position
		
	else:
			
		pizza_counter.global_position = counter_one.global_position


func _input(event):
	
	if event.is_action_pressed("ui_cancel"):
		
		if Input.mouse_mode == Input.MOUSE_MODE_CONFINED:
			
			Input.mouse_mode = !Input.MOUSE_MODE_CONFINED
			
		else:
			
			Input.mouse_mode = Input.MOUSE_MODE_CONFINED
