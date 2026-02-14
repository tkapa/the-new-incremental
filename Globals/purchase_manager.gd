extends Node

func _init():
	SignalBus.on_purchase.connect(_on_purchase)

func _on_purchase(item: PurchasablePassive):
	SignalBus.add_passive.emit(item)
