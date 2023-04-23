extends Area2D

var ordering = true

signal pizza_deliverd

func _on_PizzaCounter_body_entered(body: Node) -> void:
	
	if body.is_in_group('player'):
		print("player")
		var player : Player = body
		
		if player.picked:
			emit_signal("pizza_deliverd")
			print("pizza_deliverd")

