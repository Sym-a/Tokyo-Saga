-- Variables --

player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local workspace = game:GetService("Workspace")
local camera = workspace.CurrentCamera
local gym = workspace["Local Gym"]["Local Gym"]
local pizza = workspace.Pizza
local bottleBuyer = workspace["Bottle Buyer"].HumanoidRootPart
local npcBottles = workspace["Npc Bottles"].HumanoidRootPart
local motorQuestGiver = workspace["Quest Motor"]
local motorBuyer = workspace["Motor Buyer"]
local motorPart = workspace:FindFirstChild("Motor")
local stats1 = player.Stats
local stats2 = player.Stats2
local hunger = stats1.Hungry
local dashPower1 = stats1.DashPower 
local dashpower2 = stats2.DashPower

count = 0
count2 = 0
countxp = 0
countHung = 0
countinfDod = 0
countDebounce = 0
countM1s = 0
bottleAutomation = false
motorAutomation = false
xpAutomation = false
hungerAutomation = false
infDodAut = false
a = false
infM1sBool = false

if pizza:IsA("Folder") then
    pizzaPlace = pizza.Pizza
end

hunger.Value = 100
dashPower1.Value = 50
dashpower2.Value = 50

-- Training --

function Pushup()
    while true do
        local args = {
            [1] = game:GetService("Players").LocalPlayer.Character.Strength
        }
        game:GetService("ReplicatedStorage").Pushup:FireServer(unpack(args))
        wait(0.1)
    end
end

function JumpRope()
    while true do
        local args = {
            [1] = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Jump Rope")
        }
        game:GetService("ReplicatedStorage").Stamina:FireServer(unpack(args))
        wait(0.1)
    end
end

function SitUp()
    while true do
        local args = {
            [1] = game:GetService("Players").LocalPlayer.Character.Defense
        }
        game:GetService("ReplicatedStorage").Defense:FireServer(unpack(args))
        wait(0.1)
    end
end

function Weight()
    while true do
        local args = {
            [1] = game:GetService("Players").LocalPlayer.Character.Weight
        }
        game:GetService("ReplicatedStorage").Weight:FireServer(unpack(args))
        wait(0.1)
    end
end

function advSitUps()
    while true do
        local args = {
            [1] = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Advance Defense")
        }
        game:GetService("ReplicatedStorage").AdvDefense:FireServer(unpack(args))
        wait(0.1)
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
        if not bottleAutomation then
            break
        end
    end
        
end

function motor()

    while motorAutomation do
        TeleportTo(motorQuestGiver.HumanoidRootPart)
        wait(0.1)
        for x = 1, 4 do
            fireclickdetector(motorQuestGiver.ClickDetector)
            wait(0.1)
        end
        wait(1)
        TeleportTo(motorPart.Base)
        wait(0.1)
        fireclickdetector(motorPart.ClickDetector)
        wait()
        for x = 1, 7 do
            fireclickdetector(motorPart.ClickDetector)
        end
        wait(11)
        TeleportTo(motorBuyer.HumanoidRootPart)
        wait(0.1)
        for x = 1, 3 do
            fireclickdetector(motorBuyer.ClickDetector)
            wait(0.5)
        end
        if not motorAutomation then
            break
        end
    end

end

function XP()

    while xpAutomation do
        game:GetService("ReplicatedStorage").Quest.Protein:FireServer()
        wait(60)
        if not xpAutomation then
            break
        end
    end

end

function HungerAutF()

    local hunger = player.Stats.Hungry
    while hungerAutomation do
        hunger.Value = 100
        wait(60)
        if not hungerAutomation then
            break
        end
    end

end

function infDodges()

    while infDodAut do
        local args1 = {
            [1] = "Dodge"
        }
        local args2 = {
            [1] = "Release"
        }
        game:GetService("Players").LocalPlayer.Backpack.Dodge.RemoteEvent:FireServer(unpack(args1))
        wait(0.5)
        game:GetService("Players").LocalPlayer.Backpack.Dodge.RemoteEvent:FireServer(unpack(args2))
        if not infDodAut then
            break
        end
    end

end

function infM1s()

    while infM1sBool do
        local args = {
        [1] = 2,
        [2] = game:GetService("Players").LocalPlayer.Character
        }

        game:GetService("Players").LocalPlayer.Character.NonStyle.Combat.Hits:FireServer(unpack(args))
        wait(0.01)
        if not infM1sBool then
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
local e = w:CreateFolder("Refill")
local f = w:CreateFolder("Stats")
local g = w:CreateFolder("KeyBinds")

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

b:Button("Advanced Situps",function()
    advSitUps()
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

-- Automation --

d:Button("Bottles",function()
    count += 1
    if count == 1 then
        bottleAutomation = true
    elseif count == 2 then
        bottleAutomation = false
        count = 0
    end
    bottle()
end)

d:Button("Motors",function()
    count2 += 1
    if count2 == 1 then
        motorAutomation = true
    elseif count2 == 2 then
        motorAutomation = false
        count2 = 0
    end
    motor()
end)

d:Button("Inf 2x XP",function()
    countxp += 1
    if countxp == 1 then
        xpAutomation = true
    elseif countxp == 2 then
        xpAutomation = false
        countxp = 0
    end
    XP()
end)

d:Button("Inf Hunger",function()
    countHung += 1
    if countHung == 1 then
        hungerAutomation = true
    elseif countHung == 2 then
        hungerAutomation = false
        countHung = 0
    end
    HungerAutF()
end)

-- Refill --

e:Button("Hunger",function()
    hunger.Value = 100
end)

e:Button("Fix Dodge", function()
    dashPower1.Value = 50
    dashpower2.Value = 50
end)

-- Stats --

local hSpeed = player.Stats.HitSpeed
local strengthSt = player.Stats.Strength
local defenseSt = player.Stats.Defense
local speedSt = player.Stats.Speed
local stamSt = player.Stats.Stamina

f:Button("Stats (Press F9)",function()
    print("---------------- Stats -----------------")
    print("Hit Speed: " .. hSpeed.Value)
    print("Strength: " .. strengthSt.Value)
    print("Defense: " .. defenseSt.Value)
    print("Speed: " .. speedSt.Value)
    print("Stamina: " .. stamSt.Value)
    print("----------------------------------------")
end)

-- Binds --

g:Bind("Inf Dodges",Enum.KeyCode.C,function()
    countinfDod += 1
    if countinfDod == 1 then
        infDodAut = true
    elseif countinfDod == 2 then
        infDodAut = false
        countinfDod = 0
    end
    infDodges()
end)

g:Bind("Capoeira 320 Kick",Enum.KeyCode.X,function()
    local args = {
        [1] = game:GetService("Players").LocalPlayer.Character
    }
    
    game:GetService("Players").LocalPlayer.Character:FindFirstChild("320 Kick").Combat.M2:FireServer(unpack(args))
end)

g:Bind("Capoeira Back Kick",Enum.KeyCode.Z,function()
    local args = {
        [1] = game:GetService("Players").LocalPlayer.Character
    }
    
    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Back Kick").Combat.M2:FireServer(unpack(args))
end)

g:Bind("Spam m1s",Enum.KeyCode.G,function()
    countM1s += 1
    if countM1s == 1 then
        infM1sBool = true
    elseif countM1s == 2 then
        infM1sBool = false
        countM1s = 0
    end
    infM1s()
end)