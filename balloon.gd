extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func collect():
	queue_free()

var numPartyHats = 0
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		queue_free()
		numPartyHats += 1
	pass # Replace with function body.
