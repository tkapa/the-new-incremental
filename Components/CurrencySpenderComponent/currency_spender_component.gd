class_name CurrencySpender extends Node

signal can_purchase(can_purchase:bool)

var _value :int = 1000

func set_value(new_value: int) -> void:
	_value = new_value
	_refresh()
	
func purchase(purchasable: PurchasableBase) -> bool:
	if (!_can_purchase()):
		return false
	
	print_debug("Run purchase: ", purchasable.name, " ", _value)
	SignalBus.on_purchase.emit(purchasable, _value)
	return true

func _on_currency_tracker_component_currency_updated(new_value: int) -> void:
	_refresh()

func _refresh() -> void:
	_can_purchase()

func _can_purchase() -> bool:
	var is_purchasable = PurchaseManager.can_afford(_value)
	can_purchase.emit(is_purchasable)
	
	return is_purchasable
