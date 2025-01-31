data.raw["gui-style"].default[nindycore.core.gui.styles["F-1"]] =
{
	type = "frame_style",
	graphical_set = {},
	border = border_image_set(),
	right_padding = 4,
	use_header_filler = false,
	title_style =
	{
	  type="label_style",
	  parent = "caption_label"
	}
}

local outer_frame_light = outer_frame_light()
outer_frame_light.base.center = {position = {42,8}, size=1}
data.raw["gui-style"].default[nindycore.core.gui.styles["SP-1"]] =
{
	type = "scroll_pane_style",
	padding = 0,
	extra_padding_when_activated = 0,
	extra_right_padding_when_activated = -12,
	graphical_set = outer_frame_light,
	background_graphical_set = {
		base = {
			position = {282, 17},
			corner_size = 8,
			overall_tiling_horizontal_padding = 0,
			overall_tiling_horizontal_size = 37,
			overall_tiling_horizontal_spacing = 0,
			overall_tiling_vertical_padding = 0,
			overall_tiling_vertical_size = 37,
			overall_tiling_vertical_spacing = 0
	  	}
	  }
}

data.raw["gui-style"].default[nindycore.core.gui.styles["B-1"]] =
{
	type = "button_style",
	--parent = "button",
	minimal_width = 40,
	minimal_height = 40,
	default_graphical_set =
	{
		base = {position={0, 17}, corner_size=8, tint={255, 255, 255}},
		shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
	},
	hovered_graphical_set =
	{
		base = {position={34, 17}, corner_size=8, tint={255, 255, 255}},
		shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
	},
	clicked_graphical_set =
	{
		base = {position={51, 17}, corner_size=8, tint={255, 255, 255}},
		shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
	}
}

data.raw["gui-style"].default[nindycore.core.gui.styles["B-2"]] =
{
	type = "button_style",
	--parent = "button",
	minimal_width = 40,
	minimal_height = 40,
	default_graphical_set =
	{
		base = {position={68, 0}, corner_size=8, tint={255, 255, 255}},
		shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
	},
	hovered_graphical_set =
	{
		base = {position={68, 0}, corner_size=8, tint={255, 255, 255}},
		shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
	},
	clicked_graphical_set =
	{
		base = {position={68, 0}, corner_size=8, tint={255, 255, 255}},
		shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
	}
}

data.raw["gui-style"].default[nindycore.core.gui.styles["B-3"]] =
{
	type = "button_style",
	--parent = "button",
	minimal_width = 40,
	minimal_height = 40,
	default_graphical_set =
	{
		base = {position={136, 17}, corner_size=8, tint={255, 255, 255}},
		shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
	},
	hovered_graphical_set =
	{
		base = {position={136, 17}, corner_size=8, tint={255, 255, 255}},
		shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
	},
	clicked_graphical_set =
	{
		base = {position={136, 17}, corner_size=8, tint={255, 255, 255}},
		shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
	}
}