PluginInfo = {
  Name = "Matty~Sony~Sony-PTZ-CGI-CONTROL",
  Version = "1.0",
  BuildVersion = "1.0.0.15",
  Id = "c61db988-24a5-48da-80b7-5e310c66ec8d",
  Author = "Matty",
  Description = "SonyPTZCGI",
  ShowDebug = true 
}

local Colors = {
	White = {255, 255, 255},
	Black = {0, 0, 0},
	Red = {255, 0, 0},
	Green = {0, 255, 0}
}

function GetColor(props)
    return Colors.Black
end

felogo = "--[[ #encode "./images/fesolution.png" ]]"

sig = "--[[ #encode "./images/MATTY.png" ]]"

print("<Insert Cool Easter Egg Saying Here")