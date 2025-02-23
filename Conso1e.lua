local guiyyy = Instance.new("ScreenGui")
local TweenService = game:GetService("TweenService")
guiyyy.Name = "LoadScreen"
guiyyy.Parent = game.CoreGui

local loadscreen = Instance.new("ImageLabel", guiyyy)
Instance.new("UICorner", loadscreen)

local titleLabel = Instance.new("TextLabel", guiyyy) 
titleLabel.Size = UDim2.new(0.233, 0, 0.075, 0)
titleLabel.Position = UDim2.new(0.5, 0, 0.4, 0) -- Позиция для названия
titleLabel.BackgroundTransparency = 1
titleLabel.TextTransparency = 1
titleLabel.AnchorPoint = Vector2.new(0.5, 0.5)
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.Arcade
titleLabel.TextColor3 = Color3.fromRGB(0, 255, 0) -- Цвет текста по умолчанию
titleLabel.Text = "👾 Meetlook Hub V2"

local timerLabel = Instance.new("TextLabel", guiyyy)
timerLabel.Size = UDim2.new(0.233, 0, 0.075, 0)
timerLabel.Position = UDim2.new(0.5, 0, 0.65, 0) -- Позиция для таймера
timerLabel.BackgroundTransparency = 1
timerLabel.TextTransparency = 1
timerLabel.AnchorPoint = Vector2.new(0.5, 0.5)
timerLabel.TextScaled = true
timerLabel.Font = Enum.Font.Arcade
timerLabel.TextColor3 = Color3.fromRGB(0, 255, 0) -- Цвет текста по умолчанию

loadscreen.UICorner.CornerRadius = UDim.new(0.125, 0)
loadscreen.Size = UDim2.new(0.233, 0, 0.4, 0)
loadscreen.Image = "rbxthumb://type=Asset&id=112678581332750&w=150&h=150"
loadscreen.Position = UDim2.new(0.5, 0, 0.5, 0) -- Позиция по центру экрана
loadscreen.AnchorPoint = Vector2.new(0.5, 0.5)
loadscreen.BorderSizePixel = 0
loadscreen.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
loadscreen.ImageTransparency = 1
loadscreen.BackgroundTransparency = 1

task.wait(0.10)

TweenService:Create(loadscreen, TweenInfo.new(1.5), {ImageTransparency = 0, BackgroundTransparency = 0}):Play()
TweenService:Create(titleLabel, TweenInfo.new(1.5), {TextTransparency = 0}):Play() -- Название появляется
TweenService:Create(timerLabel, TweenInfo.new(1.5), {TextTransparency = 0}):Play() -- Таймер появляется

--Таймер
local secondsLeft = 7

