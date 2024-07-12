
--------  Graphic Elements  -------

table.insert(graphics,{
  Type = "Text",
  Text = "Build Info",
  FontSize = 12,
  HTextAlign = "Left",
  Position = {0, 370},
  Size = {62, 20}
})
table.insert(graphics,{
  Type = "Text",
  Text = "v" .. PluginInfo.BuildVersion,
  FontSize = 12,
  HTextAlign = "Left",
  Position = {0, 390},
  Size = {62, 20}
})
table.insert(graphics,{
  Type="Image",
  Image=sig,
  Position={0,350},
  Size={20,23}
  })

table.insert(graphics,{
  Type="Image",
  Image=felogo,
  Position={120,360},
  Size={175,40}
  })


  local ActiveRemote = props["page_index"].Value
	preset_count = props["Preset Count"].Value

	local layout = {}
	local row_size = 6

	local btn_size = {48, 24}
	local title_size = {row_size * btn_size[1], btn_size[2]}
	local txt_size = {2 * btn_size[1], btn_size[2]}
	local status_groupbox_size = {title_size[1], 3 * btn_size[2]}
	local ptz_groupbox_position = {0, title_size[2] + status_groupbox_size[2] + (0.5 * btn_size[2])}
	local ptz_groupbox_size = {row_size * btn_size[1], 5 * btn_size[2]}
	local presets_groupbox_position = {0, ptz_groupbox_position[2] + ptz_groupbox_size[2] + (0.5 * btn_size[2])}
	local presets_groupbox_size = {
		row_size * btn_size[1],
		btn_size[2] + (2 * btn_size[2]) * (math.floor((props["Preset Count"].Value - 1) / row_size) + 1)
	}

	-- Status Info Section

table.insert(graphics,{
  Type = "Header",
  Text = "Sony PTZ Camera",
  HTextAlign = "Center",
  Color = Colors.black,
  FontSize = 16,
  Position = {0, 0},
  Size = title_size
})

table.insert(graphics,{
  Type = "GroupBox",
  Text = "Status",
  HTextAlign = "Left",
  Fill = Colors.White,
  CornerRadius = 8,
  StrokeColor = Colors.Black,
  Color = Colors.Black,
  StrokeWidth = 1,
  Position = {0, title_size[2]},
  Size = status_groupbox_size
})

table.insert(graphics,{
  Type = "Text",
  Text = "Online:",
  Font = "Roboto",
  FontSize = 12,
  FontStyle = "Bold",
  HTextAlign = "Right",
  Color = Colors.Black,
  Position = {0, title_size[2] + (0.5 * btn_size[2])},
  Size = txt_size
})

table.insert(graphics,{
  Type = "Text",
  Text = "IP Address:",
  Font = "Roboto",
  FontSize = 12,
  FontStyle = "Bold",
  HTextAlign = "Right",
  Color = Colors.Black,
  Position = {0, title_size[2] + (1.5 * btn_size[2])},
  Size = txt_size
})
--[[{
  Type = "Text",
  Text = "Firmware:",
  Font = "Roboto",
  FontSize = 12,
  FontStyle = "Bold",
  HTextAlign = "Right",
  Color = Colors.Black,
  Position = {0, title_size[2] + (2.5 * btn_size[2])},
  Size = txt_size
},]]--

table.insert(graphics,{
  Type = "GroupBox", -- This is the overall groupbox that will give the plugin a more 'contained' look
  Text = "PTZ",
  HTextAlign = "Left",
  Fill = Colors.White,
  CornerRadius = 8,
  StrokeColor = Colors.Black,
  Color = Colors.Black,
  StrokeWidth = 1,
  Position = ptz_groupbox_position,
  Size = ptz_groupbox_size
})

table.insert(graphics,{
  Type = "Text",
  Text = "Pan/Tilt:",
  Font = "Roboto",
  FontSize = 12,
  FontStyle = "Bold",
  HTextAlign = "Right",
  Color = Colors.Black,
  Position = {ptz_groupbox_position[1], ptz_groupbox_position[2] + btn_size[2]},
  Size = txt_size
})

table.insert(graphics,{
  Type = "Text",
  Text = "Zoom:",
  Font = "Roboto",
  FontSize = 12,
  FontStyle = "Bold",
  HTextAlign = "Right",
  Color = Colors.Black,
  Position = {ptz_groupbox_position[1], ptz_groupbox_position[2] + (2 * btn_size[2])},
  Size = txt_size
})
--[[{
  Type = "Text",
  Text = "Pan/Tilt Speed:",
  Font = "Roboto",
  FontSize = 12,
  FontStyle = "Bold",
  HTextAlign = "Right",
  Color = Colors.Black,
  Position = {ptz_groupbox_position[1], ptz_groupbox_position[2] + (3 * btn_size[2])},
  Size = txt_size
},
{
  Type = "Text",
  Text = "Zoom Speed:",
  Font = "Roboto",
  FontSize = 12,
  FontStyle = "Bold",
  HTextAlign = "Right",
  Color = Colors.Black,
  Position = {ptz_groupbox_position[1], ptz_groupbox_position[2] + (4 * btn_size[2])},
  Size = txt_size
},]]--

