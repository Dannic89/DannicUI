local LAM = LibAddonMenu2

DannicUI = DannicUI or {}

function DannicUI.InitSettings()
    local panelName = "DannicUISettings"

    local panelData = {
        type = "panel",
        name = DannicUI.name,
        displayName = DannicUI.name,
        version = DannicUI.version,
        author = "Dannic",
        slashCommand = "/DannicUI",
        registerForRefresh = true,
        registerForDefault = true,
    }

local optionsTable = {
        [1] = {
            type = "submenu",
            name = "Health",
            tooltip = "Health Einstellungen",
            controls = {
                [1] = {
                    type = "slider",
                    name = "Breite",
                    tooltip = "Setze die Breite des HealthBars fest",
                    min = 1,
                    max = 1024,
                    getFunc = function() return DannicUI.SavedVariables.PlayerHealthWidth end,
                    setFunc = function(value) DannicUI.SavedVariables.PlayerHealthWidth = value;
                        PlayerHealthFrame:SetDimensions(DannicUI.SavedVariables.PlayerHealthWidth, DannicUI.SavedVariables.PlayerHealthHeight)
                    end,
                    width = "half",
                    default = 390,
                },
                [2] = {
                    type = "slider",
                    name = "Höhe",
                    tooltip = "Setze die Höhe des HealthBars fest",
                    min = 1,
                    max = 1024,
                    getFunc = function() return DannicUI.SavedVariables.PlayerHealthHeight end,
                    setFunc = function(value) DannicUI.SavedVariables.PlayerHealthHeight = value;
                        PlayerHealthFrame:SetDimensions(DannicUI.SavedVariables.PlayerHealthWidth, DannicUI.SavedVariables.PlayerHealthHeight)
                    end,
                    width = "half",
                    default = 42,
                },
                [3] = {
                    type = "colorpicker",
                    name = "Farbe - Leben",
                    tooltip = "Setze die Farbe für die Ausdauer des Spielers",
                    getFunc = function() return unpack(DannicUI.SavedVariables.PlayerHealthColor) end,
                    setFunc = function(r,g,b,a) DannicUI.SavedVariables.PlayerHealthColor = {r,g,b,a}
                        PlayerHealthFrameStatusBar:SetColor(unpack(DannicUI.SavedVariables.PlayerHealthColor))
                    end,
                    width = "full",
                    default = {0.8235294223 ,0.2784313858 , 0.2235294133 ,1},
                },
                [4] = {
                    type = "slider",
                    name = "Position X",
                    tooltip = "Setzt die Position auf der X-Achse fest",
                    min = 0,
                    max = 2000,
                    getFunc = function() return DannicUI.SavedVariables.PlayerHealthPosX end,
                    setFunc = function(value) DannicUI.SavedVariables.PlayerHealthPosX = value;
                        GetControl("PlayerHealthFrame"):SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, DannicUI.SavedVariables.PlayerHealthPosX, DannicUI.SavedVariables.PlayerHealthPosY)
                    end,
                    width = "half",
                    default = 420,
                },
                [5] = {
                    type = "slider",
                    name = "Position Y",
                    tooltip = "Setzt die Position auf der Y-Achse fest",
                    min = 0,
                    max = 2000,
                    getFunc = function() return DannicUI.SavedVariables.PlayerHealthPosY end,
                    setFunc = function(value) DannicUI.SavedVariables.PlayerHealthPosY = value;
                        GetControl("PlayerHealthFrame"):SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, DannicUI.SavedVariables.PlayerHealthPosX, DannicUI.SavedVariables.PlayerHealthPosY)
                    end,
                    width = "half",
                    default = 1036,
                },
                [6] = {
                    type = "checkbox",
                    name = "ZO Healthbar",
                    tooltip = "Zenimax Healthbar Aktivieren",
                    getFunc = function() return DannicUI.SavedVariables.ZO_PlayerAttributeHealth end,
                    setFunc = function(value) DannicUI.SavedVariables.ZO_PlayerAttributeHealth = value;
                        ZO_PlayerAttributeHealth:SetHidden(not value)
                    end,
                    width = "full",
                },
                [7] = {
                    type = "button",
                    name = "Default",
                    func = function() 
                        DannicUI.SavedVariables.PlayerHealthWidth = "390"
                        DannicUI.SavedVariables.PlayerHealthHeight = "42"
                        DannicUI.SavedVariables.PlayerHealthColor = {0.8235294223 ,0.2784313858 , 0.2235294133 ,1}
                        DannicUI.SavedVariables.PlayerHealthPosX = "420"
                        DannicUI.SavedVariables.PlayerHealthPosY = "1036"

                        GetControl("PlayerHealthFrame"):SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, DannicUI.SavedVariables.PlayerHealthPosX, DannicUI.SavedVariables.PlayerHealthPosY)
                        PlayerHealthFrame:SetDimensions(DannicUI.SavedVariables.PlayerHealthWidth, DannicUI.SavedVariables.PlayerHealthHeight)
                        PlayerHealthFrameStatusBar:SetColor(unpack(DannicUI.SavedVariables.PlayerHealthColor))
                    end,
                }
            }
        },
        [2] = {
            type = "submenu",
            name = "Magicka",
            tooltip = "Magicka Einstellungen",
            controls = {
                [1] = {
                    type = "slider",
                    name = "Breite",
                    tooltip = "Setze die Breite des MagickaBars fest",
                    min = 1,
                    max = 1024,
                    getFunc = function() return DannicUI.SavedVariables.PlayerMagickaWidth end,
                    setFunc = function(value) DannicUI.SavedVariables.PlayerMagickaWidth = value;
                        PlayerMagickaFrame:SetDimensions(DannicUI.SavedVariables.PlayerMagickaWidth, DannicUI.SavedVariables.PlayerMagickaHeight)
                    end,
                    width = "half",
                    default = 312,
                },
                [2] = {
                    type = "slider",
                    name = "Höhe",
                    tooltip = "Setze die Höhe des MagickaBars fest",
                    min = 1,
                    max = 1024,
                    getFunc = function() return DannicUI.SavedVariables.PlayerMagickaHeight end,
                    setFunc = function(value) DannicUI.SavedVariables.PlayerMagickaHeight = value;
                        PlayerMagickaFrame:SetDimensions(DannicUI.SavedVariables.PlayerMagickaWidth, DannicUI.SavedVariables.PlayerMagickaHeight)
                    end,
                    width = "half",
                    default = 8,
                },
                [3] = {
                    type = "colorpicker",
                    name = "Farbe - Magicka",
                    tooltip = "Setze die Farbe für die Ausdauer des Spielers",
                    getFunc = function() return unpack(DannicUI.SavedVariables.PlayerMagickaColor) end,
                    setFunc = function(r,g,b,a) DannicUI.SavedVariables.PlayerMagickaColor = {r,g,b,a}
                        PlayerMagickaFrameStatusBar:SetColor(unpack(DannicUI.SavedVariables.PlayerMagickaColor))
                     end,
                    width = "full",
                    default = {0.2509804070 ,0.3215686381, 1, 1},
                },
                                [4] = {
                    type = "slider",
                    name = "Position X",
                    tooltip = "Setzt die Position auf der X-Achse fest",
                    min = 0,
                    max = 2000,
                    getFunc = function() return DannicUI.SavedVariables.PlayerMagickaPosX end,
                    setFunc = function(value) DannicUI.SavedVariables.PlayerMagickaPosX = value;
                        GetControl("PlayerMagickaFrame"):SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, DannicUI.SavedVariables.PlayerMagickaPosX, DannicUI.SavedVariables.PlayerMagickaPosY)
                    end,
                    width = "half",
                    default = -313,
                },
                [5] = {
                    type = "slider",
                    name = "Position Y",
                    tooltip = "Setzt die Position auf der Y-Achse fest",
                    min = 0,
                    max = 2000,
                    getFunc = function() return DannicUI.SavedVariables.PlayerMagickaPosY end,
                    setFunc = function(value) DannicUI.SavedVariables.PlayerMagickaPosY = value;
                        GetControl("PlayerMagickaFrame"):SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, DannicUI.SavedVariables.PlayerMagickaPosX, DannicUI.SavedVariables.PlayerMagickaPosY)
                    end,
                    width = "half",
                    default = 400,
                },
                [6] = {
                    type = "checkbox",
                    name = "ZO Magickabar",
                    tooltip = "Zenimax Healthbar Aktivieren",
                    getFunc = function() return DannicUI.SavedVariables.ZO_PlayerAttributeMagicka end,
                    setFunc = function(value) DannicUI.SavedVariables.ZO_PlayerAttributeMagicka = value;
                        ZO_PlayerAttributeMagicka:SetHidden(not value)
                    end,
                    width = "full",
                },
                [7] = {
                    type = "button",
                    name = "Default",
                    func = function() 
                        DannicUI.SavedVariables.PlayerMagickaWidth = "312"
                        DannicUI.SavedVariables.PlayerMagickaHeight = "8"
                        DannicUI.SavedVariables.PlayerMagickaColor = {0.2509804070 ,0.3215686381, 1, 1}
                        DannicUI.SavedVariables.PlayerMagickaPosX = "-313"
                        DannicUI.SavedVariables.PlayerMagickaPosY = "400"
                        GetControl("PlayerMagickaFrame"):SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, DannicUI.SavedVariables.PlayerMagickaPosX, DannicUI.SavedVariables.PlayerMagickaPosY)
                        PlayerMagickaFrame:SetDimensions(DannicUI.SavedVariables.PlayerMagickaWidth, DannicUI.SavedVariables.PlayerMagickaHeight)
                        PlayerMagickaFrameStatusBar:SetColor(unpack(DannicUI.SavedVariables.PlayerMagickaColor))
                    end,
                }
            }
        },
        [3] = {
            type = "submenu",
            name = "Stamina",
            tooltip = "Stamina Einstellungen",
            controls = {
                [1] = {
                    type = "slider",
                    name = "Breite",
                    tooltip = "Setze die Breite des StaminaBars fest",
                    min = 1,
                    max = 1024,
                    getFunc = function() return DannicUI.SavedVariables.PlayerStaminaWidth end,
                    setFunc = function(value) DannicUI.SavedVariables.PlayerStaminaWidth = value;
                        PlayerStaminaFrame:SetDimensions(DannicUI.SavedVariables.PlayerStaminaWidth, DannicUI.SavedVariables.PlayerStaminaHeight)
                    end,
                    width = "half",
                    default = 312,
                },
                [2] = {
                    type = "slider",
                    name = "Höhe",
                    tooltip = "Setze die Höhe des StaminaBars fest",
                    min = 1,
                    max = 1024,
                    getFunc = function() return DannicUI.SavedVariables.PlayerStaminaHeight end,
                    setFunc = function(value) DannicUI.SavedVariables.PlayerStaminaHeight = value;
                        PlayerStaminaFrame:SetDimensions(DannicUI.SavedVariables.PlayerStaminaWidth, DannicUI.SavedVariables.PlayerStaminaHeight)
                    end,
                    width = "half",
                    default = 8,
                },
                [3] = {
                    type = "colorpicker",
                    name = "Farbe - Ausdauer",
                    tooltip = "Setze die Farbe für die Ausdauer des Spielers",
                    getFunc = function() return unpack(DannicUI.SavedVariables.PlayerStaminaColor) end,
                    setFunc = function(r,g,b,a) DannicUI.SavedVariables.PlayerStaminaColor = {r,g,b,a}
                        PlayerStaminaFrameStatusBar:SetColor(unpack(DannicUI.SavedVariables.PlayerStaminaColor))
                     end,
                    width = "full",
                    default = {0.4784313738 ,0.8235294223, 0.3176470697, 1},
                },
                                [4] = {
                    type = "slider",
                    name = "Position X",
                    tooltip = "Setzt die Position auf der X-Achse fest",
                    min = 0,
                    max = 2000,
                    getFunc = function() return DannicUI.SavedVariables.PlayerStaminaPosX end,
                    setFunc = function(value) DannicUI.SavedVariables.PlayerStaminaPosX = value;
                        GetControl("PlayerStaminaFrame"):SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, DannicUI.SavedVariables.PlayerStaminaPosX, DannicUI.SavedVariables.PlayerStaminaPosY)
                    end,
                    width = "half",
                    default = 1,
                },
                [5] = {
                    type = "slider",
                    name = "Position Y",
                    tooltip = "Setzt die Position auf der Y-Achse fest",
                    min = 0,
                    max = 2000,
                    getFunc = function() return DannicUI.SavedVariables.PlayerStaminaPosY end,
                    setFunc = function(value) DannicUI.SavedVariables.PlayerStaminaPosY = value;
                        GetControl("PlayerStaminaFrame"):SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, DannicUI.SavedVariables.PlayerStaminaPosX, DannicUI.SavedVariables.PlayerStaminaPosY)
                    end,
                    width = "half",
                    default = 400,
                },
                [6] = {
                    type = "checkbox",
                    name = "ZO Staminabar",
                    tooltip = "Zenimax Healthbar Aktivieren",
                    getFunc = function() return DannicUI.SavedVariables.ZO_PlayerAttributeStamina end,
                    setFunc = function(value) DannicUI.SavedVariables.ZO_PlayerAttributeStamina = value;
                        ZO_PlayerAttributeStamina:SetHidden(not value)
                    end,
                    width = "full",
                },
                [7] = {
                    type = "button",
                    name = "Default",
                    func = function() 
                        DannicUI.SavedVariables.PlayerStaminaWidth = "311"
                        DannicUI.SavedVariables.PlayerStaminaHeight = "8"
                        DannicUI.SavedVariables.PlayerStaminaColor = {0.4784313738 ,0.8235294223, 0.3176470697, 1}
                        DannicUI.SavedVariables.PlayerStaminaPosX = "1"
                        DannicUI.SavedVariables.PlayerStaminaPosY = "400"
                        GetControl("PlayerStaminaFrame"):SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, DannicUI.SavedVariables.PlayerStaminaPosX, DannicUI.SavedVariables.PlayerStaminaPosY)
                        PlayerStaminaFrame:SetDimensions(DannicUI.SavedVariables.PlayerStaminaWidth, DannicUI.SavedVariables.PlayerStaminaHeight)
                        PlayerStaminaFrameStatusBar:SetColor(unpack(DannicUI.SavedVariables.PlayerStaminaColor))
                    end,
                }
            }
        }
    }

    LAM:RegisterAddonPanel(panelName, panelData)
    LAM:RegisterOptionControls(panelName, optionsTable)

end
