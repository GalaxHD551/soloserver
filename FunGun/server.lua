function cmd_d(player)
    if GetPlayerPropertyValue(player, "Deletor") then
        SetPlayerPropertyValue(player, "Deletor", false, true)
        return AddPlayerChat(player, "Gun Deletor disabled")
    else
        SetPlayerPropertyValue(player, "Deletor", true, true)
        return AddPlayerChat(player, "Gun Deletor enabled")
	end
end
AddCommand("d", cmd_d)
AddCommand("deletor", cmd_d)

function cmd_e(player)
    if GetPlayerPropertyValue(player, "Explo") then
        SetPlayerPropertyValue(player, "Explo", false, true)
        return AddPlayerChat(player, "Explosive Gun disabled")
    else
        SetPlayerPropertyValue(player, "Explo", true, true)
        return AddPlayerChat(player, "Explosive Gun enabled")
	end
end
AddCommand("e", cmd_e)
AddCommand("explosive", cmd_e)

AddEvent("OnPlayerWeaponShot", function(player, weapon, hittype, hitid, hitX, hitY, hitZ)
    if GetPlayerPropertyValue(player, "Deletor") ~= nil and GetPlayerPropertyValue(player, "Deletor") then
        if hittype == 2 then                                          --Player
            if hitid ~= nil and IsValidPlayer(hitid) then
                SetPlayerHealth(hitid, 0)
            end
            
        elseif hittype == 3 then                                     --Vehicule
            if hitid ~= nil and IsValidVehicle(hitid) then
                DestroyVehicle(hitid)
            end

        elseif hittype == 4 then                                     --npc
            if hitid ~= nil and IsValidNPC(hitid) then
                DestroyNPC(hitid)
            end

        elseif hittype == 5 then                                     --object  
            if hitid ~= nil and IsValidObject(hitid) then
                DestroyObject(hitid)
            end

        elseif hittype == 8 then                                     --door
            if hitid ~= nil and IsValidDoor(hitid) then
                DestroyDoor(hitid)
            end
        end
    elseif GetPlayerPropertyValue(player, "Explo") ~= nil and GetPlayerPropertyValue(player, "Explo") then
        exploid = Random(1, 20)
        CreateExplosion(exploid, hitX, hitY, hitZ, 0, true, 1300, 800000.0, 1200.0)
    end
end)
    