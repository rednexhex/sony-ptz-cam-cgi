
table.insert(ctrls, {
  Name = "Online",
  ControlType = "Indicator",
  IndicatorType = "Led",
  PinStyle = "Output",
  Count = 1,
  UserPin = true
})

table.insert(ctrls, {
  Name = "ConnectionState",
  ControlType = "Indicator",
  IndicatorType = "Text",
  PinStyle = "Output",
  UserPin = true
})

-- Control Pins
--[[{
  Name = "CAM_Pan-Speed",
  ControlType = "Knob",
  ControlUnit = "Percent",
  Min = 1,
  Max = 100,
  UserPin = true,
  PinStyle = "Both"
},
{
  Name = "CAM_Zoom-Speed",
  ControlType = "Knob",
  ControlUnit = "Percent",
  Min = 1,
  Max = 100,
  UserPin = true,
  PinStyle = "Both"
},]]--

table.insert(ctrls, {
  Name = "PanTiltDrive-Up",
  ControlType = "Button",
  ButtonType = "Momentary",
  UserPin = true,
  PinStyle = "Input"
})

table.insert(ctrls, {
  Name = "PanTiltDrive-Dn",
  ControlType = "Button",
  ButtonType = "Momentary",
  UserPin = true,
  PinStyle = "Input"
})

table.insert(ctrls, {
  Name = "PanTiltDrive-Lt",
  ControlType = "Button",
  ButtonType = "Momentary",
  UserPin = true,
  PinStyle = "Input"
})

table.insert(ctrls, {
  Name = "PanTiltDrive-Rt",
  ControlType = "Button",
  ButtonType = "Momentary",
  UserPin = true,
  PinStyle = "Input"
})

table.insert(ctrls, {
  Name = "CAM_Zoom-Z+",
  ControlType = "Button",
  ButtonType = "Momentary",
  UserPin = true,
  PinStyle = "Input"
})

table.insert(ctrls, {
  Name = "CAM_Zoom-Z-",
  ControlType = "Button",
  ButtonType = "Momentary",
  UserPin = true,
  PinStyle = "Input"
})

table.insert(ctrls, {
  Name = "CAM_Memory-Set",
  ControlType = "Button",
  ButtonType = "Momentary",
  UserPin = true,
  PinStyle = "Input",
  Count = 128
})

table.insert(ctrls, {
  Name = "CAM_Memory-Recall",
  ControlType = "Button",
  ButtonType = "Momentary",
  UserPin = true,
  PinStyle = "Input",
  Count = 6
})