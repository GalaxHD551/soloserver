AddEvent("OnKeyPress", function(key)
    if key == "X" and not onSpawn and not onCharacterCreation then
        CallRemoteEvent("DropGun")        
    end
end)

AddEvent("OnKeyPress", function(key)
    if key == "E" and not onSpawn and not onCharacterCreation then
        CallRemoteEvent("Pick")
    end
end)