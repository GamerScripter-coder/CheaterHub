local env = getgenv()
env.CustomFunctions = true

function env.firesignal(Signal, Args)
   if typeof(Signal) ~= "Instance" then return end
   
   if Signal:IsA("RemoteEvent") then
      Signal:FireServer(Args)
   end
   if Signal:IsA("RemoteFunction") then
      Signal:InvokeServer(Args)
   end
end

function env.firetouchinterest(Part, ToTouch, Toggle)
   if Toggle == true then
      local lastpos = ToTouch.CFrame
      ToTouch.CFrame = Part.CFrame
      task.wait(0.5)
      ToTouch.CFrame = lastpos
   end
   -- La riga 'if Toggle == false then return end' è stata rimossa in quanto ridondante.
end

function env.SafeWaitForChild(Parent, ChildName)
   local child
   repeat
        child = Parent:FindFirstChild(ChildName)
   until child and child ~= nil

   return child
end

function env.ScreenPlay()
   local Players = game:GetService("Players")
   local UserInputService = game:GetService("UserInputService")

   local player = Players.LocalPlayer

   ----------------------------------------------------
   -- GUI
   ----------------------------------------------------

   local gui = Instance.new("ScreenGui")
   gui.Name = "ControlsUI"
   gui.ResetOnSpawn = false
   gui.Parent = player.PlayerGui


   local main = Instance.new("Frame")
   main.Size = UDim2.fromOffset(250,180)
   main.Position = UDim2.fromScale(0.05,0.75)
   main.BackgroundTransparency = 1
   main.Parent = gui


   ----------------------------------------------------
   -- FUNZIONE CREAZIONE TASTI
   ----------------------------------------------------

   local function createButton(parent,name,text,pos)

      local b = Instance.new("TextLabel")

      b.Name=name
      b.Text=text
      b.Size=UDim2.fromOffset(55,55)
      b.Position=pos

      b.BackgroundColor3=Color3.fromRGB(45,45,45)
      b.TextColor3=Color3.new(1,1,1)

      b.Font=Enum.Font.GothamBold
      b.TextScaled=true

      b.Parent=parent


      local corner=Instance.new("UICorner")
      corner.CornerRadius=UDim.new(0,8)
      corner.Parent=b


      return b
   end



   ----------------------------------------------------
   -- KEYBOARD
   ----------------------------------------------------

   local keyboard=Instance.new("Frame")
   keyboard.Size=UDim2.fromScale(1,1)
   keyboard.BackgroundTransparency=1
   keyboard.Parent=main


   local keys={}


   keys.W=createButton(
      keyboard,
      "W",
      "W",
      UDim2.fromOffset(100,0)
   )


   keys.A=createButton(
      keyboard,
      "A",
      "A",
      UDim2.fromOffset(35,65)
   )


   keys.S=createButton(
      keyboard,
      "S",
      "S",
      UDim2.fromOffset(100,65)
   )


   keys.D=createButton(
      keyboard,
      "D",
      "D",
      UDim2.fromOffset(165,65)
   )



   ----------------------------------------------------
   -- CONTROLLER
   ----------------------------------------------------

   local controller=Instance.new("Frame")
   controller.Size=UDim2.fromScale(1,1)
   controller.BackgroundTransparency=1
   controller.Visible=false
   controller.Parent=main


   local pads={}


   local function pad(name,text,x,y)

      local p=createButton(
         controller,
         name,
         text,
         UDim2.fromOffset(x,y)
      )

      pads[name]=p

   end


   pad("ButtonA","A",160,50)
   pad("ButtonB","B",220,0)
   pad("ButtonX","X",100,0)
   pad("ButtonY","Y",160,-50)
   pad("Stick","◉",30,50)



   ----------------------------------------------------
   -- COLORI
   ----------------------------------------------------

   local normalColor=Color3.fromRGB(45,45,45)
   local pressedColor=Color3.new(1,1,1)


   local function setPressed(button,state)

      if not button then return end


      if state then

         button.BackgroundColor3=pressedColor
         button.TextColor3=Color3.new(0,0,0)

      else

         button.BackgroundColor3=normalColor
         button.TextColor3=Color3.new(1,1,1)

      end

   end



   ----------------------------------------------------
   -- CAMBIO DISPOSITIVO
   ----------------------------------------------------

   local function keyboardMode()

      keyboard.Visible=true
      controller.Visible=false

   end


   local function controllerMode()

      keyboard.Visible=false
      controller.Visible=true

   end



   ----------------------------------------------------
   -- TASTI
   ----------------------------------------------------

   UserInputService.InputBegan:Connect(function(input,gameProcessed)

      if gameProcessed then return end


      if input.UserInputType==Enum.UserInputType.Keyboard then

         keyboardMode()


         local name=input.KeyCode.Name

         if keys[name] then
            setPressed(keys[name],true)
         end


      elseif input.UserInputType==Enum.UserInputType.Gamepad1 then

         controllerMode()


         local name=input.KeyCode.Name


         local map={

            ButtonA="ButtonA",
            ButtonB="ButtonB",
            ButtonX="ButtonX",
            ButtonY="ButtonY"

         }


         if map[name] then
            setPressed(pads[map[name]],true)
         end

      end

   end)



   ----------------------------------------------------
   -- RILASCIO
   ----------------------------------------------------

   UserInputService.InputEnded:Connect(function(input)


      if input.UserInputType==Enum.UserInputType.Keyboard then

         local name=input.KeyCode.Name

         if keys[name] then
            setPressed(keys[name],false)
         end


      elseif input.UserInputType==Enum.UserInputType.Gamepad1 then


         local name=input.KeyCode.Name


         local map={

            ButtonA="ButtonA",
            ButtonB="ButtonB",
            ButtonX="ButtonX",
            ButtonY="ButtonY"

         }


         if map[name] then
            setPressed(pads[map[name]],false)
         end

      end


   end)



   ----------------------------------------------------
   -- STICK
   ----------------------------------------------------

   UserInputService.InputChanged:Connect(function(input)

      if input.UserInputType==Enum.UserInputType.Gamepad1 then

         controllerMode()

         if input.KeyCode==Enum.KeyCode.Thumbstick1 then

            if math.abs(input.Position.X)>.2 
            or math.abs(input.Position.Y)>.2 then

               setPressed(pads.Stick,true)

            else

               setPressed(pads.Stick,false)

            end

         end

      end

   end)
end

-- Chiama ScreenPlay() all'inizio
env.ScreenPlay()

-- Se queue_on_teleport esiste, lo usa per richiamare ScreenPlay() dopo un teletrasporto.
-- Questo assicura che la GUI venga ricreata correttamente.
if queue_on_teleport then
   queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/GamerScripter-coder/CheaterHub/refs/heads/main/customfunc.lua', true))()")
end
