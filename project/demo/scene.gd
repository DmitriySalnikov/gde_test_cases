@tool
extends Node

func _ready() -> void:
	print("Hello GDScript!")
	$MyNode.hello_node()
	MySingleton.hello_singleton()

func _process(delta):
	Engine.get_singleton(&"MySingleton").hello_singleton()
	MySingleton.hello_singleton()
