local UtilityFunctions = require "UtilityFunctions"
local EmptyInventory = {}

function EmptyInventory.emptyInventory(blocksAway)

    if turtle.getItemCount(16) ~= 0 then
        print("Not enough inventory space\nEmptying Inventory....")
        UtilityFunctions.rotate()
        UtilityFunctions.moveForward(blocksAway)
        woodSlot =
            UtilityFunctions.getFirstItemSlotInTurtle("minecraft:%a+_log")
        saplingSlot = UtilityFunctions.getFirstItemSlotInTurtle(
                          "minecraft:%a+_sapling")
        turtle.select(woodSlot)
        turtle.transferTo(1, turtle.getItemCount())
        turtle.select(saplingSlot)
        turtle.transferTo(2, turtle.getItemCount())
        for i = 3, 16, 1 do
            turtle.select(i)
            turtle.drop()
        end

        UtilityFunctions.rotate()
        UtilityFunctions.moveForward(blocksAway)
        print("Succesfully Emptied inventory")
        return true

    else
        print("No need to empty inventory")
        return false
    end
end

function EmptyInventory.refillCrops(crop, chestDist)
    if turtle.getItemCount(1) < 10 then
        print("Refilling Crops...")
        UtilityFunctions.rotate()
        UtilityFunctions.moveForward(chestDist)
        if peripheral.isPresent("front") then
            if peripheral.getType("front") == "minecraft:chest" then
                local chest = peripheral.wrap("front")
                for i = 1, chest.size(), 1 do
                    if chest.getItemDetail(i) ~= nil then
                        if chest.getItemDetail(i).name == crop then
                            chest.pullItems("front", i, 64, 1)
                            print("Succesfully Restocked crops")
                            break
                        end
                    end
                end
            else
                print("No chest found!")
                return false
            end

            UtilityFunctions.rotate()
            UtilityFunctions.moveForward(chestDist)
        else
            print("No inventory found\nGoing to starting position")
            UtilityFunctions.rotate()
            UtilityFunctions.moveForward(chestDist)
            return false
        end
    else
        print("No need to refill crops.")
        return false
    end

end

return EmptyInventory