table.insert(graphics,{
  Type = "GroupBox", -- This is the overall groupbox that will give the plugin a more 'contained' look
  Text = "Presets",
  HTextAlign = "Left",
  Fill = Colors.White,
  CornerRadius = 8,
  StrokeColor = Colors.Black,
  Color = Colors.Black,
  StrokeWidth = 1,
  Position = presets_groupbox_position,
  Size = presets_groupbox_size
})


layout["Online"] = {
PrettyName = "Online",
Style = "Indicator",
Color = {0, 255, 0},
OffColor = {200, 0, 0},
UnlinkOffColor = true,
Margin = 4,
Position = {txt_size[1], title_size[2] + (0.5 * btn_size[2])},
Size = {btn_size[2], btn_size[2]}
}

layout["ConnectionState"] = {
PrettyName = "Connection State",
Style = "Text",
HTextAlign = "Left",
Padding = 4,
StrokeWidth = 0,
Position = {txt_size[1], title_size[2] + (1.5 * btn_size[2])},
Size = {2 * btn_size[1], btn_size[2]}
}

--[[layout["FirmwareVersion"] = {
PrettyName = "Firmware",
Style = "Text",
HTextAlign = "Left",
Padding = 4,
StrokeWidth = 0,
Position = {txt_size[1], title_size[2] + (2.5 * btn_size[2])},
Size = {2 * btn_size[1], btn_size[2]}
}]]--

-- PTZ section

layout["PanTiltDrive-Up"] = {
PrettyName = "PTZ~Tilt Up",
Legend = "Up",
Style = "Button",
ButtonStyle = "Momentary",
Position = {ptz_groupbox_position[1] + txt_size[1] + (0 * btn_size[1]), ptz_groupbox_position[2] + btn_size[2]},
Size = btn_size
}

layout["PanTiltDrive-Dn"] = {
PrettyName = "PTZ~Tilt Down",
Legend = "Down",
Style = "Button",
ButtonStyle = "Momentary",
Position = {ptz_groupbox_position[1] + txt_size[1] + (1 * btn_size[1]), ptz_groupbox_position[2] + btn_size[2]},
Size = btn_size
}

layout["PanTiltDrive-Lt"] = {
PrettyName = "PTZ~Pan Left",
Legend = "Left",
Style = "Button",
ButtonStyle = "Momentary",
Position = {ptz_groupbox_position[1] + txt_size[1] + (2 * btn_size[1]), ptz_groupbox_position[2] + btn_size[2]},
Size = btn_size
}

layout["PanTiltDrive-Rt"] = {
PrettyName = "PTZ~Pan Right",
Legend = "Right",
Style = "Button",
ButtonStyle = "Momentary",
Position = {ptz_groupbox_position[1] + txt_size[1] + (3 * btn_size[1]), ptz_groupbox_position[2] + btn_size[2]},
Size = btn_size
}

layout["CAM_Zoom-Z+"] = {
PrettyName = "PTZ~Zoom In",
Legend = "In",
Style = "Button",
ButtonStyle = "Momentary",
Position = {ptz_groupbox_position[1] + txt_size[1] + (0 * btn_size[1]), ptz_groupbox_position[2] + (2 * btn_size[2])},
Size = btn_size
}

layout["CAM_Zoom-Z-"] = {
PrettyName = "PTZ~Zoom Out",
Legend = "Out",
Style = "Button",
ButtonStyle = "Momentary",
Position = {ptz_groupbox_position[1] + txt_size[1] + (1 * btn_size[1]), ptz_groupbox_position[2] + (2 * btn_size[2])},
Size = btn_size
}

--[[layout["CAM_Pan-Speed"] = {
PrettyName = "PTZ Speed~Pan/Tilt",
Style = "Text Field",
Margin = 2,
Position = {ptz_groupbox_position[1] + txt_size[1] + 0 * btn_size[1], ptz_groupbox_position[2] + (3 * btn_size[2])},
Size = {2 * btn_size[1], btn_size[2]}
}
layout["CAM_Zoom-Speed"] = {
PrettyName = "PTZ Speed~Zoom",
Style = "Text Field",
Margin = 2,
Position = {ptz_groupbox_position[1] + txt_size[1] + 0 * btn_size[1], ptz_groupbox_position[2] + (4 * btn_size[2])},
Size = {2 * btn_size[1], btn_size[2]}
}]]--

-- Presets Section

for i = 1, preset_count do -- For each preset
local row = math.floor((i - 1) / row_size) + 1
local column = i - (row - 1) * row_size
layout["CAM_Memory-Recall " .. i] = {
  PrettyName = "Preset Recall~" .. (i - 1),
  Style = "Button",
  Color = Colors.Green,
  Legend = "Recall " .. (i - 1),
  Position = {
    presets_groupbox_position[1] + btn_size[1] * (column - 1),
    presets_groupbox_position[2] + (2 * btn_size[2] * row) - btn_size[2]
  },
  Size = btn_size
}

layout["CAM_Memory-Set " .. i] = {
  PrettyName = "Preset Save~" .. (i - 1),
  Style = "Button",
  Color = Colors.Red,
  Legend = "Save " .. (i - 1),
  Position = {
    presets_groupbox_position[1] + btn_size[1] * (column - 1),
    presets_groupbox_position[2] + (2 * btn_size[2] * row)
  },
  Size = btn_size
  }
end