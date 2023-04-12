function DannicUI.PlayerFrameIni()
    DannicUI.SetPlayerUnitFrame()
end

function DannicUI.SetPlayerUnitFrame()
    local targetName, targetClass = DannicUI.GetData("player")
    if targetClass == nil then targetClass = "" end
    local texturePath = ("esoui/art/icons/class/gamepad/gp_class_" .. targetClass .. ".dds")
    GetControl("PlayerHealthFrameLabel"):SetText(targetName)
    GetControl("PlayerHealthFrameIcon"):SetTexture(texturePath)
end

function DannicUI.UpdatePlayerFrames()
    local PHC, PHM = GetUnitPower("player", POWERTYPE_HEALTH)
	local PMC, PMM = GetUnitPower("player", POWERTYPE_MAGICKA)
    local PSC, PSM = GetUnitPower("player", POWERTYPE_STAMINA)

    GetControl("PlayerHealthFrameStatusBar"):SetMinMax(0, PHM)
    GetControl("PlayerHealthFrameStatusBar"):SetValue(PHC)
    local PlayerHealthPercentes = math.ceil((PHC / PHM) * 100)
    local PlayerHealthText = (PlayerHealthPercentes .. "% I " .. PHC)
    GetControl("PlayerHealthFrameHealth"):SetText(PlayerHealthText)

    GetControl("PlayerMagickaFrameStatusBar"):SetMinMax(0, PMM)
    GetControl("PlayerMagickaFrameStatusBar"):SetValue(PMC)
    GetControl("PlayerMagickaFrameLabel"):SetText(PMC)

    GetControl("PlayerStaminaFrameStatusBar"):SetMinMax(0, PSM)
    GetControl("PlayerStaminaFrameStatusBar"):SetValue(PSC)
    GetControl("PlayerStaminaFrameLabel"):SetText(PSC)
end