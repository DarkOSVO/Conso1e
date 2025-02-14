local sounds = {}
local currentSound = nil

local function createSound(soundId)
    local sound = Instance.new("Sound", workspace)
    sound.SoundId = soundId
    return sound
end

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
