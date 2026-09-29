class_name Interactable
extends Node

@export var prompt_text: String = "Interact"

func interact(_player: CharacterBody3D) -> void:
	# Override this function in specific object scripts
	print("Interacted with: ", name)
