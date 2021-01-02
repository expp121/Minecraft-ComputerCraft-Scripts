local UtilityFunctions = require "UtilityFunctions"

local TreeCutter = {}
function TreeCutter.cutTree()

    local treeHeight = 0

    if ({turtle.inspect()})[2].name ~= nil then
        while string.match(({turtle.inspect()})[2].name,"minecraft:%a+_log")  do
            treeHeight = treeHeight + 1
            if turtle.dig() then
                turtle.digUp()
                turtle.up()
            else
                print("Unable to mine\nReseting to starting position")
                UtilityFunctions.moveDown(treeHeight)
                return false
            end
        end
        UtilityFunctions.moveDown(treeHeight)
        print("Succesfully cut tree.")
        return true
    else
        print("Nothing to cut")
        return false
    end
end

return TreeCutter

--   ({turtle.inspect()})[2].tags--["minecraft:logs"] = true, ["minecraft:logs_that_burn"] = true, ["minecraft:oak_logs"] = true--
-- ({turtle.inspect()})[2].name --"minecraft:oak_log"--
-- ({({({turtle.inspect()})[2].tags})[1]})[1]--
-- ({turtle.inspect()})[2].tags["minecraft:logs"]--

-- string.match(turtle.getItemDetail().name, "minecraft:%a+_log")--
-- turtle.getItemDetail().name--