-- Эффект мигания изображения
local function blinkImage()
    while secondsLeft > 0 do
        TweenService:Create(loadscreen, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
        task.wait(1.10)
        TweenService:Create(loadscreen, TweenInfo.new(0.5), {ImageTransparency = 1}):Play()
        task.wait(1.10)
    end
end

coroutine.wrap(blinkImage)()

while secondsLeft > 0 do
    
    if secondsLeft <= 2 then
        timerLabel.TextColor3 = Color3.fromRGB(255, 0, 0) -- Меняем цвет таймера на красный
    else
        timerLabel.TextColor3 = Color3.fromRGB(0, 255, 0) -- Цвет таймера по умолчанию
    end

    timerLabel.Text = string.format("Loading... [%d]", secondsLeft)
    task.wait(1)
    secondsLeft = secondsLeft - 1
end

-- Обновление текста на финальный
timerLabel.Text = "Loading Complete [✅]"
timerLabel.TextColor3 = Color3.fromRGB(0, 255, 0) -- Устанавливаем цвет текста обратно на зеленый
task.wait(1) -- Задержка перед удалением

-- Завершение анимации
local moveUpOffset = UDim2.new(0, 0, -0.5, 0)

TweenService:Create(loadscreen, TweenInfo.new(1.5), {Position = loadscreen.Position + moveUpOffset, ImageTransparency = 1, BackgroundTransparency = 1}):Play()
TweenService:Create(titleLabel, TweenInfo.new(1.5), {TextTransparency = 1, Position = titleLabel.Position + moveUpOffset}):Play() -- Название уходит
TweenService:Create(timerLabel, TweenInfo.new(1.5), {TextTransparency = 1, Position = timerLabel.Position + moveUpOffset}):Play() -- Таймер уходит
task.wait(1.10)

guiyyy:Destroy()






--/ Logo
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MeetlookHubGui"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local textLabel = Instance.new("TextLabel")
textLabel.Text = "Meetlook Hub V2"
textLabel.Size = UDim2.new(0, 190, 0, 40) -- Размер текста
textLabel.Position = UDim2.new(0, 10, 0, -8) -- Позиция в левом верхнем углу
textLabel.BackgroundTransparency = 1 -- Прозрачный фон
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- Начальный цвет текста (белый)
textLabel.TextScaled = true -- Масштабирование текста
textLabel.Parent = screenGui -- Добавляем текст в ScreenGui

textLabel.Font = Enum.Font.Arcade -- Шрифт текста
textLabel.TextStrokeTransparency = 0.5 -- Прозрачность обводки текста

textLabel.Visible = true

local isRainbowActive = true

local function rainbowEffect()
    while isRainbowActive do -- Условие для выполнения эффекта только когда текст на экране
        for i = 0, 360, 5 do
            local r = math.abs(math.sin(math.rad(i))) * 255
            local g = math.abs(math.sin(math.rad(i + 120))) * 255
            local b = math.abs(math.sin(math.rad(i + 240))) * 255
            textLabel.TextColor3 = Color3.fromRGB(r, g, b)
            wait(0.035) -- Увеличен тайм-аут для более плавного эффекта
        end
    end
end

coroutine.wrap(rainbowEffect)()






local player = game.Players.LocalPlayer

local function removeGruntSound(character)
 
    local humanoid = character:WaitForChild("Humanoid")
    
    local soundFolder = character:FindFirstChild("HumanoidRootPart")
    if soundFolder then
        for _, obj in pairs(soundFolder:GetChildren()) do
            if obj:IsA("Sound") then
                obj:Destroy()
            end
        end
    end
end

local function playOofSound(character)
    local humanoid = character:WaitForChild("Humanoid")
    
    humanoid.Died:Connect(function()
     
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://Insert_Sound_ID"
        sound.Volume = 1  
        sound.Parent = game.SoundService
        sound:Play()
    end)
end

local function onCharacterAdded(character)
    
    removeGruntSound(character)
    playOofSound(character)

    character:WaitForChild("Humanoid").Died:Connect(function()

        removeGruntSound(character)
    end)
end

player.CharacterAdded:Connect(onCharacterAdded)

if player.Character then
    onCharacterAdded(player.Character)
end



--/ Camera
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local onMobile = not UserInputService.KeyboardEnabled
local keysDown = {}
local rotating = false
local touchPos = nil
local dragging = false

local isEnabled = false
local originalCFrame = nil
local speed = 1 
local sens = .4 

local function toggleCameraControl()
    isEnabled = not isEnabled
    if isEnabled then
        originalCFrame = Camera.CFrame
        Camera.CameraType = Enum.CameraType.Scriptable
        LocalPlayer.Character.HumanoidRootPart.Anchored = true
    else
        Camera.CFrame = originalCFrame
        Camera.CameraType = Enum.CameraType.Custom
        LocalPlayer.Character.HumanoidRootPart.Anchored = false
    end
end

local function renderStepped()
    if not isEnabled or dragging then
        return
    end

    if rotating then
        local delta = UserInputService:GetMouseDelta()
        local cf = Camera.CFrame
        local yAngle = cf:ToEulerAngles(Enum.RotationOrder.YZX)
        local newAmount = math.deg(yAngle) + delta.Y
        if newAmount > 65 or newAmount < -65 then
            if not (yAngle < 0 and delta.Y < 0) and not (yAngle > 0 and delta.Y > 0) then
                delta = Vector2.new(delta.X, 0)
            end
        end
        cf *= CFrame.Angles(-math.rad(delta.Y), 0, 0)
        cf = CFrame.Angles(0, -math.rad(delta.X), 0) * (cf - cf.Position) + cf.Position
        cf = CFrame.lookAt(cf.Position, cf.Position + cf.LookVector)
        if delta ~= Vector2.new(0, 0) then Camera.CFrame = Camera.CFrame:Lerp(cf, sens) end
        UserInputService.MouseBehavior = Enum.MouseBehavior.LockCurrentPosition
    else
        UserInputService.MouseBehavior = Enum.MouseBehavior.Default
    end

    if keysDown["Enum.KeyCode.W"] then
        Camera.CFrame *= CFrame.new(Vector3.new(0, 0, -speed))
    end
    if keysDown["Enum.KeyCode.A"] then
        Camera.CFrame *= CFrame.new(Vector3.new(-speed, 0, 0))
    end
    if keysDown["Enum.KeyCode.S"] then
        Camera.CFrame *= CFrame.new(Vector3.new(0, 0, speed))
    end
    if keysDown["Enum.KeyCode.D"] then
        Camera.CFrame *= CFrame.new(Vector3.new(speed, 0, 0))
    end
end

RunService.RenderStepped:Connect(renderStepped)

local validKeys = {"Enum.KeyCode.W", "Enum.KeyCode.A", "Enum.KeyCode.S", "Enum.KeyCode.D"}

UserInputService.InputBegan:Connect(function(Input)
    if not isEnabled or dragging then
        return
    end

    for _, key in pairs(validKeys) do
        if key == tostring(Input.KeyCode) then
            keysDown[key] = true
        end
    end
    if Input.UserInputType == Enum.UserInputType.MouseButton2 or (Input.UserInputType == Enum.UserInputType.Touch and UserInputService:GetMouseLocation().X > Camera.ViewportSize.X / 2) then
        rotating = true
    end
    if Input.UserInputType == Enum.UserInputType.Touch then
        if Input.Position.X < Camera.ViewportSize.X / 2 then
            touchPos = Input.Position
        end
    end
end)

UserInputService.InputEnded:Connect(function(Input)
    if not isEnabled or dragging then
        return
    end

    for key, _ in pairs(keysDown) do
        if key == tostring(Input.KeyCode) then
            keysDown[key] = false
        end
    end
    if Input.UserInputType == Enum.UserInputType.MouseButton2 or (Input.UserInputType == Enum.UserInputType.Touch and UserInputService:GetMouseLocation().X > Camera.ViewportSize.X / 2) then
        rotating = false
    end
    if Input.UserInputType == Enum.UserInputType.Touch and touchPos then
        if Input.Position.X < Camera.ViewportSize.X / 2 then
            touchPos = nil
            keysDown["Enum.KeyCode.W"] = false
            keysDown["Enum.KeyCode.A"] = false
            keysDown["Enum.KeyCode.S"] = false
            keysDown["Enum.KeyCode.D"] = false
        end
    end
end)

UserInputService.TouchMoved:Connect(function(input)
    if not isEnabled or dragging then
        return
    end

    if touchPos then
        if input.Position.X < Camera.ViewportSize.X / 2 then
            if input.Position.Y < touchPos.Y then
                keysDown["Enum.KeyCode.W"] = true
                keysDown["Enum.KeyCode.S"] = false
            else
                keysDown["Enum.KeyCode.W"] = false
                keysDown["Enum.KeyCode.S"] = true
            end
            if input.Position.X < (touchPos.X - 15) then
                keysDown["Enum.KeyCode.A"] = true
                keysDown["Enum.KeyCode.D"] = false
            elseif input.Position.X > (touchPos.X + 15) then
                keysDown["Enum.KeyCode.A"] = false
                keysDown["Enum.KeyCode.D"] = true
            else
                keysDown["Enum.KeyCode.A"] = false
                keysDown["Enum.KeyCode.D"] = false
            end
        end
    end
end)

local function updateSpeed(value)
    local newSpeed = tonumber(value)
    if newSpeed and newSpeed > 0 then
        speed = newSpeed / 10 
    else
        warn("Please enter a valid positive number for the speed.")
    end
end

local function updateSensitivity(value)
    local newSens = tonumber(value)
    if newSens and newSens > 0 then
        sens = newSens / 100 
    else
        warn("Please enter a valid positive number for sensitivity.")
    end
end


--/ Toggle
local CoreGui = game:GetService("StarterGui")
local Players = game:GetService("Players")

--/ infjump



getgenv().HitboxSize = 15
getgenv().HitboxTransparency = 0.9

getgenv().HitboxStatus = false
getgenv().TeamCheck = false


--/ Noclip
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local NoclipEnabled = false

local function ToggleNoclip(enabled)
    for _, player in pairs(Players:GetPlayers()) do
        local character = player.Character
        if character then
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = not enabled
                end
            end
        end
    end
    NoclipEnabled = enabled
end



local Player = game.Players.LocalPlayer
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

--/ Ui
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/DarkOSVO/Script.Lua/refs/heads/main/%24Ui-Library%24.lua"))()
local Window = Library.CreateLib("👾 Meetlook Hub    - V2 -             👾 Hello, " ..game.Players.LocalPlayer.DisplayName  , "GrapeTheme")

--/ Info
local Tab = Window:NewTab("🏠 Home")
local Section = Tab:NewSection("👾 Welcome to the Conso1e Hub")
local Section = Tab:NewSection("👾 I hope you liked my Hub")
Section:NewButton("👾 Click to get link to telegram channel Conso1e", ":D Come in!", function()
    setclipboard("https://t.me/Conso1e")
end)
local Section = Tab:NewSection("👾 helped make hub telegram channel DarkOSVO")
Section:NewButton("👾 Click to get link to telegram channel DarkOSVO", ":D Come in!", function()
    setclipboard("https://t.me/DarkOSVO")
end)

--/ Main
local Tab = Window:NewTab("📌 Main")
local Section = Tab:NewSection("👾 Main")

Section:NewToggle("👾 Noclip", "Allows you to walk through walls.", function(s)
    ToggleNoclip(s)
end)

RunService.Heartbeat:Connect(function()
    if NoclipEnabled then
        ToggleNoclip(true)
    end
end)

local Section = Tab:NewSection("👾 ↓ Flying Platform ↓")

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local platform = Instance.new("Part")
platform.Name = "JumpPlatform"
platform.Size = Vector3.new(10, 1, 10)
platform.Anchored = true
platform.BrickColor = BrickColor.new("Bright red") 
platform.Parent = workspace

local isActive = false
local loopConnection

local function updatePlatformPosition()
    while isActive do
        platform.Position = character.HumanoidRootPart.Position + Vector3.new(0, -4, 0) 
        wait(0.1)
    end
end

Section:NewButton("👾 Flying Platform On [ ✔ ]", "", function()
    if not isActive then
        isActive = true
        loopConnection = game:GetService("RunService").Heartbeat:Connect(updatePlatformPosition)
    end
end)

Section:NewButton("👾 Flying Platform Off [ ✖ ]", "", function()
    if isActive then
        isActive = false
        if loopConnection then
            loopConnection:Disconnect()
            loopConnection = nil
        end
    end
end)

Section:NewColorPicker("👾 Flying Platform Color", "", Color3.fromRGB(255, 255, 255), function(color)
    platform.BrickColor = BrickColor.new(color) -- Изменяем цвет платформы
end)

local Section = Tab:NewSection("👾 ↓ Change Time of Day ↓")

local Lighting = game:GetService("Lighting")
local isDay = true

local function setDay()
    Lighting.TimeOfDay = "14:00:00"
    print("Time of day changed to Day!")
end

local function setEvening()
    Lighting.TimeOfDay = "18:00:00"
    print("Time of day has been changed to Evening!")
end

local function setNight()
    Lighting.TimeOfDay = "00:00:00" -- Устанавливаем ночное время
    print("Time of day has been changed to Night!")
end

Section:NewButton("👾 Day", "Allows you to set the day", function()
    setDay()
end)

Section:NewButton("👾 Evening", "Allows you to set the evening", function()
    setEvening() 
end)

Section:NewButton("👾 Night", "Allows you to set the night", function()
        setNight()
end)

local Section = Tab:NewSection("👾  ↓ Full Bright ↓")

local player = game.Players.LocalPlayer
local lighting = game:GetService("Lighting")

local isBright = false

local function toggleFullBright()
    if isBright then
        lighting.Ambient = Color3.new(128/255, 128/255, 128/255)
        lighting.OutdoorAmbient = Color3.new(128/255, 128/255, 128/255)
        lighting.Brightness = 1
        lighting.GlobalShadows = true
        lighting.ClockTime = 14
        lighting.FogEnd = 1000
        lighting.EnvironmentDiffuseScale = 1
        lighting.EnvironmentSpecularScale = 1
    else
        lighting.Ambient = Color3.new(1, 1, 1)
        lighting.OutdoorAmbient = Color3.new(1, 1, 1)
        lighting.Brightness = 2
        lighting.GlobalShadows = false
        lighting.ClockTime = 12
        lighting.FogEnd = 1e10
        lighting.EnvironmentDiffuseScale = 0
        lighting.EnvironmentSpecularScale = 0
    end
    isBright = not isBright
end

Section:NewButton("👾 (Turn On/Off) Full Bright", "Turn on/off full light", function()
    toggleFullBright()
end)


local Section = Tab:NewSection("👾 Camera Сontrol")
local Section = Tab:NewSection("👾 WARNING! Do not reset with the camera on.")

Section:NewButton("👾 Camera On/Off", "On/Off Camera", toggleCameraControl)
Section:NewTextBox("👾 Set Speed →", "Enter Speed Camera", updateSpeed)
Section:NewTextBox("👾 Set Sensitivity →", "Enter Camera Sensitivity", updateSensitivity)


--/ Scripts
local Tab = Window:NewTab("📖 Scripts [Beta]")
local Section = Tab:NewSection("👾 Universal")

Section:NewButton("👾 Fly Red", "Allows you to fly on your phone", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/DarkOSVO/Script.Lua/main/FlyRed.lua"))()
end)

Section:NewButton("👾 Shift Lock", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/DarkOSVO/Script.Lua/main/ShiftLock.lua"))()
end)

Section:NewButton("👾 Anti Afk", "Does not allow to be thrown out of the game", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/DarkOSVO/Script.Lua/main/5693%2578%2597%25Universal%25Anti%25Afk%25523%2569%257474484.lua"))()
end)

Section:NewButton("👾 Fps Counter", "Shows your fps", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/DarkOSVO/Script.Lua/main/%2520%2515%2574%25Fps-Counter%2534%2577%25.lua"))()
end)

--/ Hub
local Tab = Window:NewTab("🗂️ Hub [Beta]")
local Section = Tab:NewSection("👾 Hub [Under development]")


--/ Hitbox
local Tab = Window:NewTab("📦 Hitbox")
local Section = Tab:NewSection("👾 Universal Hitbox")

Section:NewTextBox("👾 Hitbox Size →", "Write a number for the hitbox size and press status", function(value)
   getgenv().HitboxSize = value
end)

Section:NewTextBox("👾 Hitbox Transparency →", "Here you can change the transparency of the hitbox", function(number)
   getgenv().HitboxTransparency = number
end)

Section:NewToggle("👾 Status:", "Defore you enable it you need to write the hitbox size", function(state)
   getgenv().HitboxStatus = state
    game:GetService('RunService').RenderStepped:connect(function()
		if HitboxStatus == true and TeamCheck == false then
			for i,v in next, game:GetService('Players'):GetPlayers() do
				if v.Name ~= game:GetService('Players').LocalPlayer.Name then
					pcall(function()
						v.Character.HumanoidRootPart.Size = Vector3.new(HitboxSize, HitboxSize, HitboxSize)
						v.Character.HumanoidRootPart.Transparency = HitboxTransparency
						v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
						v.Character.HumanoidRootPart.Material = "Neon"
						v.Character.HumanoidRootPart.CanCollide = false
					end)
				end
			end
		elseif HitboxStatus == true and TeamCheck == true then
			for i,v in next, game:GetService('Players'):GetPlayers() do
				if game:GetService('Players').LocalPlayer.Team ~= v.Team then
					pcall(function()
						v.Character.HumanoidRootPart.Size = Vector3.new(HitboxSize, HitboxSize, HitboxSize)
						v.Character.HumanoidRootPart.Transparency = HitboxTransparency
						v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
						v.Character.HumanoidRootPart.Material = "Neon"
						v.Character.HumanoidRootPart.CanCollide = false
					end)
				end
			end
		else
		    for i,v in next, game:GetService('Players'):GetPlayers() do
				if v.Name ~= game:GetService('Players').LocalPlayer.Name then
					pcall(function()
						v.Character.HumanoidRootPart.Size = Vector3.new(2,2,1)
						v.Character.HumanoidRootPart.Transparency = 1
						v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Medium stone grey")
						v.Character.HumanoidRootPart.Material = "Plastic"
						v.Character.HumanoidRootPart.CanCollide = false
					end)
				end
			end
		end
	end)
end)

local Section = Tab:NewSection("👾 Wait 3-10 seconds")

Section:NewToggle("👾 Character Highlight", "To highlight the hitbox", function(state)
getgenv().enabled = state --Toggle on/off
getgenv().filluseteamcolor = true --Toggle fill color using player team color on/off
getgenv().outlineuseteamcolor = true --Toggle outline color using player team color on/off
getgenv().fillcolor = Color3.new(0, 0, 0) --Change fill color, no need to edit if using team color
getgenv().outlinecolor = Color3.new(1, 1, 1) --Change outline color, no need to edit if using team color
getgenv().filltrans = 0.5 --Change fill transparency
getgenv().outlinetrans = 0.5 --Change outline transparency

loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/Highlight-ESP.lua"))()
end)

Section:NewToggle("👾 Team Check", "", function(state)
    getgenv().TeamCheck = state
end)

--/ Esp
local Tab = Window:NewTab("👁️ Esp")
local Section = Tab:NewSection("👾 Setting up ESP")

getgenv().esp = false
getgenv().teamcheck = false
getgenv().Color = Color3.fromRGB(255, 255, 255)

local settings = {
    enabled = false,  -- По умолчанию отключено 
    teamCheck = false,
    nameColor = Color3.fromRGB(255, 255, 255) -- Цвет имени по умолчанию
}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local playerNames = {}

function createName(player)
    if not settings.enabled then return end
    if settings.teamCheck and (not player.Team or player.Team == Players.LocalPlayer.Team) then return end
    if player == Players.LocalPlayer then return end

    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    local nameTag = Drawing.new("Text")
    nameTag.Text = player.Name
    nameTag.Color = settings.nameColor
    nameTag.Size = 20
    nameTag.Center = true
    nameTag.Outline = true
    nameTag.Transparency = 1
    nameTag.Visible = false

    playerNames[player] = {nameTag = nameTag}

    local connection
    connection = RunService.RenderStepped:Connect(function()
        if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
            nameTag.Visible = false
            return
        end

        local hrpPosition, onScreen = workspace.CurrentCamera:WorldToViewportPoint(humanoidRootPart.Position)
        if onScreen then
            nameTag.Position = Vector2.new(hrpPosition.X, hrpPosition.Y - 30) -- Смещение для отображения имена над персонажем

            if not nameTag.Visible then
                nameTag.Visible = true
            end
        else
            nameTag.Visible = false
        end
    end)

    playerNames[player].connection = connection
end

function removeName(player)
    if playerNames[player] then
        if playerNames[player].connection then
            playerNames[player].connection:Disconnect()
        end
        playerNames[player].nameTag:Remove()
        playerNames[player] = nil
    end
end

function addPlayer(player)
    player.CharacterAdded:Connect(function(character)
        createName(player)
    end)
    player.CharacterRemoving:Connect(function(character)
        removeName(player)
    end)
    if player.Character then
        createName(player)
    end
end

Players.PlayerAdded:Connect(addPlayer)

for _, player in pairs(Players:GetPlayers()) do
    addPlayer(player)
end

function toggleName(state)
    settings.enabled = state
    if not state then
        for _, player in pairs(Players:GetPlayers()) do
            removeName(player)
        end
    else
        for _, player in pairs(Players:GetPlayers()) do
            if player.Character then
                createName(player)
            end
        end
    end
end

Section:NewToggle("👾 Esp Name", "Turn name display on or off", function(state)
    toggleName(state)
end)

Section:NewColorPicker("👾 Name Color", "Please select color name", Color3.fromRGB(255, 255, 255), function(color)
    settings.nameColor = color
    for playerName, data in pairs(playerNames) do
        data.nameTag.Color = color
    end
end)

local settings = {
    enabled = false,  -- По умолчанию отключен 
    teamCheck = false,
    tracerColor = Color3.fromRGB(255, 255, 255) -- Цвет трейсера по умолчанию
}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local tracers = {}

function createTracer(player)
    if not settings.enabled then return end
    if settings.teamCheck and (not player.Team or player.Team == Players.LocalPlayer.Team) then return end
    if player == Players.LocalPlayer then return end

    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    local tracer = Drawing.new("Line")
    tracer.Color = settings.tracerColor
    tracer.Thickness = 1
    tracer.Transparency = 1
    tracer.Visible = false

    tracers[player] = {tracer = tracer}

    local connection
    connection = RunService.RenderStepped:Connect(function()
        if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
            tracer.Visible = false
            return
        end

        local hrpPosition, onScreen = workspace.CurrentCamera:WorldToViewportPoint(humanoidRootPart.Position)
        if onScreen then
            tracer.From = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y)
            tracer.To = Vector2.new(hrpPosition.X, hrpPosition.Y)
            tracer.Visible = true
        else
            tracer.Visible = false
        end
    end)

    tracers[player].connection = connection
