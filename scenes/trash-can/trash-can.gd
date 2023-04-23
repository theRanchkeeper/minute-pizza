extends Area2D

signal pizza_trashed

func _ready() -> void:
	pass


func _on_TrashCan_area_entered(area: Area2D) -> void:
	
	if area.is_in_group('pizza'):
		area.queue_free()
		emit_signal("pizza_trashed")
