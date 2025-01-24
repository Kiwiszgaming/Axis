-- Gui to Lua
-- Version: 3.2

-- Instances:
local Axis = Instance.new("ScreenGui")
local ImageLabel = Instance.new("ImageLabel")
local TextLabel = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")
local TextButton_2 = Instance.new("TextButton")
local TextBox = Instance.new("TextBox")
local ImageLabel_2 = Instance.new("ImageLabel")
local CloseButton = Instance.new("TextButton")

-- Properties:

Axis.Name = "Axis"
Axis.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Axis.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageLabel.Parent = Axis
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.222471699, 0, 0.158640221, 0)
ImageLabel.Size = UDim2.new(0, 889, 0, 481)
ImageLabel.Image = "http://www.roblox.com/asset/?id=118340303282357"

-- Title Text Label
TextLabel.Parent = ImageLabel
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.0404949374, 0, 0.0249480251, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.FredokaOne
TextLabel.Text = "Axis"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

-- Key Button
TextButton.Parent = ImageLabel
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundTransparency = 1.000
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.017997751, 0, 0.214137211, 0)
TextButton.Size = UDim2.new(0, 200, 0, 50)
TextButton.Font = Enum.Font.FredokaOne
TextButton.Text = "Key"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true

-- Submit Button
TextButton_2.Parent = TextButton
TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton_2.BackgroundTransparency = 1.000
TextButton_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.BorderSizePixel = 0
TextButton_2.Position = UDim2.new(2.18299794, 0, 2.41413689, 0)
TextButton_2.Size = UDim2.new(0, 200, 0, 50)
TextButton_2.Font = Enum.Font.FredokaOne
TextButton_2.Text = "Submit"
TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton_2.TextScaled = true
TextButton_2.TextSize = 14.000
TextButton_2.TextWrapped = true

-- Textbox for Input
TextBox.Parent = TextButton
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundTransparency = 1.000
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(1.42499995, 0, 0.639999986, 0)
TextBox.Size = UDim2.new(0, 515, 0, 50)
TextBox.Font = Enum.Font.FredokaOne
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextScaled = true
TextBox.TextSize = 14.000
TextBox.TextWrapped = true

-- Additional Image Label
ImageLabel_2.Parent = ImageLabel
ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel_2.BackgroundTransparency = 1.000
ImageLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel_2.BorderSizePixel = 0
ImageLabel_2.Position = UDim2.new(0.017997751, 0, 0.00415800419, 0)
ImageLabel_2.Size = UDim2.new(0, 69, 0, 69)
ImageLabel_2.Image = "http://www.roblox.com/asset/?id=92143081133233"

-- Close Button
CloseButton.Name = "CloseButton"
CloseButton.Parent = ImageLabel
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red button
CloseButton.BackgroundTransparency = 1.000
CloseButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(0.85, 0, 0.02, 0)
CloseButton.Size = UDim2.new(0, 50, 0, 50)
CloseButton.Font = Enum.Font.FredokaOne
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextScaled = true
CloseButton.TextSize = 14.000
CloseButton.TextWrapped = true

CloseButton.MouseButton1Click:Connect(function()
    Axis:Destroy() -- Close the UI when clicked
end)

-- Draggable Functionality
local dragging = false
local dragInput, mousePos, framePos

local function update(input)
    local delta = input.Position - dragInput
    local newPos = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
    ImageLabel.Position = newPos
end

ImageLabel.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragInput = input.Position
        framePos = ImageLabel.Position
        input.Changed:Connect(function()
            if dragging == false then
                return
            end
            update(input)
        end)
    end
end)

ImageLabel.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)
