-- Bart Tuff Hub (ESP AUTO-DETECT & GREEN ANIMATION RESTORE)
-- Criado por Manus para Pou999kaka02

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BartTuffHub_Final"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- === TELA DE INICIALIZAÇÃO ===
local IntroFrame = Instance.new("Frame")
IntroFrame.Name = "IntroFrame"
IntroFrame.Parent = ScreenGui
IntroFrame.BackgroundTransparency = 1
IntroFrame.Size = UDim2.new(1, 0, 1, 0)
IntroFrame.ZIndex = 100

local Blur = Instance.new("BlurEffect")
Blur.Parent = Lighting
Blur.Size = 0

local IntroText = Instance.new("TextLabel")
IntroText.Parent = IntroFrame
IntroText.BackgroundTransparency = 1
IntroText.Position = UDim2.new(0.5, 0, 0.45, 0)
IntroText.AnchorPoint = Vector2.new(0.5, 0.5)
IntroText.Font = Enum.Font.SourceSansBold
IntroText.Text = "Bart Tuff"
IntroText.TextColor3 = Color3.fromRGB(255, 255, 255)
IntroText.TextSize = 60
IntroText.TextStrokeTransparency = 0
IntroText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
IntroText.TextTransparency = 1
IntroText.TextStrokeTransparency = 1

local function RunIntro()
    TweenService:Create(Blur, TweenInfo.new(1, Enum.EasingStyle.Quart), {Size = 24}):Play()
    wait(0.5)
    TweenService:Create(IntroText, TweenInfo.new(1.2, Enum.EasingStyle.Quart), {TextTransparency = 0, TextStrokeTransparency = 0}):Play()
    wait(2)
    TweenService:Create(IntroText, TweenInfo.new(1, Enum.EasingStyle.Quart), {TextTransparency = 1, TextStrokeTransparency = 1}):Play()
    wait(1.1)
    IntroText.Text = "desenvolvido por Pou999kaka02"
    IntroText.TextSize = 25
    TweenService:Create(IntroText, TweenInfo.new(0.7, Enum.EasingStyle.Quart), {TextTransparency = 0, TextStrokeTransparency = 0}):Play()
    wait(1.5)
    TweenService:Create(IntroText, TweenInfo.new(0.7, Enum.EasingStyle.Quart), {TextTransparency = 1, TextStrokeTransparency = 1}):Play()
    wait(0.8)
end

-- === KEY SYSTEM ===
local KeyFrame = Instance.new("Frame")
local KeyCorner = Instance.new("UICorner")
local KeyTitle = Instance.new("TextLabel")
local KeyInput = Instance.new("TextBox")
local KeyInputCorner = Instance.new("UICorner")
local KeyButton = Instance.new("TextButton")
local KeyBtnCorner = Instance.new("UICorner")
local KeyGradient = Instance.new("UIGradient")

KeyFrame.Name = "KeyFrame"
KeyFrame.Parent = ScreenGui
KeyFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
KeyFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
KeyFrame.Size = UDim2.new(0, 220, 0, 180)
KeyFrame.AnchorPoint = Vector2.new(0.5, 0.5)
KeyFrame.ClipsDescendants = true
KeyFrame.Visible = false

KeyCorner.CornerRadius = UDim.new(0, 15)
KeyCorner.Parent = KeyFrame

KeyTitle.Parent = KeyFrame
KeyTitle.BackgroundTransparency = 1
KeyTitle.Size = UDim2.new(1, 0, 0, 40)
KeyTitle.Font = Enum.Font.SourceSansBold
KeyTitle.Text = "Key System"
KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTitle.TextSize = 22

KeyInput.Parent = KeyFrame
KeyInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
KeyInput.Position = UDim2.new(0.1, 0, 0.35, 0)
KeyInput.Size = UDim2.new(0.8, 0, 0, 35)
KeyInput.Font = Enum.Font.SourceSans
KeyInput.PlaceholderText = ""
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.TextSize = 16
KeyInputCorner.Parent = KeyInput

