
props = {
  {
    Name = "IP Host",
    Type = "string",
    Value = "192.168.0.100"
  },
  {
    Name = "Username",
    Type = "string",
    Value = ""
  },
  {
    Name = "Password",
    Type = "string",
    Value = ""
  },
  {
    Name = "IP Port",
    Type = "integer",
    Value = 80,
    Min = 80,
    Max = 65535
  },
  {
    Name = "Preset Count",
    Type = "integer",
    Value = 6,
    Min = 1,
    Max = 64
  }
}

table.insert(props, {
  Name = "Debug Print",
  Type = "enum",
  Choices = {"None", "Tx/Rx", "Tx", "Rx", "Function Calls", "All"},
  Value = "All"
})