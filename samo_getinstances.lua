local btn = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate")
btn:SetMovable(true)
btn:EnableMouse(true)
btn:RegisterForDrag("LeftButton")
btn:SetScript("OnDragStart", function(self) self:StartMoving() end)
btn:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)

local frame = CreateFrame("Frame", "DragFrame1", btn)
frame:SetPoint("TOPLEFT", btn, "BOTTOM", -60, 0) 
frame:SetMovable(false)
frame:EnableMouse(false)
frame:SetWidth(200)
frame:SetHeight(400)

local tex = frame:CreateTexture("ARTWORK")
tex:SetAllPoints()
tex:SetTexture(0.2, 0.8, 0.8)
tex:SetAlpha(0.5)

local frameText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
frameText:SetPoint("TOP", 0, 0)
frameText:SetJustifyH("LEFT")
frameText:SetWidth(180)


local name_c, _ = UnitName("player")


btn:SetPoint("Center", -420, 220)
btn:SetSize(100, 40)
btn:SetText("Click me")
btn:SetScript("OnClick", function(self, button, down)
    if down then
        local textOutput = "\n---\n" .. name_c .. "\n---\n"
        for i = 1, GetNumSavedInstances() do
            local name, id, reset, difficulty, locked, extended, instanceIDMostSig, isRaid, maxplayers, difficultyName = GetSavedInstanceInfo(i)
            if locked then
                textOutput = textOutput .. name .. " " .. difficultyName .. "\n"
            end
        end
        for h = 1, GetNumSavedWorldBosses() do
            local name, _, reset  = GetSavedWorldBossInfo(h)
            if reset>0 then
                textOutput = textOutput .. name .. " " ..  reset .. "\n"
            end
        end
        frameText:SetText(textOutput)
        frame:Show()
    else
        frame:Hide()
    end
end)
btn:RegisterForClicks("AnyDown", "AnyUp")
