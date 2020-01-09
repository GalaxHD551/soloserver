--[[slotequiped = GetPlayerEquippedWeaponSlot(playerid)
gun = GetPlayerWeapon(slotequiped)]]


AddEvent("OnKeyPress", function(key)
    if key == "X" and not onSpawn and not onCharacterCreation then
        CallRemoteEvent("DropGun")        
    end
end)