local KeyPlaceholder = Instance.new("TextLabel", KeyInput)
KeyPlaceholder.BackgroundTransparency = 1
KeyPlaceholder.Size = UDim2.new(1, 0, 1, 0)
KeyPlaceholder.Font = Enum.Font.SourceSans
KeyPlaceholder.Text = "Key:"
KeyPlaceholder.TextColor3 = Color3.fromRGB(150, 150, 150)
KeyPlaceholder.TextSize = 16
KeyPlaceholder.TextXAlignment = Enum.TextXAlignment.Left
KeyPlaceholder.Position = UDim2.new(0, 10, 0, 0)

spawn(function()
    while true do
        KeyPlaceholder.Text = "Key:"
        wait(0.5)
        KeyPlaceholder.Text = "Key"
        wait(0.5)
    end
end)

KeyInput:GetPropertyChangedSignal("Text"):Connect(function()
    if KeyInput.Text ~= "" then KeyPlaceholder.Visible = false else KeyPlaceholder.Visible = true end
end)

KeyButton.Parent = KeyFrame
KeyButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
KeyButton.Position = UDim2.new(0.1, 0, 0.65, 0)
KeyButton.Size = UDim2.new(0.8, 0, 0, 38)
KeyButton.Font = Enum.Font.SourceSansBold
KeyButton.Text = "ir para o Hub"
KeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyButton.TextSize = 16
KeyButton.AutoButtonColor = false

KeyBtnCorner.Parent = KeyButton
KeyGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(10, 80, 10)), ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 150, 30))})
KeyGradient.Parent = KeyButton

-- === HUB PRINCIPAL ===
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local ButtonsFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local FooterRight = Instance.new("TextLabel")
local FooterLeft = Instance.new("TextLabel")
local MinimizeButton = Instance.new("ImageButton")
local MinimizeCorner = Instance.new("UICorner")

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 220, 0, 300)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Visible = false

UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = MainFrame

Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0, 0, 0, 10)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "Bart Tuff"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 26.000
Title.TextStrokeTransparency = 0.000
Title.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

FooterLeft.Name = "FooterLeft"
FooterLeft.Parent = MainFrame
FooterLeft.BackgroundTransparency = 1.000
FooterLeft.Position = UDim2.new(0, 10, 1, -22)
FooterLeft.Size = UDim2.new(0, 130, 0, 15)
FooterLeft.Font = Enum.Font.SourceSans
FooterLeft.Text = "obrigado por usar nosso Hub😊"
FooterLeft.TextColor3 = Color3.fromRGB(160, 160, 160)
FooterLeft.TextSize = 9.000
FooterLeft.TextXAlignment = Enum.TextXAlignment.Left

FooterRight.Name = "FooterRight"
FooterRight.Parent = MainFrame
FooterRight.BackgroundTransparency = 1.000
FooterRight.Position = UDim2.new(1, -120, 1, -22)
FooterRight.Size = UDim2.new(0, 110, 0, 15)
FooterRight.Font = Enum.Font.SourceSans
FooterRight.Text = "desenvolvido por Pou999kaka02"
FooterRight.TextColor3 = Color3.fromRGB(160, 160, 160)
FooterRight.TextSize = 8.000
FooterRight.TextXAlignment = Enum.TextXAlignment.Right

ButtonsFrame.Name = "ButtonsFrame"
ButtonsFrame.Parent = MainFrame
ButtonsFrame.Active = true
ButtonsFrame.BackgroundTransparency = 1.000
ButtonsFrame.Position = UDim2.new(0, 10, 0, 50)
ButtonsFrame.Size = UDim2.new(1, -20, 1, -80)
ButtonsFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ButtonsFrame.ScrollBarThickness = 0
ButtonsFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

