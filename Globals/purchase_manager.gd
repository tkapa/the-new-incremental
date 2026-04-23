extends Node

func _init():
	SignalBus.on_purchase.connect(_on_purchase)

func _on_purchase(item: PurchasableBase, value: int):
	print_debug("Purchasing: ", item.name)
	if (item is PurchasablePassive):
		SignalBus.add_passive.emit(item)

	SignalBus.remove_currency.emit(value)
	
func can_afford(value: int) -> bool:
	return value <= current_currency
