DannicUI = DannicUI or {}
DannicUI.name = "DannicUI"
DannicUI.version = "0.1"

function DannicUI.OnAddOnLoaded(event, addonName)
        if addonName == DannicUI.name then
        DannicUI.Initialize()
        DannicUI.InitSettings()
        DannicUI.PlayerFrameIni()
    end
end

function DannicUI.Initialize()
    DannicUI.UpdatePlayerFrames()
    DannicUI.ToggleZOFrames()
    DannicUI.DefaultSavedVariables()

    EVENT_MANAGER:UnregisterForEvent(DannicUI.name, EVENT_ADD_ON_LOADED)
end

function DannicUI.GetData(target)
    if target == "target" then target = "reticleover" end
    local targetName = GetUnitName(target)
    local classId = GetUnitClassId(target)
    local classNames = {
        [1] = "Dragonknight",
        [2] = "Sorcerer",
        [3] = "Nightblade",
        [4] = "Warden",
        [5] = "Necromancer",
        [6] = "Templar",
        [7] = "Arcanist",
    }
    local targetClass = classNames[classId]
    
    return targetName, targetClass
end

function DannicUI.UpdateFrames()
    DannicUI.UpdatePlayerFrames()
    DannicUI.UpdateTargetFrames()
end

function DannicUI.ToggleZOFrames()
--	ZO_PlayerAttributeMagicka:SetHidden(true)
--	ZO_PlayerAttributeStamina:SetHidden(true)
--  ZO_PlayerAttributeWerewolf:SetHidden(true)
--	ZO_PlayerAttributeSiegeHealth:SetHidden(true)
--	ZO_PlayerAttributeMountStamina:SetHidden(true)
    UNIT_FRAMES:SetFrameHiddenForReason("reticleover", "TweakItFrameOff", true)
end

EVENT_MANAGER:RegisterForEvent(DannicUI.name, EVENT_ADD_ON_LOADED, DannicUI.OnAddOnLoaded)
EVENT_MANAGER:RegisterForEvent(DannicUI.name, EVENT_POWER_UPDATE, DannicUI.UpdateFrames)