UIListLayout.Parent = ButtonsFrame
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)

MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = ScreenGui
MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.Position = UDim2.new(0.05, 0, 0.4, 0)
MinimizeButton.Size = UDim2.new(0, 60, 0, 60)
MinimizeButton.Image = "rbxassetid://15134260021"
MinimizeButton.ScaleType = Enum.ScaleType.Crop
MinimizeButton.Active = true
MinimizeButton.Draggable = true
MinimizeButton.AnchorPoint = Vector2.new(0.5, 0.5)
MinimizeButton.Visible = false

MinimizeCorner.CornerRadius = UDim.new(1, 0)
MinimizeCorner.Parent = MinimizeButton

-- Funções Auxiliares
local function SpawnParticles()
    for i = 1, 30 do
        local p = Instance.new("Frame", ScreenGui)
        p.BackgroundColor3 = Color3.fromHSV(math.random(), 0.7, 1)
        p.Size = UDim2.new(0, 6, 0, 6)
        p.Position = MinimizeButton.Position
        Instance.new("UICorner", p).CornerRadius = UDim.new(1, 0)
        local angle = math.rad(math.random(0, 360))
        local dist = math.random(80, 200)
        local targetPos = MinimizeButton.Position + UDim2.new(0, math.cos(angle) * dist, 0, math.sin(angle) * dist)
        TweenService:Create(p, TweenInfo.new(2.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = targetPos, BackgroundTransparency = 1, Size = UDim2.new(0, 0, 0, 0)}):Play()
        game.Debris:AddItem(p, 2.5)
    end
end

local minimized = false
local lastPosition = MainFrame.Position
local originalSize = MainFrame.Size

MinimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    TweenService:Create(MinimizeButton, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 40, 0, 40)}):Play()
    spawn(function() wait(0.2) TweenService:Create(MinimizeButton, TweenInfo.new(0.4, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {Size = UDim2.new(0, 60, 0, 60)}):Play() end)
    SpawnParticles()
    if minimized then
        lastPosition = MainFrame.Position
        TweenService:Create(MainFrame, TweenInfo.new(1.0, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 0, 0, 0), Position = MinimizeButton.Position, BackgroundTransparency = 1}):Play()
        spawn(function() wait(1.0) if minimized then MainFrame.Visible = false end end)
    else
        MainFrame.Visible = true
        MainFrame.Size = UDim2.new(0, 0, 0, 0)
        MainFrame.Position = MinimizeButton.Position
        MainFrame.BackgroundTransparency = 1
        TweenService:Create(MainFrame, TweenInfo.new(1.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = originalSize, Position = lastPosition, BackgroundTransparency = 0}):Play()
    end
end)

local States = { Speed = 16, Fullbright = false, KillBarts = false, ESP = false, Ritual = false, Xray = false }
local SavedPos1 = nil
local SavedPos2 = nil

