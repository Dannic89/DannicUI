function DannicUI.DefaultSavedVariables()
    DannicUI.SavedVariables = ZO_SavedVars:NewCharacterIdSettings("DannicUIVars", 1, nil, nil)
 
    -- Player Health Frame Start
        if (DannicUI.SavedVariables.PlayerHealthHeight == nil) then
            DannicUI.SavedVariables.PlayerHealthHeight = 42
        end
        if (DannicUI.SavedVariables.PlayerHealthWidth == nil) then
            DannicUI.SavedVariables.PlayerHealthWidth = 390
        end
        if (DannicUI.SavedVariables.PlayerHealthColor == nil) then
            DannicUI.SavedVariables.PlayerHealthColor = { 1, 0, 0, 1 }
        end

        if (DannicUI.SavedVariables.PlayerHealthPosX == nil) then
            DannicUI.SavedVariables.PlayerHealthPosX = 420
        end

        if (DannicUI.SavedVariables.PlayerHealthPosY == nil) then
            DannicUI.SavedVariables.PlayerHealthPosY = 1036
        end
    -- Player Health Frame End
    
    -- Player Magicka Frame Start
        if (DannicUI.SavedVariables.PlayerMagickaHeight == nil) then
            DannicUI.SavedVariables.PlayerMagickaHeight = 8
        end
        if (DannicUI.SavedVariables.PlayerMagickaWidth == nil) then
            DannicUI.SavedVariables.PlayerMagickaWidth = 311
        end
        if (DannicUI.SavedVariables.PlayerMagickaColor == nil) then
            DannicUI.SavedVariables.PlayerMagickaColor = { 0, 0, 1, 1 }
        end
    -- Player Magicka Frame End
    
    
    -- Player Stamina Frame Start
        if (DannicUI.SavedVariables.PlayerStaminaHeight == nil) then
            DannicUI.SavedVariables.PlayerStaminaHeight = 8
        end
        if (DannicUI.SavedVariables.PlayerStaminaWidth == nil) then
            DannicUI.SavedVariables.PlayerStaminaWidth = 311
        end
        if (DannicUI.SavedVariables.PlayerStaminaColor == nil) then
            DannicUI.SavedVariables.PlayerStaminaColor = { 0, 1, 0, 1 }
        end
end