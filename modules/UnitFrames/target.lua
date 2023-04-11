function DannicUI.OnTargetChanged(eventCode)
    -- Überprüfe, ob es ein Ziel gibt
    if DoesUnitExist("reticleover") then
      -- Hole den Namen des neuen Ziels
      local targetName, targetClass  = DannicUI.GetData("target")
      GetControl("TargetHealthFrame"):SetAlpha("1")
      GetControl("TargetHealthFrameLabel"):SetText(targetName)
    else
        GetControl("TargetHealthFrame"):SetAlpha("0")
    end
  end

  function DannicUI.SetTargetUnitFrame()
    local targetName, targetClass = DannicUI.GetData("target")
    if targetClass == nil then targetClass = "" end
    local texturePath = ("esoui/art/icons/class/gamepad/gp_class_" .. targetClass .. ".dds")

    GetControl("TargetHealthFrameIcon"):SetTexture(texturePath)
end

function DannicUI.UpdateTargetFrames()
    --DannicUI.GetData("target")
    DannicUI.SetTargetUnitFrame()
    local THC, THM = GetUnitPower("reticleover", POWERTYPE_HEALTH)

        GetControl("TargetHealthFrameStatusBar"):SetMinMax(0, THM)
        GetControl("TargetHealthFrameStatusBar"):SetValue(THC)
        local TargetHealthPercentes = math.ceil((THC / THM) * 100)
        local TargetHealthText = (THC .. " I " .. TargetHealthPercentes .. "%")
        GetControl("TargetHealthFrameHealth"):SetText(TargetHealthText)
end


EVENT_MANAGER:RegisterForEvent(DannicUI.name, EVENT_RETICLE_TARGET_CHANGED, DannicUI.OnTargetChanged)