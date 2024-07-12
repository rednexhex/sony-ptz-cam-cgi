
function setConnState(msg)
  Controls["ConnectionState"].String = string.format("[%s:%d] %s",Properties["IP Host"].Value,Properties["IP Port"].Value,msg)
end

setConnState("Connecting")
-- Create and setup the Communications Timeout
timerComms = Timer.New()
timerComms.EventHandler = function(timer)
  timer:Stop()
  Controls.Online.Boolean = false
  setConnState("Timed Out")
end

-- Create and setup Polling
timerPoll = Timer.New()
timerPoll.EventHandler = function(timer)
  fnPoll()
end

function fnInitPoll()
  timerPoll:Stop()
  timerPoll:Start(20)
end

function httpFeedbackHandler(tbl, code, data, err, headers)
  print(string.format( "HTTP response from '%s': Return Code=%i; Error=%s", tbl.Url, code, err or "None" ) )
  if code == 200 then
    timerComms:Stop()
    Controls.Online.Boolean = true
    setConnState("Connected")
    timerComms:Start(45)
  end
  -- Process 'data'
end

function httpCommandHandler(tbl, code, data, err, headers)
  print(string.format( "HTTP response from '%s': Return Code=%i; Error=%s", tbl.Url, code, err or "None" ) )
  if code == 204 then
    timerComms:Stop()
    Controls.Online.Boolean = true
    timerComms:Start(45)
  end
end

function fnPoll()
  -- Poll the General Info
  HttpClient.Download { 
    Url = string.format("http://%s/command/inquiry.cgi?inq=ptzf",Properties["IP Host"].Value),
    Timeout = 5,
    User = Properties["Username"].Value,
    Password = Properties["Password"].Value,
    EventHandler = httpFeedbackHandler -- Set Connection ON / Timer start here
    }
  -- Poll the PTZF info
  HttpClient.Download { 
    Url = string.format("http://%s/command/inquiry.cgi?inq=ptzf",Properties["IP Host"].Value),
    Timeout = 5,
    User = Properties["Username"].Value,
    Password = Properties["Password"].Value,
    EventHandler = httpFeedbackHandler
    }
    fnInitPoll()
end

-- Data Sending Helper Function
function fnFireForget(path)
  -- Do without processing
  HttpClient.Download { 
    Url = string.format("http://%s/%s",Properties["IP Host"].Value,path),
    Timeout = 5,
    User = Properties["Username"].Value,
    Password = Properties["Password"].Value,
    EventHandler = httpCommandHandler
    }
    fnInitPoll()
end

function goPanTilt(dir)
  if dir == "" then -- Stop
    fnFireForget("command/ptzf.cgi?cancel=on") -- Stop
  else -- Move
    fnFireForget(string.format("command/ptzf.cgi?move=%s,10",dir)) -- Move
  end
end

function goZoom(dir)
  if dir == "" then
    fnFireForget("command/ptzf.cgi?cancel=on") -- Stop
  else
    fnFireForget(string.format("command/ptzf.cgi?move=%s,4",dir)) -- Move
  end
end
for k, v in pairs(Controls) do
  if k:sub(1, #"PanTiltDrive-") == "PanTiltDrive-" then
    v.EventHandler = function(changedControl)
      if changedControl.Boolean == true then
        if k:sub(-2, -1) == "Up" then
          goPanTilt("up") -- Up
        elseif k:sub(-2, -1) == "Dn" then
          goPanTilt("down") -- Down
        elseif k:sub(-2, -1) == "Lt" then
          goPanTilt("left") -- Left
        elseif k:sub(-2, -1) == "Rt" then
          goPanTilt("right") -- Right
        end
      else
        goPanTilt("") -- Stop
      end
    end
  elseif k:sub(1, #"CAM_Zoom-") == "CAM_Zoom-" then
    v.EventHandler = function(changedControl)
      if changedControl.Boolean == true then
        if k:sub(-2, -1) == "Z+" then
          goZoom("tele") -- In
        elseif k:sub(-2, -1) == "Z-" then
          goZoom("wide") -- Out
        end
      else
        goZoom("") -- Stop
      end
    end
  end
end
for i = 1, 6 do
  Controls["CAM_Memory-Set"][i].EventHandler = function()
    fnFireForget(string.format("command/presetposition.cgi?PresetSet=%d,Preset%0d,on",i,i))
  end
  Controls["CAM_Memory-Recall"][i].EventHandler = function()
    fnFireForget(string.format("command/presetposition.cgi?PresetCall=%d,%d",i,10))
  end
end
--[[Controls["CAM_Pan-Speed"].EventHandler = function()
  pt_speed = string.format("%X", Controls["CAM_Pan-Speed"].Value)
  print(pt_speed)
end]]
fnPoll()