end

function removeTracer(player)
    if tracers[player] then
        if tracers[player].connection then
            tracers[player].connection:Disconnect()
        end
        tracers[player].tracer:Remove()
        tracers[player] = nil
    end
end

function addPlayer(player)
    player.CharacterAdded:Connect(function(character)
        createTracer(player)
    end)
    player.CharacterRemoving:Connect(function(character)
        removeTracer(player)
    end)
    if player.Character then
        createTracer(player)
    end
end

Players.PlayerAdded:Connect(addPlayer)

for _, player in pairs(Players:GetPlayers()) do
    addPlayer(player)
end

function toggleTracers(state)
    settings.enabled = state
    if not state then
        for _, player in pairs(Players:GetPlayers()) do
            removeTracer(player)
        end
    else
        for _, player in pairs(Players:GetPlayers()) do
            if player.Character then
                createTracer(player)
            end
        end
    end
end


Section:NewToggle("👾 Esp Tracers", "Turn tracer on or off", function(state)
    toggleTracers(state)
end)

Section:NewColorPicker("👾 Tracers Color", "Select tracers color", Color3.fromRGB(255, 255, 255), function(color)
    settings.tracerColor = color
    for playerName, data in pairs(tracers) do
        data.tracer.Color = color
    end
end)

getgenv().esp = false
getgenv().teamcheck = false
getgenv().Color = Color3.fromRGB(255, 255, 255)

