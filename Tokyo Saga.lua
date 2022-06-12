-- Variables --

local workspace = game:GetService("Workspace")
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local camera = workspace.CurrentCamera
local gym = workspace["Local Gym"]["Local Gym"]
local pizza = workspace.Pizza
local bottleBuyer = workspace["Bottle Buyer"].HumanoidRootPart
local npcBottles = workspace["Npc Bottles"].HumanoidRootPart
local motorQuestGiver = workspace["Quest Motor"]
local motorBuyer = workspace["Motor Buyer"]
local motorPart = workspace:FindFirstChild("Motor")

count = 0
bottleAutomation = false
motorAutomation = false

if pizza:IsA("Folder") then
    pizzaPlace = pizza.Pizza
end

-- Training --

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

-- Teleporter --

function TeleportTo(newPlace)
    local plr = game.Players.LocalPlayer
    if plr.Character then
        plr.Character.HumanoidRootPart.CFrame = newPlace.CFrame * CFrame.new(0, 0, -1)
        plr.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(180), 0)
        camera.CFrame = newPlace.CFrame * CFrame.Angles(math.rad(180), 0, 0)
    end
end

-- Automation --

function bottle()

    while bottleAutomation do
        TeleportTo(npcBottles)
        wait(0.5)
        fireclickdetector(game:GetService("Workspace")["Npc Bottles"].ClickDetector)
        wait(0.5)
        TeleportTo(bottleBuyer)
        wait(0.5)
        fireclickdetector(game:GetService("Workspace")["Bottle Buyer"].ClickDetector)
        wait(1)
    end
        
end

function motor()

    while motorAutomation do
        TeleportTo(motorQuestGiver.HumanoidRootPart)
        wait(0.1)
        fireclickdetector(motorQuestGiver.ClickDetector)
        wait()
        fireclickdetector(motorQuestGiver.ClickDetector)
        wait(0.5)
        fireclickdetector(motorQuestGiver.ClickDetector)
        wait(0.5)
        fireclickdetector(motorQuestGiver.ClickDetector)
        wait(1)
        TeleportTo(motorPart.Base)
        wait(0.1)
        fireclickdetector(motorPart.ClickDetector)
        wait()
        fireclickdetector(motorPart.ClickDetector)
        fireclickdetector(motorPart.ClickDetector)
        wait(12.5)
        TeleportTo(motorBuyer.HumanoidRootPart)
        wait(0.1)
        fireclickdetector(motorBuyer.ClickDetector)
        wait(0.5)
        fireclickdetector(motorBuyer.ClickDetector)
        wait(0.5)
        if not motorAutomation then
            break
        end
    end

end


---- gui ----

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()

local w = library:CreateWindow("Tokyo Saga")
local b = w:CreateFolder("Training")
local c = w:CreateFolder("Teleport")
local d = w:CreateFolder("Automation")
local e = w:CreateFolder("Stats")

-- Training --

b:Button("Pushups",function()
    Pushup()
end)

b:Button("Weight",function()
    Weight()
end)

b:Button("Situps",function()
    SitUp()
end)

b:Button("Jump Rope",function()
    JumpRope()
end)

-- Teleport -- 

c:Button("Gym",function()
    TeleportTo(gym)
end)

c:Button("Pizza Place",function()
    TeleportTo(pizzaPlace)
end)

c:Button("Bottle Seller",function()
    TeleportTo(npcBottles)
end)

c:Button("Bottle Buyer",function()
    TeleportTo(bottleBuyer)
end)

-- Stats --

local hSpeed = player.Stats.HitSpeed
local strengthSt = player.Stats.Strength
local defenseSt = player.Stats.Defense
local speedSt = player.Stats.Speed
local stamSt = player.Stats.Stamina

e:Button("Stats (Press F9)",function()
    print("---------------- Stats -----------------")
    print("Hit Speed: " .. hSpeed.Value)
    print("Strength: " .. strengthSt.Value)
    print("Defense: " .. defenseSt.Value)
    print("Speed: " .. speedSt.Value)
    print("Stamina: " .. stamSt.Value)
    print("----------------------------------------")
end)

-- Automation --

d:Toggle("Bottles",function(bool)
    bottleAutomation = bool
    print("Bottle automation is set to " .. bottleAutomation)
    if bottleAutomation then bottle() end
end)

d:Button("Motors",function()
    count += 1
    if count == 1 then
        motorAutomation = true
    elseif count == 2 then
        motorAutomation = false
        count = 0
    end
    motor()
end)