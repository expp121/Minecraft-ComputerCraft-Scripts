local UtilityFunctions = require "UtilityFunctions"
local Planter = {}

function Planter.plant(seed)

    local block = ({turtle.inspect()})[2]

    if block.name == nil then
        cropSlot = UtilityFunctions.getFirstItemSlotInTurtle(seed)
        turtle.select(cropSlot)
        if turtle.place() then
            print("Planted crop!")
            return true
        else
            print("The crop wasn't planted")
            return false
        end
    end

end

return Planter
