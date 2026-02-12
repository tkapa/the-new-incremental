class_name Purchasable extends Resource

enum Type { NONE, PASSIVE }

@export_category("Cost")
@export 
var base_cost: int = 1
@export 
var cost_increment : int = 1

@export_category("Description")
@export 
var name : String = "New Name"
@export 
var description : String = "Description"
@export
var _type : Type = Type.PASSIVE

func get_type() -> Type:
	return _type
