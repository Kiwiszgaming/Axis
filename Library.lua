local UILibrary = {}

function UILibrary:CreateWindow(options)
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")

    ScreenGui.Parent = game.CoreGui
    Frame.Parent = ScreenGui
    Frame.Size = UDim2.new(0, 300, 0, 200)
    Frame.Position = UDim2.new(0.5, -150, 0.5, -100)
    Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

    local Title = Instance.new("TextLabel", Frame)
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.Text = options.Title or "Default Title"
    Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)

    return Frame
end

return UILibrary
