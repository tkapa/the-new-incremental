class_name CurrencySpender extends Node

signal can_purchase(can_purchase:bool)

var _value :int = 1000

func set_value(new_value: int) -> void:
	print_debug("Set new value ", new_value)
	_value = new_value
	_refresh()
	
func purchase() -> bool:
	if (!can_purchase):
		return false
	
	SignalBus.remove_currency.emit(_value)
	return true

func _refresh() -> void:
	_can_purchase()

func _on_currency_tracker_component_currency_updated(new_value: int) -> void:
	_can_purchase()
	
func _can_purchase() -> bool:
	var is_purchasable = CurrencyManager.can_afford(_value)
	can_purchase.emit(is_purchasable)
	
	return is_purchasable
