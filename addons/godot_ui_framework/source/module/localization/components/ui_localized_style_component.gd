# source/module/localization/components/ui_localized_style_component.gd
extends UILocalizationComponent
class_name UILocalizedStyleComponent

## 样式类型
@export_enum("StyleBox", "Font", "Color", "Constant", "Icon") var style_type: String = "StyleBox"
## 样式名称
@export var style_name: String = "normal"

func _update_localization() -> void:
	var style = _localization_manager.get_localized_resource(key)
	if style and _owner is Control:
		match style_type:
			"StyleBox":
				_owner.add_theme_stylebox_override(style_name, style)
			"Font":
				_owner.add_theme_font_override(style_name, style)
			"Color":
				_owner.add_theme_color_override(style_name, style)
			"Constant":
				_owner.add_theme_constant_override(style_name, style)
			"Icon":
				_owner.add_theme_icon_override(style_name, style)
