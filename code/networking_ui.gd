extends Control


func _on_server_pressed() -> void:
	Networkhandler.start_server()
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_client_pressed() -> void:
	Networkhandler.start_client()
	get_tree().change_scene_to_file("res://scenes/game.tscn")
