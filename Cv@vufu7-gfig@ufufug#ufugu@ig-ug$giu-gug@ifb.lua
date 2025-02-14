--/ By Conso1e Telegram channel

local sounds = {}
local currentSound = nil

local function createSound(soundId)
    local sound = Instance.new("Sound", workspace)
    sound.SoundId = soundId
    return sound
end

table.insert(sounds, createSound("rbxassetid://87372387446449"))
table.insert(sounds, createSound("rbxassetid://101543940535825"))
table.insert(sounds, createSound("rbxassetid://80533158032188"))
table.insert(sounds, createSound("rbxassetid://95443055804465"))

local function playSound(index)
    if currentSound then
        currentSound:Stop()
    end
    
    currentSound = sounds[index]
    currentSound:Play()
end

local function stopSound()
    if currentSound then
        currentSound:Stop()
        currentSound = nil
    end
end
