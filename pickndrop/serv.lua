AddRemoteEvent("DropGun", function(playerid, pickupid)
    local slotequiped = GetPlayerEquippedWeaponSlot(playerid)
    gun, ammo = GetPlayerWeapon(playerid, slotequiped)
    --AddPlayerChat(playerid,"SLOT"..slotequiped)
    --AddPlayerChat(playerid,"gun"..gun)

        if gun ~= 1 then
            SetPlayerWeapon(playerid, 1, 0, true, slotequiped)
            SetPlayerAnimation(playerid, "CARRY_SHOULDER_SETDOWN")
            local x, y, z = GetPlayerLocation(playerid)

                if gun == 21 then

                    pickupid = CreatePickup(1408, x, y, z -80)
                    SetPickupPropertyValue(pickupid, "gundrop", gun, true)
                    SetPickupPropertyValue(pickupid, "ammodrop", ammo, true)
                    
                else    
                    local item = gun + 2
                    pickupid = CreatePickup(item, x, y, z -80)
                    SetPickupPropertyValue(pickupid, "gundrop", gun, true)
                    SetPickupPropertyValue(pickupid, "ammodrop", ammo, true)
   
                end

        else
            AddPlayerChat(playerid, "You have no weapon to drop !")
            
        end  
end)


function OnPlayerPickupHit(playerid, pickupid)
    local slotequiped = GetPlayerEquippedWeaponSlot(playerid)
    local Gun = GetPlayerWeapon(playerid, slotequiped)
        if Gun ~= 1 then
                AddPlayerChat(playerid, "Your slot is full, choose an empty !")
        else
            local gundrop = GetPickupPropertyValue(pickupid, "gundrop")
            local ammodrop = GetPickupPropertyValue(pickupid, "ammodrop")

            DestroyPickup(pickupid)
            GetPickupPropertyValue(pickupid, "gundrop")

            SetPlayerWeapon(playerid, gundrop, ammodrop, true, slotequiped, false)
            SetPlayerAnimation(playerid, "PICKUP_LOWER")
        end
end
AddEvent("OnPlayerPickupHit", OnPlayerPickupHit)




