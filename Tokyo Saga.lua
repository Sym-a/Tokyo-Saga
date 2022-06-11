local workspace = game:GetService("Workspace")
local gym = workspace["Local Gym"]["Local Gym"]
local pizza = workspace.Pizza
local waitTime = 0

if pizza:IsA("Folder") then
    pizzaPlace = pizza.Pizza
end

function Strength()
    while true do
        local args = {
            [1] = game:GetService("Players").LocalPlayer.Character.Strength
        }
        game:GetService("ReplicatedStorage").Pushup:FireServer(unpack(args))
        wait()
    end
end

function Stamina()
    while true do
        local args = {
            [1] = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Jump Rope")
        }
        game:GetService("ReplicatedStorage").Stamina:FireServer(unpack(args))
        wait()
    end
end

function Defense()
    while true do
        local args = {
            [1] = game:GetService("Players").LocalPlayer.Character.Defense
        }
        game:GetService("ReplicatedStorage").Defense:FireServer(unpack(args))
        wait()
    end
end

function TeleportTo(newPlace)
    local plr = game.Players.LocalPlayer
    if plr.Character then
        plr.Character.HumanoidRootPart.CFrame = newPlace.CFrame
    end
end

-- gui --

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()
local w = library:CreateWindow("Tokyo Saga")
local b = w:CreateFolder("Training")
local c = w:CreateFolder("Teleport")
local b2 = w:CreateFolder("#Destroy Gui")

b2:DestroyGui()

b:Button("Strength", function()
    Strength()
end)

b:Button("Defense", function()
    Defense()
end)

b:Button("Stamina", function()
    Stamina()
end)

c:Button("Teleport Gym",function()
    TeleportTo(gym)
end)

c:Button("Teleport Pizza Shop",function()
    TeleportTo(pizzaPlace)
end)