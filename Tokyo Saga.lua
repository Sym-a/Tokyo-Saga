local workspace = game:GetService("Workspace")
local gym = workspace["Local Gym"]["Local Gym"]
local pizza = workspace.Pizza
local bottleBuyer = workspace["Bottle Buyer"].HumanoidRootPart
local npcBottles = workspace["Npc Bottles"].HumanoidRootPart

if pizza:IsA("Folder") then
    pizzaPlace = pizza.Pizza
end

function Pushup()
    while true do
        local args = {
            [1] = game:GetService("Players").LocalPlayer.Character.Strength
        }
        game:GetService("ReplicatedStorage").Pushup:FireServer(unpack(args))
        wait()
    end
end

function JumpRope()
    while true do
        local args = {
            [1] = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Jump Rope")
        }
        game:GetService("ReplicatedStorage").Stamina:FireServer(unpack(args))
        wait()
    end
end

function SitUp()
    while true do
        local args = {
            [1] = game:GetService("Players").LocalPlayer.Character.Defense
        }
        game:GetService("ReplicatedStorage").Defense:FireServer(unpack(args))
        wait()
    end
end

function Weight()
    while true do
        local args = {
            [1] = game:GetService("Players").LocalPlayer.Character.Weight
        }
        game:GetService("ReplicatedStorage").Weight:FireServer(unpack(args))
        wait()
    end
end

function TeleportTo(newPlace)
    local plr = game.Players.LocalPlayer
    if plr.Character then
        plr.Character.HumanoidRootPart.CFrame = newPlace.CFrame
    end
end

function Money()
    game:GetService("ReplicatedStorage").Quest.IJob2:FireServer()
end


-- gui --

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()
local w = library:CreateWindow("Tokyo Saga")
local b = w:CreateFolder("Training")
local c = w:CreateFolder("Teleport")
local d = w:CreateFolder("Money")
local b2 = w:CreateFolder(".Destroy Gui")

b2:DestroyGui()

b:Button("Weight", function()
    Weight()
end)

b:Button("Pushup", function()
    Pushup()
end)

b:Button("SitUp", function()
    SitUp()
end)

b:Button("Jump Rope", function()
    JumpRope()
end)

c:Button("Gym",function()
    TeleportTo(gym)
end)

c:Button("Pizza Shop",function()
    TeleportTo(pizzaPlace)
end)

c:Button("Bottle Buyer",function()
    TeleportTo(bottleBuyer)
end)

c:Button("Npc Bottles",function()
    TeleportTo(npcBottles)
end)

d:Button("Bottle Buyer", function()
    Money()
end)