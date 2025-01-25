-- Gui to Lua
-- Version: 3.2

-- Instances:

local Axis = Instance.new("ScreenGui")
local ImageLabel = Instance.new("ImageLabel")
local Close = Instance.new("ImageButton")
local Lesspend = Instance.new("ImageButton")
local Expend = Instance.new("ImageButton")
local ImageLabel_2 = Instance.new("ImageLabel")
local TextBox = Instance.new("TextBox")
local Submit = Instance.new("ImageButton")
local AxisLogo = Instance.new("ImageLabel")
local AxisText = Instance.new("TextLabel")

-- Services:

local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

-- Properties:

Axis.Name = "Axis"
Axis.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Axis.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Axis.ResetOnSpawn = false

ImageLabel.Name = "MainUI"
ImageLabel.Parent = Axis
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1
ImageLabel.Position = UDim2.new(0.5, -461, 0.5, -250)
ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel.Size = UDim2.new(0, 923, 0, 500)
ImageLabel.Image = "rbxassetid://118699325436446"
ImageLabel.Visible = false

Close.Name = "Close"
Close.Parent = ImageLabel
Close.BackgroundTransparency = 1
Close.Position = UDim2.new(0.95, -50, 0.05, 0)
Close.Size = UDim2.new(0, 40, 0, 40)
Close.Image = "rbxassetid://113583318939835"

Lesspend.Name = "Lesspend"
Lesspend.Parent = ImageLabel
Lesspend.BackgroundTransparency = 1
Lesspend.Position = UDim2.new(0.85, -50, 0.05, 0)
Lesspend.Size = UDim2.new(0, 40, 0, 40)
Lesspend.Image = "rbxassetid://82584071856673"

Expend.Name = "Expend"
Expend.Parent = Axis
Expend.BackgroundTransparency = 1
Expend.Position = UDim2.new(0.5, -20, 0.5, 50)
Expend.Size = UDim2.new(0, 40, 0, 40)
Expend.Visible = false
Expend.Image = "rbxassetid://94148010820936"

ImageLabel_2.Name = "InputBoxContainer"
ImageLabel_2.Parent = ImageLabel
ImageLabel_2.BackgroundTransparency = 1
ImageLabel_2.Position = UDim2.new(0.1, 0, 0.3, 0)
ImageLabel_2.Size = UDim2.new(0.8, 0, 0.2, 0)
ImageLabel_2.Image = "rbxassetid://80244724815279"

TextBox.Parent = ImageLabel_2
TextBox.BackgroundTransparency = 1
TextBox.Size = UDim2.new(1, 0, 1, 0)
TextBox.Font = Enum.Font.FredokaOne
TextBox.Text = "Enter something..."
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextScaled = true

Submit.Name = "Submit"
Submit.Parent = ImageLabel
Submit.BackgroundTransparency = 1
Submit.Position = UDim2.new(0.5, -100, 0.6, 0)
Submit.Size = UDim2.new(0, 200, 0, 50)
Submit.Image = "rbxassetid://70541257675712"

AxisLogo.Name = "AxisLogo"
AxisLogo.Parent = Axis
AxisLogo.BackgroundTransparency = 1
AxisLogo.AnchorPoint = Vector2.new(0.5, 0.5)
AxisLogo.Position = UDim2.new(0.5, 0, 0.4, 0)
AxisLogo.Size = UDim2.new(0, 150, 0, 150)
AxisLogo.Image = "rbxassetid://92143081133233"

AxisText.Name = "AxisText"
AxisText.Parent = Axis
AxisText.BackgroundTransparency = 1
AxisText.AnchorPoint = Vector2.new(0.5, 0.5)
AxisText.Position = UDim2.new(0.5, 0, 0.55, 0)
AxisText.Size = UDim2.new(0, 300, 0, 50)
AxisText.Font = Enum.Font.FredokaOne
AxisText.Text = "Axis"
AxisText.TextColor3 = Color3.fromRGB(255, 255, 255)
AxisText.TextScaled = true

-- Functions:

local function popUpAnimation()
    -- Axis Logo Animation:
    AxisLogo.Visible = true
    AxisText.Visible = true

    -- Tween Axis Logo and Text:
    local logoTween = TweenService:Create(
        AxisLogo,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Size = UDim2.new(0, 200, 0, 200), ImageTransparency = 0}
    )
    local textTween = TweenService:Create(
        AxisText,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {TextTransparency = 0}
    )

    logoTween:Play()
    textTween:Play()
    wait(2)

    -- Hide Axis Logo and Show Main UI:
    local hideTween = TweenService:Create(
        AxisLogo,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {ImageTransparency = 1}
    )
    local hideTextTween = TweenService:Create(
        AxisText,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {TextTransparency = 1}
    )

    hideTween:Play()
    hideTextTween:Play()
    hideTween.Completed:Wait()

    -- Pop-up UI:
    ImageLabel.Visible = true
    local popUpTween = TweenService:Create(
        ImageLabel,
        TweenInfo.new(0.5, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out),
        {Size = UDim2.new(0, 923, 0, 500)}
    )
    popUpTween:Play()
end

-- Call Animation:
popUpAnimation()

-- Close Button:
Close.MouseButton1Click:Connect(function()
    local closeTween = TweenService:Create(ImageLabel, TweenInfo.new(0.5), {Size = UDim2.new(0, 0, 0, 0)})
    closeTween:Play()
    closeTween.Completed:Wait()
    Axis:Destroy()
end)

-- Resize UI:
Lesspend.MouseButton1Click:Connect(function()
    Lesspend.Visible = false
    Expend.Visible = true
    local shrinkTween = TweenService:Create(ImageLabel, TweenInfo.new(0.5), {Size = UDim2.new(0, 500, 0, 300)})
    shrinkTween:Play()
end)

Expend.MouseButton1Click:Connect(function()
    Expend.Visible = false
    Lesspend.Visible = true
    local expandTween = TweenService:Create(ImageLabel, TweenInfo.new(0.5), {Size = UDim2.new(0, 923, 0, 500)})
    expandTween:Play()
end)

