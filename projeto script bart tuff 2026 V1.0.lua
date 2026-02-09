-- Bart Tuff Hub (RESTORED ESP & CINEMATIC)
-- Criado por Manus para Pou999kaka02

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local ButtonsFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local FooterRight = Instance.new("TextLabel")
local FooterLeft = Instance.new("TextLabel")
local MinimizeButton = Instance.new("ImageButton")
local MinimizeCorner = Instance.new("UICorner")

-- Configurações da ScreenGui
ScreenGui.Name = "BartTuffHub_Restored"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- Configurações do Frame Principal
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 220, 0, 300)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)

UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = MainFrame

-- Título "Bart Tuff"
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

-- Rodapés
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
FooterRight.Position = UDim2.new(1, -90, 1, -22)
FooterRight.Size = UDim2.new(0, 80, 0, 15)
FooterRight.Font = Enum.Font.SourceSans
FooterRight.Text = "by: Pou999kaka02"
FooterRight.TextColor3 = Color3.fromRGB(160, 160, 160)
FooterRight.TextSize = 9.000
FooterRight.TextXAlignment = Enum.TextXAlignment.Right

-- Container de Botões
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

-- Bolinha de Minimizar
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

MinimizeCorner.CornerRadius = UDim.new(1, 0)
MinimizeCorner.Parent = MinimizeButton

-- Partículas Lentas
local function SpawnParticles()
    for i = 1, 30 do
        local p = Instance.new("Frame")
        p.Parent = ScreenGui
        p.BackgroundColor3 = Color3.fromHSV(math.random(), 0.7, 1)
        p.Size = UDim2.new(0, 6, 0, 6)
        p.Position = MinimizeButton.Position
        Instance.new("UICorner", p).CornerRadius = UDim.new(1, 0)
        
        local angle = math.rad(math.random(0, 360))
        local dist = math.random(80, 200)
        local targetPos = MinimizeButton.Position + UDim2.new(0, math.cos(angle) * dist, 0, math.sin(angle) * dist)
        
        TweenService:Create(p, TweenInfo.new(2.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position = targetPos,
            BackgroundTransparency = 1,
            Size = UDim2.new(0, 0, 0, 0)
        }):Play()
        game.Debris:AddItem(p, 2.5)
    end
end

-- Animação macOS Lenta
local minimized = false
local lastPosition = MainFrame.Position
local originalSize = MainFrame.Size

MinimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    
    TweenService:Create(MinimizeButton, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 40, 0, 40)}):Play()
    spawn(function()
        wait(0.2)
        TweenService:Create(MinimizeButton, TweenInfo.new(0.4, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {Size = UDim2.new(0, 60, 0, 60)}):Play()
    end)
    SpawnParticles()

    if minimized then
        lastPosition = MainFrame.Position
        TweenService:Create(MainFrame, TweenInfo.new(1.0, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = MinimizeButton.Position,
            BackgroundTransparency = 1
        }):Play()
        spawn(function() wait(1.0) if minimized then MainFrame.Visible = false end end)
    else
        MainFrame.Visible = true
        MainFrame.Size = UDim2.new(0, 0, 0, 0)
        MainFrame.Position = MinimizeButton.Position
        MainFrame.BackgroundTransparency = 1
        TweenService:Create(MainFrame, TweenInfo.new(1.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Size = originalSize,
            Position = lastPosition,
            BackgroundTransparency = 0
        }):Play()
    end
end)

-- Estados
local States = { Speed = 16, Fullbright = false, KillBarts = false, ESP = false }

