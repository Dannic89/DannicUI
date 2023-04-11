function DannicUI.PlayerFrameIni()

    DannicUI.SetPlayerUnitFrame()
end

function DannicUI.SetPlayerUnitFrame()
    local targetName, targetClass = DannicUI.GetData("player")
    if targetClass == nil then targetClass = "" end
    local texturePath = ("esoui/art/icons/class/gamepad/gp_class_" .. targetClass .. ".dds")
    GetControl("PlayerHealthFrameLabel"):SetText(targetName)
    GetControl("PlayerHealthFrameIcon"):SetTexture(texturePath)
    
    GetControl("PlayerHealthFrame"):SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, DannicUI.SavedVariables.PlayerHealthPosX, DannicUI.SavedVariables.PlayerHealthPosY)
    GetControl("PlayerHealthFrame"):SetDimensions(DannicUI.SavedVariables.PlayerHealthWidth, DannicUI.SavedVariables.PlayerHealthHeight)
    GetControl("PlayerMagickaFrame"):SetDimensions(DannicUI.SavedVariables.PlayerMagickaWidth, DannicUI.SavedVariables.PlayerMagickaHeight) 
    GetControl("PlayerStaminaFrame"):SetDimensions(DannicUI.SavedVariables.PlayerStaminaWidth, DannicUI.SavedVariables.PlayerStaminaHeight)
    GetControl("PlayerHealthFrameStatusBar"):SetColor(unpack(DannicUI.SavedVariables.PlayerHealthColor))
    GetControl("PlayerMagickaFrameStatusBar"):SetColor(unpack(DannicUI.SavedVariables.PlayerMagickaColor))
    GetControl("PlayerStaminaFrameStatusBar"):SetColor(unpack(DannicUI.SavedVariables.PlayerStaminaColor))


end

function DannicUI.UpdatePlayerFrames()
    --local r = DannicUI.SavedVariables.PlayerStaminaColor{r}
    --d(stamr)

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