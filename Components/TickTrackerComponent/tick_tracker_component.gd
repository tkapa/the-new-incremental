class_name TickTracker extends Node

signal on_tick

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.on_tick.connect(_on_tick)

func _on_tick():
	on_tick.emit()
