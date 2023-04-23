extends Area2D

export var pizza_speed : float = 400

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	
	position.x += pizza_speed * delta