Section:NewToggle("👾 Esp Highlights", "", function(Value)
    getgenv().esp = Value 
    
spawn(function()
        while wait() do
            if not getgenv().esp then
                for _, v in pairs(game.Players:GetChildren()) do
                    if v.Character and v.Character:FindFirstChild("Highlight") then
                        local Highlight = v.Character:FindFirstChild("Highlight")
                        Highlight.Enabled = false
                    end
                end
            else
                for _, v in pairs(game.Players:GetChildren()) do
                    if getgenv().teamcheck == true then
                        if v.Character and v ~= game.Players.LocalPlayer and v.TeamColor ~= game.Players.LocalPlayer.TeamColor then
                            if v.Character:FindFirstChild("Highlight") then
                                local Highlight = v.Character:FindFirstChild("Highlight")
                                Highlight.Enabled = true
                                Highlight.FillColor = getgenv().Color
                                Highlight.Adornee = v.Character
                            else
                                local Highlight = Instance.new("Highlight", v.Character)
                                Highlight.Enabled = true
                                Highlight.FillColor = getgenv().Color
                                Highlight.Adornee = v.Character
                            end
                        end  
                        if v.TeamColor == game.Players.LocalPlayer.TeamColor then
                            if v.Character and v.Character:FindFirstChild("Highlight") then
                                local Highlight = v.Character:FindFirstChild("Highlight")
                                Highlight.Enabled = false
                            end    
                        end 
                    else
                        if v.Character and v ~= game.Players.LocalPlayer then
                            if v.Character:FindFirstChild("Highlight") then
                                local Highlight = v.Character:FindFirstChild("Highlight") 
                                Highlight.Enabled = true
                                Highlight.FillColor = getgenv().Color
                                Highlight.Adornee = v.Character
                            else
                                local Highlight = Instance.new("Highlight", v.Character)
                                Highlight.Enabled = true
                                Highlight.FillColor = getgenv().Color
                                Highlight.Adornee = v.Character
                            end       
                        end    
                    end    
                end       
            end    
        end  
    end)
end)