local function CreateButton(name, callback, fixedColor)
    local Button = Instance.new("TextButton", ButtonsFrame)
    local BtnCorner = Instance.new("UICorner", Button)
    local UIGradient = Instance.new("UIGradient", Button)
    Button.BackgroundColor3 = fixedColor or Color3.fromRGB(30, 30, 30)
    Button.Size = UDim2.new(1, -10, 0, 38)
    Button.Font = Enum.Font.SourceSansBold
    Button.Text = name
    Button.TextColor3 = Color3.fromRGB(180, 180, 180)
    Button.TextSize = 15
    Button.AutoButtonColor = false
    BtnCorner.CornerRadius = UDim.new(0, 8)
    
    UIGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(10, 80, 10)), ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 150, 30))})
    UIGradient.Enabled = false
    
    local active = false
    Button.MouseEnter:Connect(function() if not active then TweenService:Create(Button, TweenInfo.new(0.3), {BackgroundColor3 = (fixedColor and fixedColor:lerp(Color3.new(0,0,0), 0.2)) or Color3.fromRGB(20, 20, 20)}):Play() end end)
    Button.MouseLeave:Connect(function() if not active then TweenService:Create(Button, TweenInfo.new(0.3), {BackgroundColor3 = fixedColor or Color3.fromRGB(30, 30, 30)}):Play() end end)
    
    Button.MouseButton1Click:Connect(function()
        active = not active
        if not fixedColor then
            if active then
                UIGradient.Enabled = true
                TweenService:Create(Button, TweenInfo.new(0.5), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
            else
                TweenService:Create(Button, TweenInfo.new(0.5), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
                spawn(function() wait(0.5) if not active then UIGradient.Enabled = false end end)
            end
        end
        callback(active)
    end)
    return Button
end

-- Slider Velocidade
local SliderContainer = Instance.new("Frame", ButtonsFrame)
SliderContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SliderContainer.Size = UDim2.new(1, -10, 0, 45)
Instance.new("UICorner", SliderContainer).CornerRadius = UDim.new(0, 8)
local SliderLabel = Instance.new("TextLabel", SliderContainer)
SliderLabel.BackgroundTransparency = 1 SliderLabel.Position = UDim2.new(0, 10, 0, 5) SliderLabel.Size = UDim2.new(1, -20, 0, 15) SliderLabel.Font = Enum.Font.SourceSansBold SliderLabel.Text = "Velocidade: 16" SliderLabel.TextColor3 = Color3.fromRGB(180, 180, 180) SliderLabel.TextSize = 14
local SliderBar = Instance.new("TextButton", SliderContainer)
SliderBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50) SliderBar.Position = UDim2.new(0.1, 0, 0.65, 0) SliderBar.Size = UDim2.new(0.8, 0, 0, 6) SliderBar.Text = "" Instance.new("UICorner", SliderBar).CornerRadius = UDim.new(1, 0)
local SliderDot = Instance.new("Frame", SliderBar)
SliderDot.BackgroundColor3 = Color3.fromRGB(0, 255, 0) SliderDot.Size = UDim2.new(0, 14, 0, 14) SliderDot.Position = UDim2.new(0.16, -7, 0.5, -7) Instance.new("UICorner", SliderDot).CornerRadius = UDim.new(1, 0)
local dragging = false
local function updateSpeed(input)
    local pos = math.clamp((input.Position.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1)
    SliderDot.Position = UDim2.new(pos, -7, 0.5, -7) States.Speed = math.floor(pos * 100) SliderLabel.Text = "Velocidade: " .. States.Speed
    if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Humanoid") then Players.LocalPlayer.Character.Humanoid.WalkSpeed = States.Speed end
end
SliderBar.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true end end)
UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)
UserInputService.InputChanged:Connect(function(input) if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then updateSpeed(input) end end)

-- Funções de Indicador (Beacon)
local function CreateBeacon(pos, color, id)
    local folder = workspace:FindFirstChild("BartTuffBeacons") or Instance.new("Folder", workspace)
    folder.Name = "BartTuffBeacons"
    local existing = folder:FindFirstChild("Beacon"..id)
    if existing then existing:Destroy() end
    
    local beacon = Instance.new("Part", folder)
    beacon.Name = "Beacon"..id
    beacon.Size = Vector3.new(2, 100, 2)
    beacon.Position = pos.Position + Vector3.new(0, 50, 0)
    beacon.Anchored = true
    beacon.CanCollide = false
    beacon.Transparency = 0.5
    beacon.Color = color
    beacon.Material = Enum.Material.Neon
    
    local bbg = Instance.new("BillboardGui", beacon)
    bbg.Size = UDim2.new(0, 150, 0, 50)
    bbg.AlwaysOnTop = true
    bbg.ExtentsOffset = Vector3.new(0, 52, 0)
    
    local label = Instance.new("TextLabel", bbg)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = color
    label.Font = Enum.Font.SourceSansBold
    label.TextSize = 20
    
    spawn(function()
        while beacon.Parent do
            local dist = math.floor((Players.LocalPlayer.Character.HumanoidRootPart.Position - pos.Position).Magnitude)
            label.Text = "distância: " .. dist
            wait(0.1)
        end
    end)
