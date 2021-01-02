local Refueler = {}
function Refueler.refuel(minimumFuelToMaintain, fuelToBurn)
    if turtle.getFuelLevel() < 100 then
        local turtleFuelLevel = turtle.getFuelLevel()
        local itemsToBurn = math.ceil(
                                (minimumFuelToMaintain - turtleFuelLevel) / 15)
        local itemInSelectedSlot = ""
        local numberOfItems = 0

        print("Refueling....\n")
        print("Current Fuel Level: " .. turtle.getFuelLevel())

        for i = 1, 16, 1 do
            turtle.select(i)
            itemInSelectedSlot = turtle.getItemDetail()

            if itemInSelectedSlot ~= nil then
                itemInSelectedSlot = turtle.getItemDetail().name

                if string.match(itemInSelectedSlot, fuelToBurn) ~= nil then
                    numberOfItems = turtle.getItemCount()
                    turtle.refuel(numberOfItems)
                    itemsToBurn = itemsToBurn - numberOfItems
                    print("Refueled with: " .. numberOfItems ..
                              " items\nI need to burn " .. itemsToBurn ..
                              " more")
                end
            end

            if itemsToBurn <= 0 then break end
        end

        if itemsToBurn <= 0 then
            print("Succesfully Refueled!")
            return true
        else
            print("Not enough items to refuel!")
            return false
        end
    end
end

return Refueler