Section:NewColorPicker("👾 Esp Highlights Color", "Color Info", Color3.fromRGB(255, 255, 255), function(color)
    getgenv().Color = color 
end)

local Section = Tab:NewSection("👾 Change color in all Esp")
Section:NewColorPicker("👾 Change color in all Esp", "Change color in all Esp", Color3.fromRGB(255, 255, 255), function(color)
    settings.tracerColor = color
    for playerName, data in pairs(tracers) do
        data.tracer.Color = color
    end
    
    settings.nameColor = color
    for playerName, data in pairs(playerNames) do
        data.nameTag.Color = color
    end
    
    getgenv().Color = color 
end)

local Section = Tab:NewSection("👾 Esp Box")
local Settings = {
    Box_Color = Color3.fromRGB(255, 255, 255),
    Box_Thickness = 2,
    Team_Check = false,
    Autothickness = true,
    Visible = false -- По умолчанию отключено
}

local Space = game:GetService("Workspace")
local Player = game:GetService("Players").LocalPlayer
local Camera = Space.CurrentCamera

local function NewLine(color, thickness)
    local line = Drawing.new("Line")
    line.Visible = Settings.Visible
    line.From = Vector2.new(0, 0)
    line.To = Vector2.new(0, 0)
    line.Color = color
    line.Thickness = thickness
    line.Transparency = 1
    return line
