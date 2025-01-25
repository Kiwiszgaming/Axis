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

--Properties:

Axis.Name = "Axis"
Axis.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Axis.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageLabel.Parent = Axis
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.211873189, 0, 0.145631, 0)
ImageLabel.Size = UDim2.new(0, 923, 0, 500)
ImageLabel.Image = "rbxassetid://118699325436446"

Close.Name = "Close"
Close.Parent = ImageLabel
Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close.BackgroundTransparency = 1.000
Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.884073675, 0, 0.0299999993, 0)
Close.Size = UDim2.new(0, 50, 0, 50)
Close.Image = "rbxassetid://113583318939835"

Lesspend.Name = "Lesspend"
Lesspend.Parent = ImageLabel
Lesspend.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Lesspend.BackgroundTransparency = 1.000
Lesspend.BorderColor3 = Color3.fromRGB(0, 0, 0)
Lesspend.BorderSizePixel = 0
Lesspend.Position = UDim2.new(0.816901386, 0, 0.0299999993, 0)
Lesspend.Size = UDim2.new(0, 50, 0, 50)
Lesspend.Image = "rbxassetid://82584071856673"

Expend.Name = "Expend"
Expend.Parent = Lesspend
Expend.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Expend.BackgroundTransparency = 1.000
Expend.BorderColor3 = Color3.fromRGB(0, 0, 0)
Expend.BorderSizePixel = 0
Expend.Position = UDim2.new(-0.00309814443, 0, -0.00999999978, 0)
Expend.Size = UDim2.new(0, 50, 0, 50)
Expend.Visible = false
Expend.Image = "rbxassetid://94148010820936"

ImageLabel_2.Parent = ImageLabel
ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel_2.BackgroundTransparency = 1.000
ImageLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel_2.BorderSizePixel = 0
ImageLabel_2.Position = UDim2.new(0.322860241, 0, 0.275999993, 0)
ImageLabel_2.Size = UDim2.new(0, 568, 0, 62)
ImageLabel_2.Image = "rbxassetid://80244724815279"

TextBox.Parent = ImageLabel_2
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundTransparency = 1.000
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0, 0, 0.145161286, 0)
TextBox.Size = UDim2.new(0, 568, 0, 44)
TextBox.Font = Enum.Font.FredokaOne
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextScaled = true
TextBox.TextSize = 14.000
TextBox.TextWrapped = true

Submit.Name = "Submit"
Submit.Parent = ImageLabel
Submit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Submit.BackgroundTransparency = 1.000
Submit.BorderColor3 = Color3.fromRGB(0, 0, 0)
Submit.BorderSizePixel = 0
Submit.Position = UDim2.new(0.522210181, 0, 0.505999982, 0)
Submit.Size = UDim2.new(0, 200, 0, 50)
Submit.Image = "rbxassetid://70541257675712"

AxisLogo.Name = "AxisLogo"
AxisLogo.Parent = Axis
AxisLogo.BackgroundTransparency = 1
AxisLogo.Position = UDim2.new(0.5, -50, 0.3, -50)
AxisLogo.Size = UDim2.new(0, 100, 0, 100)
AxisLogo.Image = "rbxassetid://92143081133233"

AxisText.Name = "AxisText"
AxisText.Parent = Axis
AxisText.BackgroundTransparency = 1
AxisText.Position = UDim2.new(0.5, -50, 0.5, -25)
AxisText.Size = UDim2.new(0, 200, 0, 50)
AxisText.Font = Enum.Font.FredokaOne
AxisText.Text = "Axis"
AxisText.TextColor3 = Color3.fromRGB(255, 255, 255)
AxisText.TextScaled = true

-- Services:

local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local dragging, dragStart, startPos

-- Dragging Functionality:
ImageLabel.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = ImageLabel.Position
    end
end)

ImageLabel.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        ImageLabel.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- Close Button:
Close.MouseButton1Click:Connect(function()
    local closeTween = TweenService:Create(ImageLabel, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1, Size = UDim2.new(0, 0, 0, 0)})
    closeTween:Play()
    closeTween.Completed:Wait()
    Axis:Destroy()
end)

-- Resize (Lesspend and Expend):
Lesspend.MouseButton1Click:Connect(function()
    Lesspend.Visible = false
    Expend.Visible = true
    local shrinkTween = TweenService:Create(ImageLabel, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 500, 0, 300)})
    shrinkTween:Play()
    TextBox.Visible = false
end)

Expend.MouseButton1Click:Connect(function()
    Expend.Visible = false
    Lesspend.Visible = true
    local expandTween = TweenService:Create(ImageLabel, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 923, 0, 500)})
    expandTween:Play()
    TextBox.Visible = true
end)

-- Axis Logo and Text Animation:
local logoTween = TweenService:Create(AxisLogo, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0, Position = UDim2.new(0.5, -50, 0.3, -25)})
local textTween = TweenService:Create(AxisText, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0})

wait(2)
logoTween:Play()
textTween:Play()
logoTween.Completed:Wait()

wait(5)
local fadeOutLogoTween = TweenService:Create(AxisLogo, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 1})
local fadeOutTextTween = TweenService:Create(AxisText, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 1})
fadeOutLogoTween:Play()
fadeOutTextTween:Play()
fadeOutLogoTween.Completed:Wait()

AxisLogo.Visible = false
AxisText.Visible = false

-- Submit Button Functionality:
Submit.MouseButton1Click:Connect(function()
    local inputText = TextBox.Text
    if inputText and inputText ~= "" then
        print("Submitted Text: " .. inputText)
        TextBox.Text = ""
    else
        print("TextBox is empty!")
    end
end)
