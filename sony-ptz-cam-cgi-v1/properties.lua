
table.insert(props, {
    Name = "IP Host",
    Type = "string",
    Value = "192.168.0.100"
  })

  table.insert(props, {
    Name = "Username",
    Type = "string",
    Value = ""
  })

  table.insert(props, {
    Name = "Password",
    Type = "string",
    Value = ""
  })

  table.insert(props, {
    Name = "IP Port",
    Type = "integer",
    Value = 80,
    Min = 80,
    Max = 65535
  })

  table.insert(props, {
    Name = "Preset Count",
    Type = "integer",
    Value = 6,
    Min = 1,
    Max = 64
  })

  table.insert(props, {
    Name = "Debug Print",
    Type = "enum",
    Choices = {"None", "Tx/Rx", "Tx", "Rx", "Function Calls", "All"},
    Value = "All"
  })