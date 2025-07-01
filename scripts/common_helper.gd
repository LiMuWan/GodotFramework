class_name CommonHelper

static func create_instance_from_json(class_type: String, data):
	# 尝试动态加载类
	var script = load("res://scripts/configs/" + class_type + ".gd")
	if script:
		var instance = script.new()
		
		# 填充属性
		if data is Dictionary:
			for property_name in data.keys():
				if property_name in instance:
					# 处理数组类型
					if data[property_name] is Array and property_name.ends_with("_array"):
						instance[property_name] = data[property_name]
					# 处理基本类型
					else:
						instance[property_name] = data[property_name]
		
		return instance
	else:
		push_error("Could not load script for class: " + class_type)
		return null