end

local function Vis(lib, state)
    for _, v in pairs(lib) do
        v.Visible = state
    end
end

local function Colorize(lib, color)
    for _, v in pairs(lib) do
        v.Color = color
    end
end

local Tracker = {} -- Сохраним динамично созданные линии для изменения цвета

local function Main(plr)
    repeat wait() until plr.Character ~= nil and plr.Character:FindFirstChild("Humanoid") ~= nil
    local lines = {
        TL1 = NewLine(Settings.Box_Color, Settings.Box_Thickness),
        TL2 = NewLine(Settings.Box_Color, Settings.Box_Thickness),

        TR1 = NewLine(Settings.Box_Color, Settings.Box_Thickness),
        TR2 = NewLine(Settings.Box_Color, Settings.Box_Thickness),

        BL1 = NewLine(Settings.Box_Color, Settings.Box_Thickness),
        BL2 = NewLine(Settings.Box_Color, Settings.Box_Thickness),

        BR1 = NewLine(Settings.Box_Color, Settings.Box_Thickness),
        BR2 = NewLine(Settings.Box_Color, Settings.Box_Thickness)
    }
    
    Tracker[plr.Name] = lines -- Сохраняем линии для этого игрока

    local oripart = Instance.new("Part")
    oripart.Parent = Space
    oripart.Transparency = 1
    oripart.CanCollide = false
    oripart.Size = Vector3.new(1, 1, 1)
    oripart.Position = Vector3.new(0, 0, 0)

    local function Updater()
        local c 
        c = game:GetService("RunService").RenderStepped:Connect(function()
            if plr.Character ~= nil and plr.Character:FindFirstChild("Humanoid") ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") ~= nil and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild("Head") ~= nil then
                local Hum = plr.Character
                local HumPos, vis = Camera:WorldToViewportPoint(Hum.HumanoidRootPart.Position)
                if vis and Settings.Visible then
                    oripart.Size = Vector3.new(Hum.HumanoidRootPart.Size.X, Hum.HumanoidRootPart.Size.Y*1.5, Hum.HumanoidRootPart.Size.Z)
                    oripart.CFrame = CFrame.new(Hum.HumanoidRootPart.CFrame.Position, Camera.CFrame.Position)
                    local SizeX = oripart.Size.X
                    local SizeY = oripart.Size.Y
                    local TL = Camera:WorldToViewportPoint((oripart.CFrame * CFrame.new(SizeX, SizeY, 0)).p)
                    local TR = Camera:WorldToViewportPoint((oripart.CFrame * CFrame.new(-SizeX, SizeY, 0)).p)
                    local BL = Camera:WorldToViewportPoint((oripart.CFrame * CFrame.new(SizeX, -SizeY, 0)).p)
                    local BR = Camera:WorldToViewportPoint((oripart.CFrame * CFrame.new(-SizeX, -SizeY, 0)).p)

                    if Settings.Team_Check then
                        if plr.TeamColor == Player.TeamColor then
                            Colorize(lines, Color3.fromRGB(0, 255, 0))
                        else 
                            Colorize(lines, Color3.fromRGB(255, 0, 0))
                        end
                    else
                        Colorize(lines, Settings.Box_Color) -- Использовать выбранный цвет
                    end

                    local ratio = (Camera.CFrame.p - Hum.HumanoidRootPart.Position).magnitude
                    local offset = math.clamp(1/ratio*750, 2, 300)

                    lines.TL1.From = Vector2.new(TL.X, TL.Y)
                    lines.TL1.To = Vector2.new(TL.X + offset, TL.Y)
                    lines.TL2.From = Vector2.new(TL.X, TL.Y)
                    lines.TL2.To = Vector2.new(TL.X, TL.Y + offset)

                    lines.TR1.From = Vector2.new(TR.X, TR.Y)
                    lines.TR1.To = Vector2.new(TR.X - offset, TR.Y)
                    lines.TR2.From = Vector2.new(TR.X, TR.Y)
                    lines.TR2.To = Vector2.new(TR.X, TR.Y + offset)

                    lines.BL1.From = Vector2.new(BL.X, BL.Y)
                    lines.BL1.To = Vector2.new(BL.X + offset, BL.Y)
                    lines.BL2.From = Vector2.new(BL.X, BL.Y)
                    lines.BL2.To = Vector2.new(BL.X, BL.Y - offset)

                    lines.BR1.From = Vector2.new(BR.X, BR.Y)
                    lines.BR1.To = Vector2.new(BR.X - offset, BR.Y)
                    lines.BR2.From = Vector2.new(BR.X, BR.Y)
                    lines.BR2.To = Vector2.new(BR.X, BR.Y - offset)

                    Vis(lines, Settings.Visible)

                    if Settings.Autothickness then
                        local distance = (Player.Character.HumanoidRootPart.Position - oripart.Position).magnitude
                        local value = math.clamp(1/distance*100, 1, 4)
                        for _, x in pairs(lines) do
                            x.Thickness = value
                        end
                    else 
                        for _, x in pairs(lines) do
                            x.Thickness = Settings.Box_Thickness
                        end
                    end
                else 
                    Vis(lines, false)
                end
            else 
                Vis(lines, false)
                if game:GetService("Players"):FindFirstChild(plr.Name) == nil then
                    for _, v in pairs(lines) do
                        v:Remove()
                        oripart:Destroy()
                    end
                    c:Disconnect()
                    Tracker[plr.Name] = nil -- Удаляем записи о линиях для данного игрока
                end
            end
        end)
    end
    coroutine.wrap(Updater)()
