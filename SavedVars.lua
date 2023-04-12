function DannicUI.DefaultSavedVariables()
    DannicUI.SavedVariables = ZO_SavedVars:NewCharacterIdSettings("DannicUIVars", 1, nil, nil)
 
    -- Player Health Frame Start
        if (DannicUI.SavedVariables.PlayerHealthHeight == nil) then
            DannicUI.SavedVariables.PlayerHealthHeight = 42
        end
        if (DannicUI.SavedVariables.PlayerHealthWidth == nil) then
            DannicUI.SavedVariables.PlayerHealthWidth = 390
        end
        GetControl("PlayerHealthFrame"):SetDimensions(DannicUI.SavedVariables.PlayerHealthWidth, DannicUI.SavedVariables.PlayerHealthHeight)
        if (DannicUI.SavedVariables.PlayerHealthColor == nil) then
            DannicUI.SavedVariables.PlayerHealthColor = { 1, 0, 0, 1 }
        end
        GetControl("PlayerHealthFrameStatusBar"):SetColor(unpack(DannicUI.SavedVariables.PlayerHealthColor))
        if (DannicUI.SavedVariables.PlayerHealthPosX == nil) then
            DannicUI.SavedVariables.PlayerHealthPosX = 420
        end
        if (DannicUI.SavedVariables.PlayerHealthPosY == nil) then
            DannicUI.SavedVariables.PlayerHealthPosY = 1036
        end
        GetControl("PlayerHealthFrame"):SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, DannicUI.SavedVariables.PlayerHealthPosX, DannicUI.SavedVariables.PlayerHealthPosY)
        if (DannicUI.SavedVariables.ZO_PlayerAttributeHealth == nil) then
            DannicUI.SavedVariables.ZO_PlayerAttributeHealth = false
        end
        ZO_PlayerAttributeHealth:SetHidden(not DannicUI.SavedVariables.ZO_PlayerAttributeHealth)
    -- Player Health Frame End
    
    -- Player Magicka Frame Start
        if (DannicUI.SavedVariables.PlayerMagickaHeight == nil) then
            DannicUI.SavedVariables.PlayerMagickaHeight = 8
        end
        if (DannicUI.SavedVariables.PlayerMagickaWidth == nil) then
            DannicUI.SavedVariables.PlayerMagickaWidth = 311
        end
        GetControl("PlayerMagickaFrame"):SetDimensions(DannicUI.SavedVariables.PlayerMagickaWidth, DannicUI.SavedVariables.PlayerMagickaHeight) 
        if (DannicUI.SavedVariables.PlayerMagickaColor == nil) then
            DannicUI.SavedVariables.PlayerMagickaColor = { 0, 0, 1, 1 }
        end
        GetControl("PlayerMagickaFrameStatusBar"):SetColor(unpack(DannicUI.SavedVariables.PlayerMagickaColor))
    -- Player Magicka Frame End
 
    -- Player Stamina Frame Start
        if (DannicUI.SavedVariables.PlayerStaminaHeight == nil) then
            DannicUI.SavedVariables.PlayerStaminaHeight = 8
        end
        if (DannicUI.SavedVariables.PlayerStaminaWidth == nil) then
            DannicUI.SavedVariables.PlayerStaminaWidth = 311
        end
        GetControl("PlayerStaminaFrame"):SetDimensions(DannicUI.SavedVariables.PlayerStaminaWidth, DannicUI.SavedVariables.PlayerStaminaHeight)
        if (DannicUI.SavedVariables.PlayerStaminaColor == nil) then
            DannicUI.SavedVariables.PlayerStaminaColor = { 0, 1, 0, 1 }
        end
        GetControl("PlayerStaminaFrameStatusBar"):SetColor(unpack(DannicUI.SavedVariables.PlayerStaminaColor))
end