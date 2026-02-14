extends Node

var _passives : Array[PurchasablePassive]

func _init() -> void:
	SignalBus.add_passive.connect(_on_add_passive)
	SignalBus.on_tick.connect(_on_tick)
	
func _on_add_passive(passive: PurchasablePassive):
	_passives.append(passive)

func _on_tick():
	for p in _passives:
		p.on_tick()
