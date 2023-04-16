function DannicUI.Actionbar.ShowInactiveWeaponBar()
  for i = 1, ACTION_BAR_SIZE do
    local button = ZO_ActionBar_GetButton(i)
    if button and (button:GetParent():GetName() == "DannicUI.Actionbar.Primary" or button:GetParent():GetName() == "DannicUI.Actionbar.Secondary") then
      if button:GetParent():GetName() == "DannicUI.Actionbar.Secondary" and button:GetState() == BSTATE_DISABLED then
        button:SetAlpha(0.5)
      else
        button:SetAlpha(1)
      end
    end
  end
end


function DannicUI.Actionbar.ShowCooldowns()
  for i = 1, ACTION_BAR_SIZE do
    local button = ZO_ActionBar_GetButton(i)
    if button and button:GetParent():GetName() == "DannicUI.Actionbar" then
      local _, _, _, remainingTime, duration = GetSlotCooldownInfo(button:GetSlot())
      if remainingTime > 0 then
        button.cooldown:SetFillColor(1, 1, 1, 1)
        button.cooldown:SetTextureCoords(0, 1, 0, 1)
        button.cooldown:StartCooldown(remainingTime, duration, CD_TYPE_RADIAL, nil, NO_LEADING_EDGE)
      end
    end
  end
end