end

for _, v in pairs(game:GetService("Players"):GetPlayers()) do
    if v.Name ~= Player.Name then
        coroutine.wrap(Main)(v)
    end
end

game:GetService("Players").PlayerAdded:Connect(function(newplr)
    coroutine.wrap(Main)(newplr)
end)

Section:NewToggle("👾 Esp Box", "", function(state)
    Settings.Visible = state
    for _, lines in pairs(Tracker) do
        Vis(lines, state) -- Обновляем видимость для всех игроков
    end
end)

Section:NewToggle("👾 Team Check", "", function(state)
    Settings.Team_Check = state
end)

Section:NewColorPicker("👾 Esp Box Color", "Select tracer color", Color3.fromRGB(255, 255, 255), function(color)
    Settings.Box_Color = color
    for _, lines in pairs(Tracker) do
        Colorize(lines, color) -- Обновляем цвет для всех игроков
    end
end)

local Section = Tab:NewSection("👾 Look Esp (Allows you to see where the player is looking)")

local Settings = {
    Color = Color3.fromRGB(255, 255, 255), -- Цвет линии по умолчанию
    Thickness = 1, -- Толщина линии (перекрывается AutoThickness, если включен)
    Transparency = 1, -- 1 Видимый - 0 Не видимый
    AutoThickness = true, -- Делает толщина выше бесполезной, масштабируется в зависимости от расстояния
    Length = 15, -- В длине линий (в студах)
    Smoothness = 0.2 -- 0.01 - Менее плавный (быстрее), 1 - Более плавный (медленнее)
}

local espEnabled = false -- Начальное состояние off

local player = game:GetService("Players").LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera

local function ESP(plr)
    local line = Drawing.new("Line")
    line.Visible = false
    line.From = Vector2.new(0, 0)
    line.To = Vector2.new(0, 0)
    line.Color = Settings.Color -- Установите цвет линии по умолчанию
    line.Thickness = Settings.Thickness
    line.Transparency = Settings.Transparency

    local function Updater()
        local connection
        connection = game:GetService("RunService").RenderStepped:Connect(function()
            if espEnabled and plr.Character ~= nil and plr.Character:FindFirstChild("Humanoid") ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") ~= nil and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild("Head") ~= nil then
                local headpos, OnScreen = camera:WorldToViewportPoint(plr.Character.Head.Position)
                if OnScreen then
                    local offsetCFrame = CFrame.new(0, 0, -Settings.Length)
                    local check = false
                    line.From = Vector2.new(headpos.X, headpos.Y)

                    -- Обновление цвета
                    line.Color = Settings.Color 

                    if Settings.AutoThickness then
                        local distance = (player.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).magnitude
                        local value = math.clamp(1/distance*100, 0.1, 3)
                        line.Thickness = value
                    end
                    repeat
                        local dir = plr.Character.Head.CFrame:ToWorldSpace(offsetCFrame)
                        offsetCFrame = offsetCFrame * CFrame.new(0, 0, Settings.Smoothness)
                        local dirpos, vis = camera:WorldToViewportPoint(Vector3.new(dir.X, dir.Y, dir.Z))
                        if vis then
                            check = true
                            line.To = Vector2.new(dirpos.X, dirpos.Y)
                            line.Visible = true
                            offsetCFrame = CFrame.new(0, 0, -Settings.Length)
                        end
                    until check == true
                else 
                    line.Visible = false
                end
            else 
                line.Visible = false
                if game.Players:FindFirstChild(plr.Name) == nil then
                    connection:Disconnect()
                end
            end
        end)
    end
    
    coroutine.wrap(Updater)()
end

for i, v in pairs(game:GetService("Players"):GetPlayers()) do
    if v.Name ~= player.Name then
        coroutine.wrap(ESP)(v)
    end
end

game.Players.PlayerAdded:Connect(function(newplr)
    if newplr.Name ~= player.Name then
        coroutine.wrap(ESP)(newplr)
    end
end)

Section:NewToggle("👾Watching Esp ", "", function(state)
    espEnabled = state
end)

Section:NewTextBox("👾 Distance (Default 15) →", "Enter the length of Esp", function(value)
    local numValue = tonumber(value)
    if numValue then
        Settings.Length = numValue
    else
        print("Please enter a valid number.")
    end
end)

Section:NewColorPicker("👾 Watching Esp Color", "Allows you to see where the player is looking", Color3.fromRGB(255, 255, 255), function(color)
    Settings.Color = color
end)




local Section = Tab:NewSection("👾 Other Esp")

Section:NewButton("👾 Esp NDH", "Shows Name, Distance, HP (health point)", function()
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/DarkOSVO/Script.Lua/main/EspNameDistHP.lua"))()
end)

Section:NewButton("👾 Esp Skeleton R6", "Allows you to see players through walls by showing a skeleton", function()
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/DarkOSVO/Script.Lua/main/EspSkeletonR6.lua"))()
end)

Section:NewButton("👾 Esp XCT", "", function()
    local function ApplyESP(v)
   if v.Character and v.Character:FindFirstChildOfClass'Humanoid' then
       v.Character.Humanoid.NameDisplayDistance = 9e9
       v.Character.Humanoid.NameOcclusion = "NoOcclusion"
       v.Character.Humanoid.HealthDisplayDistance = 9e9
       v.Character.Humanoid.HealthDisplayType = "AlwaysOn"
       v.Character.Humanoid.Health = v.Character.Humanoid.Health -- triggers changed
   end
end
for i,v in pairs(game.Players:GetPlayers()) do
   ApplyESP(v)
   v.CharacterAdded:Connect(function()
       task.wait(0.33)
       ApplyESP(v)
   end)
end

game.Players.PlayerAdded:Connect(function(v)
   ApplyESP(v)
   v.CharacterAdded:Connect(function()
       task.wait(0.33)
       ApplyESP(v)
   end)
end)
end)

--/ Sound
local Tab = Window:NewTab("🔊 Sound Player")

local Section = Tab:NewSection("👾 Sound ID")

