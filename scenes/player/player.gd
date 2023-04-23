class_name Player
extends KinematicBody2D

export var speed : float = 300


var picked = false

signal pizza_picked


var _velocity : Vector2 = Vector2.ZERO
var _direction : Vector2 = Vector2.ZERO

export var mouse_sensitivity = 0.8


onready var player_sprite : AnimatedSprite = $Body
onready var cross_hair : Sprite = $RayCast2D/CrossHair


func _get_player_direction():
	
	var dir : Vector2 = Vector2.ZERO
	dir.x += Input.get_action_strength("RIGHT") - Input.get_action_strength("LEFT")
	dir.y += Input.get_action_strength("DOWN") - Input.get_action_strength("UP")
	
	return dir.normalized()


func _ready() -> void:
	
	look_at(get_global_mouse_position())


func _process(delta: float) -> void:
	
	if picked:
		player_sprite.play("yes_pizza")
		cross_hair.visible = false
	else:
		player_sprite.play("no_pizza")
		cross_hair.visible = true
	
	look_at(get_global_mouse_position() * mouse_sensitivity)
	look_at(get_global_mouse_position() * mouse_sensitivity)
	
	_pick_pizza()

func _physics_process(delta: float) -> void:
	
	_velocity = _direction * speed
	_velocity  = move_and_slide(_velocity)


func _unhandled_input(event: InputEvent) -> void:
	
	_direction = _get_player_direction()


func _pick_pizza():
	
	if $RayCast2D.is_colliding():
		
		var collided_body : Area2D = $RayCast2D.get_collider()
		
		if collided_body.is_in_group('pizza'):
			print("Pizza")
			
			if picked:
				print("Already have a pizza")
				
			else:
				
				var pizza = preload("res://scenes/pizza/Pizza.tscn").instance()
				if Input.is_action_just_pressed("Action"):
					picked = true
					collided_body.queue_free()
		else:
			
			print("oops")
			


func _on_PizzaCounter_pizza_deliverd() -> void:
	picked = false
	