-- Função para criar botões
local function CreateButton(name, callback)
    local Button = Instance.new("TextButton")
    local BtnCorner = Instance.new("UICorner")
    local UIGradient = Instance.new("UIGradient")
    
    Button.Name = name .. "Btn"
    Button.Parent = ButtonsFrame
    Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Button.Size = UDim2.new(1, 0, 0, 38)
    Button.Font = Enum.Font.SourceSansBold
    Button.Text = name
    Button.TextColor3 = Color3.fromRGB(180, 180, 180)
    Button.TextSize = 15.000
    Button.AutoButtonColor = false
    
    BtnCorner.CornerRadius = UDim.new(0, 8)
    BtnCorner.Parent = Button
    
    UIGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(10, 80, 10)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 150, 30))
    })
    UIGradient.Enabled = false
    UIGradient.Parent = Button

    local active = false
    
    Button.MouseEnter:Connect(function()
        if not active then
            TweenService:Create(Button, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(20, 20, 20)}):Play()
        end
    end)
    Button.MouseLeave:Connect(function()
        if not active then
            TweenService:Create(Button, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
        end
    end)

    Button.MouseButton1Click:Connect(function()
        active = not active
        if active then
            UIGradient.Enabled = true
            TweenService:Create(Button, TweenInfo.new(0.5), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
        else
            TweenService:Create(Button, TweenInfo.new(0.5), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
            spawn(function() wait(0.5) if not active then UIGradient.Enabled = false end end)
        end
        callback(active)
    end)
    return Button
end

-- 1. Slider de Velocidade
local SliderContainer = Instance.new("Frame", ButtonsFrame)
SliderContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SliderContainer.Size = UDim2.new(1, 0, 0, 45)
Instance.new("UICorner", SliderContainer).CornerRadius = UDim.new(0, 8)

local SliderLabel = Instance.new("TextLabel", SliderContainer)
SliderLabel.BackgroundTransparency = 1
SliderLabel.Position = UDim2.new(0, 10, 0, 5)
SliderLabel.Size = UDim2.new(1, -20, 0, 15)
SliderLabel.Font = Enum.Font.SourceSansBold
SliderLabel.Text = "Velocidade: 16"
SliderLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
SliderLabel.TextSize = 14

local SliderBar = Instance.new("TextButton", SliderContainer)
SliderBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SliderBar.Position = UDim2.new(0.1, 0, 0.65, 0)
SliderBar.Size = UDim2.new(0.8, 0, 0, 6)
SliderBar.Text = ""
Instance.new("UICorner", SliderBar).CornerRadius = UDim.new(1, 0)

local SliderDot = Instance.new("Frame", SliderBar)
SliderDot.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
SliderDot.Size = UDim2.new(0, 14, 0, 14)
SliderDot.Position = UDim2.new(0.16, -7, 0.5, -7)
Instance.new("UICorner", SliderDot).CornerRadius = UDim.new(1, 0)

local dragging = false
local function updateSpeed(input)
    local pos = math.clamp((input.Position.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1)
    SliderDot.Position = UDim2.new(pos, -7, 0.5, -7)
    States.Speed = math.floor(pos * 100)
    SliderLabel.Text = "Velocidade: " .. States.Speed
    if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
        Players.LocalPlayer.Character.Humanoid.WalkSpeed = States.Speed
    end
end

SliderBar.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true end end)
UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)
UserInputService.InputChanged:Connect(function(input) if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then updateSpeed(input) end end)

-- 2. Fullbright
local light = game:GetService("Lighting")
CreateButton("Fullbright", function(state)
    States.Fullbright = state
    if state then
        spawn(function()
            while States.Fullbright do
                light.Brightness = 2
                light.ClockTime = 14
                light.GlobalShadows = false
                light.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
                RunService.RenderStepped:Wait()
                if not States.Fullbright then break end
            end
        end)
    else
        light.Brightness = 1
        light.ClockTime = 12
        light.GlobalShadows = true
        light.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
    end
end)

-- 3. Matar Barts
CreateButton("Matar Barts", function(state)
    States.KillBarts = state
    spawn(function()
        while States.KillBarts do
            for _, v in pairs(Players:GetPlayers()) do
                if v ~= Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                    local pos = v.Character.HumanoidRootPart.Position
                    if pos.Magnitude > 100 then
                        Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
                        wait(0.3)
                    end
                end
                if not States.KillBarts then break end
            end
            wait(0.1)
        end
    end)
end)

-- 4. ESP de CONTORNO (Highlight) Restaurado
local function applyESP(player)
    if player == Players.LocalPlayer then return end
    local function create()
        local char = player.Character or player.CharacterAdded:Wait()
        local root = char:WaitForChild("HumanoidRootPart", 10) or char:FindFirstChildWhichIsA("BasePart")
        if not root then return end
        
        -- Contorno (Highlight) - Branco e Pequeno
        local highlight = char:FindFirstChild("ESPHighlight") or Instance.new("Highlight", char)
        highlight.Name = "ESPHighlight"
        highlight.FillTransparency = 1
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        highlight.OutlineTransparency = 0
        highlight.Enabled = States.ESP
        
        -- Nome em cima
        local bbg = char:FindFirstChild("ESPName") or Instance.new("BillboardGui", char)
        bbg.Name = "ESPName"
        bbg.Size = UDim2.new(0, 100, 0, 20)
        bbg.AlwaysOnTop = true
        local size = char:GetExtentsSize()
        bbg.ExtentsOffset = Vector3.new(0, (size.Y/2) + 0.5, 0)
        bbg.Adornee = root
        bbg.Enabled = States.ESP
        
        local label = bbg:FindFirstChild("Label") or Instance.new("TextLabel", bbg)
        label.Name = "Label"
        label.BackgroundTransparency = 1
        label.Size = UDim2.new(1, 0, 1, 0)
        label.Text = player.Name
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.TextStrokeTransparency = 0
        label.Font = Enum.Font.SourceSansBold
        label.TextSize = 14
    end
    player.CharacterAdded:Connect(create)
    create()
end

CreateButton("ESP Players", function(state)
    States.ESP = state
    for _, p in pairs(Players:GetPlayers()) do
        if p.Character then
            if p.Character:FindFirstChild("ESPHighlight") then p.Character.ESPHighlight.Enabled = state end
            if p.Character:FindFirstChild("ESPName") then p.Character.ESPName.Enabled = state end
        end
    end
end)

Players.PlayerAdded:Connect(applyESP)
for _, p in pairs(Players:GetPlayers()) do applyESP(p) end

print("Bart Tuff Hub Restored - Carregado!")
