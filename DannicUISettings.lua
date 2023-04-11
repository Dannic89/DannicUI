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
                    default = 1036,
                },
                [6] = {
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
                    default = 311,
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
                },
                [4] = {
                    type = "button",
                    name = "Default",
                    func = function() 
                        DannicUI.SavedVariables.PlayerMagickaWidth = "311"
                        DannicUI.SavedVariables.PlayerMagickaHeight = "8"
                        DannicUI.SavedVariables.PlayerMagickaColor = {0.2509804070 ,0.3215686381, 1, 1}
                       
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
                    default = 311,
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
                },
                [4] = {
                    type = "button",
                    name = "Default",
                    func = function() 
                        DannicUI.SavedVariables.PlayerStaminaWidth = "311"
                        DannicUI.SavedVariables.PlayerStaminaHeight = "8"
                        DannicUI.SavedVariables.PlayerStaminaColor = {0.4784313738 ,0.8235294223, 0.3176470697, 1}
                       
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