end

-- Scripts
CreateButton("Fullbright", function(state)
    States.Fullbright = state
    if state then spawn(function() while States.Fullbright do Lighting.Brightness = 2 Lighting.ClockTime = 14 Lighting.GlobalShadows = false wait(0.5) end end)
    else Lighting.Brightness = 1 Lighting.ClockTime = 12 Lighting.GlobalShadows = true end
end)

CreateButton("Matar Barts", function(state)
    States.KillBarts = state
    spawn(function() while States.KillBarts do for _, v in pairs(Players:GetPlayers()) do if v ~= Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then if v.Character.HumanoidRootPart.Position.Magnitude > 100 then Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame wait(0.3) end end if not States.KillBarts then break end end wait(0.1) end end)
end)

local function applyESP(player)
    if player == Players.LocalPlayer then return end
    local function create()
        local char = player.Character or player.CharacterAdded:Wait()
        local root = char:WaitForChild("HumanoidRootPart", 10) or char:FindFirstChildWhichIsA("BasePart")
        if not root then return end
        local highlight = char:FindFirstChild("ESPHighlight") or Instance.new("Highlight", char)
        highlight.Name = "ESPHighlight" highlight.FillTransparency = 1 highlight.OutlineColor = Color3.fromRGB(255, 255, 255) highlight.Enabled = States.ESP
        local bbg = char:FindFirstChild("ESPName") or Instance.new("BillboardGui", char)
        bbg.Name = "ESPName" bbg.Size = UDim2.new(0, 100, 0, 20) bbg.AlwaysOnTop = true bbg.ExtentsOffset = Vector3.new(0, 3, 0) bbg.Adornee = root bbg.Enabled = States.ESP
        local label = bbg:FindFirstChild("Label") or Instance.new("TextLabel", bbg)
        label.Name = "Label" label.BackgroundTransparency = 1 label.Size = UDim2.new(1, 0, 1, 0) label.Text = player.Name label.TextColor3 = Color3.fromRGB(255, 255, 255) label.Font = Enum.Font.SourceSansBold label.TextSize = 14
    end
    player.CharacterAdded:Connect(create) create()
end
CreateButton("ESP Players", function(state)
    States.ESP = state
    for _, p in pairs(Players:GetPlayers()) do if p.Character then if p.Character:FindFirstChild("ESPHighlight") then p.Character.ESPHighlight.Enabled = state end if p.Character:FindFirstChild("ESPName") then p.Character.ESPName.Enabled = state end end end
end)
Players.PlayerAdded:Connect(applyESP) for _, p in pairs(Players:GetPlayers()) do applyESP(p) end

CreateButton("Ritual", function(state)
    States.Ritual = state
    if state then
        local char = Players.LocalPlayer.Character
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then return end
        local platform = Instance.new("Part", workspace)
        platform.Size = Vector3.new(10, 1, 10)
        platform.Color = Color3.fromRGB(0, 0, 0)
        platform.Material = Enum.Material.Neon
        platform.CFrame = root.CFrame * CFrame.new(0, -3.5, 0)
        platform.Anchored = true
        spawn(function()
            local spinSpeed = 0
            local liftSpeed = 0.1
            while States.Ritual and char and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0 do
                spinSpeed = spinSpeed + 0.5
                platform.CFrame = platform.CFrame * CFrame.Angles(0, math.rad(spinSpeed), 0) + Vector3.new(0, liftSpeed, 0)
                root.CFrame = platform.CFrame * CFrame.new(0, 3.5, 0)
                if spinSpeed > 50 then liftSpeed = 0.5 end
                if spinSpeed > 150 then wait(1) char.Humanoid.Health = 0 break end
                RunService.RenderStepped:Wait()
            end
            platform:Destroy()
        end)
    end
end)

