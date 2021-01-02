local Utils = {}

function Utils.rotate()
    turtle.turnLeft()
    turtle.turnLeft()
end

function Utils.getFirstItemSlotInTurtle(item)
    for i = 1, 16, 1 do
        turtle.select(i)
        local itemInSelectedSlot = turtle.getItemDetail()

        if itemInSelectedSlot ~= nil then
            itemInSelectedSlot = turtle.getItemDetail().name

            if string.match(itemInSelectedSlot, item) ~= nil then
                return turtle.getSelectedSlot()
            end
        end
    end
    print("Item not Found!")
    return nil
end

function Utils.findFirstEmptySlot()
    for i = 1, 16, 1 do
        turtle.select(i)
        if turtle.getItemCount == 0 then return i end
        return nil
    end
end

function Utils.moveForward(blocks)
    for i = 1, blocks, 1 do
        if not (turtle.forward()) then return false, "Unable to move" end
    end
    return true
end

function Utils.moveBackward(blocks)
    for i = 1, blocks, 1 do
        if not (turtle.back()) then return false, "Unable to move" end
    end
    return true
end

function Utils.moveRight(blocks)
    turtle.turnRight()
    for i = 1, blocks, 1 do
        if not (turtle.forward()) then return false, "Unable to move" end
    end
    turtle.turnLeft()
    return true
end

function Utils.moveLeft(blocks)
    turtle.turnLeft()
    for i = 1, blocks, 1 do
        if not (turtle.forward()) then return false, "Unable to move" end
    end
    turtle.turnRight()
    return true
end

function Utils.moveUp(blocks)
    for i = 1, blocks, 1 do
        if not (turtle.up()) then return false, "Unable to move" end
    end
    return true
end

function Utils.moveDown(blocks)
    for i = 1, blocks, 1 do
        if not (turtle.down()) then return false, "Unable to move" end
    end
    return true
end

function Utils.breakRight()
    turtle.turnRight()
    if turtle.dig() then
        turtle.turnLeft()
        return true
    else
        turtle.turnLeft()
        return false
    end

end

function Utils.breakLeft()
    turtle.turnLeft()
    if turtle.dig() then
        turtle.turnRight()
        return true
    else
        turtle.turnRight()
        return false
    end

end

return Utils
