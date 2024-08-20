-- local function SaveInstanceData()
--     if not MyInstanceTrackerDB then
--         MyInstanceTrackerDB = {}
--     end

--     local charName = UnitName("player") .. "-" .. GetRealmName()
--     MyInstanceTrackerDB[charName] = {}

--     for i = 1, GetNumSavedInstances() do
--         local name, id, reset, difficulty, locked, extended, instanceIDMostSig, isRaid, maxPlayers, difficultyName = GetSavedInstanceInfo(i)
--         if locked then
--             table.insert(MyInstanceTrackerDB[charName], {
--                 name = name,
--                 difficultyName = difficultyName,
--                 reset = reset,
--                 isRaid = isRaid,
--                 maxPlayers = maxPlayers,
--                 numEncounters = numEncounters,
--                 encounterProgress = encounterProgress,
--             })
--         end
--     end
-- end




-- local frame = CreateFrame("Frame")
-- frame:RegisterEvent("PLAYER_LOGOUT")
-- frame:SetScript("OnEvent", SaveInstanceData)
-- ----------------------------------- xx ----------------------------------- --

function DumpPets(t)
	t = t and wipe(t) or {}
	for i = 1, C_PetJournal.GetNumPets() do
		local charName = UnitName("player") .. "-" .. GetRealmName()
		local charName1 = UnitName("player") .. "-" .. GetRealmName()
		local charName2 = UnitName("player") .. "-" .. GetRealmName()
		tinsert(t, strjoin(";", charName, charName1,charName2))
	end
	print("pet dump complete")
	return t
end


-- ------------------------------------ x ----------------------------------- --

local btn = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate")
btn:EnableMouse(true)
btn:SetPoint("Center", 120, 20)
btn:SetSize(100, 40)
btn:SetText("returner")
btn:SetScript("OnClick", function(self, button, down)
    if down then
        print(MyInstanceTrackerDB)
    end
end)
btn:RegisterForClicks("AnyDown", "AnyUp")
