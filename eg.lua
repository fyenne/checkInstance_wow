local frame = CreateFrame("FRAME"); -- Need a frame to respond to events
frame:RegisterEvent("ADDON_LOADED"); -- Fired when saved variables are loaded
frame:RegisterEvent("PLAYER_LOGOUT"); -- Fired when about to log out

function frame:OnEvent(event, arg1)
 if event == "ADDON_LOADED" and arg1 == "HaveWeMet" then
  -- Our saved variables are ready at this point. If there are none, both variables will set to nil.
  if HaveWeMetCount == nil then
   HaveWeMetCount = 0; -- This is the first time this addon is loaded; initialize the count to 0.
  end
  if HaveWeMetBool then
   print("Hello again, " .. UnitName("player") .. "!");
  else
   HaveWeMetCount = HaveWeMetCount + 1; -- It's a new character.
   print("Hi; what is your name?");
  end
 elseif event == "PLAYER_LOGOUT" then
   HaveWeMetBool = true; -- We've met; commit it to memory.
 end
end
frame:SetScript("OnEvent", frame.OnEvent);
SLASH_HAVEWEMET1 = "/hwm";
function SlashCmdList.HAVEWEMET(msg)
 print("HaveWeMet has met " .. HaveWeMetCount .. " characters.");
end