local originalTransparencies = {}
local function applyXray(part)
    if States.Xray and part:IsA("BasePart") and not part:IsDescendantOf(Players.LocalPlayer.Character) then
        if part.Transparency < 1 then
            local isPlayer = false
            for _, p in pairs(Players:GetPlayers()) do if p.Character and part:IsDescendantOf(p.Character) then isPlayer = true break end end
            if not isPlayer then originalTransparencies[part] = part.Transparency part.Transparency = 0.45 end
        end
    end
end
workspace.DescendantAdded:Connect(applyXray)
CreateButton("X-Ray", function(state)
    States.Xray = state
    if state then for _, v in pairs(workspace:GetDescendants()) do applyXray(v) end
    else for part, trans in pairs(originalTransparencies) do if part and part.Parent then part.Transparency = trans end end originalTransparencies = {} end
end)

-- TELEPORTES COM CORES FIXAS
CreateButton("Teleporte 1", function()
    local root = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if root and SavedPos1 then root.CFrame = SavedPos1 end
end, Color3.fromRGB(0, 191, 255))

CreateButton("Teleporte 2", function()
    local root = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if root and SavedPos2 then root.CFrame = SavedPos2 end
end, Color3.fromRGB(0, 191, 255))

CreateButton("Salvar Posição 1", function()
    local root = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if root then SavedPos1 = root.CFrame CreateBeacon(SavedPos1, Color3.fromRGB(0, 191, 255), 1) end
end, Color3.fromRGB(0, 255, 0))

CreateButton("Salvar Posição 2", function()
    local root = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if root then SavedPos2 = root.CFrame CreateBeacon(SavedPos2, Color3.fromRGB(0, 255, 0), 2) end
end, Color3.fromRGB(0, 255, 0))

-- Lógica de Acesso
KeyButton.MouseButton1Click:Connect(function()
    if KeyInput.Text == "2026" then
        TweenService:Create(KeyFrame, TweenInfo.new(0.5), {BackgroundColor3 = Color3.fromRGB(0, 100, 0)}):Play()
        wait(0.5)
        TweenService:Create(KeyFrame, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1}):Play()
        TweenService:Create(Blur, TweenInfo.new(1.2, Enum.EasingStyle.Quart), {Size = 0}):Play()
        wait(1.2)
        KeyFrame:Destroy()
        IntroFrame:Destroy()
        MainFrame.Visible = true
        MinimizeButton.Visible = true
        MainFrame.Size = UDim2.new(0, 0, 0, 0)
        TweenService:Create(MainFrame, TweenInfo.new(1.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = originalSize}):Play()
    else
        local originalColor = KeyFrame.BackgroundColor3
        TweenService:Create(KeyFrame, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(100, 0, 0)}):Play()
        local origPos = KeyFrame.Position
        for i = 1, 3 do
            TweenService:Create(KeyFrame, TweenInfo.new(0.05), {Position = origPos + UDim2.new(0, 10, 0, 0)}):Play()
            wait(0.05)
            TweenService:Create(KeyFrame, TweenInfo.new(0.05), {Position = origPos - UDim2.new(0, 10, 0, 0)}):Play()
            wait(0.05)
        end
        KeyFrame.Position = origPos
        wait(0.5)
        TweenService:Create(KeyFrame, TweenInfo.new(0.5), {BackgroundColor3 = originalColor}):Play()
    end
end)

-- Inicia Tudo
spawn(function()
    RunIntro()
    KeyFrame.Visible = true
    KeyFrame.Size = UDim2.new(0, 0, 0, 0)
    TweenService:Create(KeyFrame, TweenInfo.new(1.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 220, 0, 180)}):Play()
end)