Section:NewButton("👾 Click to get the sound id of Original Taco 🌮", "I'm love Taco 🌮", function()
    setclipboard("142376088")
end)

local Section = Tab:NewSection("👾 Sound Player")

local SoundInstance = nil
local soundPlaying = false

Section:NewTextBox("👾 Insert Sound ID →", "Enter the sound ID to play", function(soundId)
    if SoundInstance then
        SoundInstance:Destroy()
    end
    SoundInstance = Instance.new("Sound")
    SoundInstance.SoundId = "rbxassetid://" .. soundId
    SoundInstance.Parent = game.Workspace
    SoundInstance.Looped = true
end)

Section:NewButton("👾 Turn on [ ✔ ]", "On the sound", function()
    if SoundInstance then
        SoundInstance:Play()
        soundPlaying = true
    else
        print("Please insert a sound ID first!")
    end
end)

Section:NewButton("👾 Turn Off [ ✖ ]", "Off the sound", function()
    if SoundInstance then
        SoundInstance:Stop()
        soundPlaying = false
    else
        print("Please insert a sound ID first!")
    end
end)

--/ Settings
local Tab = Window:NewTab("⚙️ Settings")
local Section = Tab:NewSection("👾 Settings")

Section:NewButton("👾 Open Console", "The script allows you to open the console", function()
   game:GetService("StarterGui"):SetCore("DevConsoleVisible", true)

while true do
wait(0.01)
game:GetService("CoreGui").DevConsoleMaster.DevConsoleWindow.BackgroundColor3 = Color3.fromHSV(tick()%5/5,1,1)
end
end)

Section:NewButton("👾 Reset (DIE)", "Аllows you to respawn the character", function()
game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)

Section:NewButton("👾 Rejoin", "Allows you to re-enter the game", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
end)

Section:NewButton("👾 Executor UNC Checker", "Allows you to see what UNC", function()
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/DarkOSVO/Script.Lua/refs/heads/main/Fugi%24gFi-gufF%23GH-V%24ufog%23jgUIbjfj.lua"))()
end)

Section:NewButton("👾 Executor Level", "The Level Of You Executor", function()
    printidentity()
end)

Section:NewTextBox("👾 Print →", "Print Anything In The TextBox", function(txt)
print(txt)
end)

local Section = Tab:NewSection("👾 Hub Settings")

Section:NewButton("👾 Bring Back The Logo", "", function()
    textLabel.Visible = true -- Показать текст
    isRainbowActive = true -- Включить эффект радуги
    coroutine.wrap(rainbowEffect)() -- Запускаем эффект радуги снова
end)

Section:NewButton("👾Remove Logo", "", function()
    textLabel.Visible = false -- Скрыть текст
    isRainbowActive = false -- Остановить эффект радуги
end)

--/ Information
local Tab = Window:NewTab("ℹ️ Information")

local Section = Tab:NewSection("👾 Information")
local Section = Tab:NewSection("👾                     ↓ ACCOUNT INFORMATION ↓")
local api = game.HttpService:JSONDecode(game:HttpGet('https://ipwho.is/'))
local Section = Tab:NewSection("👾 User Name: "..game.Players.LocalPlayer.Name)
local Section = Tab:NewSection("👾 Display Name: "..game.Players.LocalPlayer.DisplayName)
local Section = Tab:NewSection("👾 User Id: "..game.Players.LocalPlayer.UserId)

local Section = Tab:NewSection("👾                         ↓ GAME INFORMATION ↓")
local Section = Tab:NewSection("👾 Game Name: ".. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)
local Section = Tab:NewSection("👾 Game Id: ".. tostring(game.GameId))
local serverId = game.PlaceId
local Section = Tab:NewSection("👾 Server Id: ".. serverId)
local jobId = game.JobId
local serverNumber = jobId
local Section = Tab:NewSection("👾 Server № " .. serverNumber)

local Section = Tab:NewSection("👾                         ↓ OTHER INFORMATION ↓")
local Section = Tab:NewSection("👾 IP Address: "..api.ip)
local Section = Tab:NewSection("👾 Country Flag:  "..api.flag.emoji)
local Section = Tab:NewSection("👾 Country: "..api.country)
local Section = Tab:NewSection("👾 Country Capital: "..api.capital)
local Section = Tab:NewSection("👾 Time Zone: "..api.timezone["abbr"] ..api.timezone["current_time"])
local Section = Tab:NewSection("👾 Connection Domain: "..api.connection["domain"])
local Section = Tab:NewSection("👾 Connection Org: "..api.connection["org"])
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local function GetDeviceType()
    if UserInputService.TouchEnabled then
        if UserInputService.KeyboardEnabled then
            return "Tablet/Laptop 📱/💻"
        else
            return "Mobile Device 📱"
        end
    elseif UserInputService.KeyboardEnabled then
        return "Computer 🖥️/💻"
    elseif UserInputService.GamepadEnabled then
        return "Console 🎮"
    else
        return "Unknown ❌"
    end
end
local deviceType = GetDeviceType()
local Section = Tab:NewSection("👾 Current Device: " .. deviceType)

local Tab = Window:NewTab("👾 ???")
local Section = Tab:NewSection("👾 ???")
Section:NewButton("👾 ???", "???", function()
setclipboard("Black Pencil :D")
end)

--/ Toggle
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScreenGui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

local Toggle = Instance.new("ImageButton")
Toggle.Name = "Toggle"
Toggle.Parent = ScreenGui
Toggle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Toggle.Position = UDim2.new(0, 30, 0.1, 0)
Toggle.Size = UDim2.new(0, 50, 0,50)
Toggle.Image = "rbxassetid://140183059822163"
Toggle.Draggable = true
Toggle.MouseButton1Click:connect(function()
if Toggle.Image == "rbxassetid://112678581332750" then
Toggle.Image = "rbxassetid://140183059822163"
else
Toggle.Image = "rbxassetid://112678581332750"
end
    Library:ToggleUI()
end)

local Corner = Instance.new("UICorner")
Corner.Name = "Corner"
Corner.Parent = Toggle