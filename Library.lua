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
local Close1 = Instance.new("ImageButton")

--Properties:

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

TextBox.Parent = TextButton
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundTransparency = 1.000
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(1.42499995, 0, 0.639999986, 0)
TextBox.Size = UDim2.new(0, 515, 0, 50)
TextBox.Font = Enum.Font.FredokaOne
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextScaled = true
TextBox.TextSize = 14.000
TextBox.TextWrapped = true

ImageLabel_2.Parent = ImageLabel
ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel_2.BackgroundTransparency = 1.000
ImageLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel_2.BorderSizePixel = 0
ImageLabel_2.Position = UDim2.new(0.017997751, 0, 0.00415800419, 0)
ImageLabel_2.Size = UDim2.new(0, 69, 0, 69)
ImageLabel_2.Image = "http://www.roblox.com/asset/?id=92143081133233"

Close1.Name = "Close1"
Close1.Parent = ImageLabel
Close1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close1.BackgroundTransparency = 1.000
Close1.BorderColor3 = Color3.fromRGB(0, 0, 0)
Close1.BorderSizePixel = 0
Close1.Position = UDim2.new(0.95050621, 0, -0.0623700619, 0)
Close1.Size = UDim2.new(0, 74, 0, 74)
Close1.Image = "http://www.roblox.com/asset/?id=112114240564751"

-- Draggable UI
local dragging = false
local dragInput, dragStart, startPos

local function updateDrag(input)
    local delta = input.Position - dragStart
    Axis.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

ImageLabel.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Axis.Position

        -- Track input movement
        input.Changed:Connect(function()
            if dragging and input.UserInputState == Enum.UserInputState.Moving then
                updateDrag(input)
            end
        end)
    end
end)

ImageLabel.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- Close the UI when clicking the close button
Close1.MouseButton1Click:Connect(function()
    Axis:Destroy()  -- This will remove the entire UI
end)
