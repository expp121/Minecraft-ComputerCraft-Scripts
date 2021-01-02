local UtilityFunctions = require "UtilityFunctions"
local treeCutter = require "TreeCutter"
local invManage = require "EmptyInventory"
local refueler = require "Refueler"
local planter = require "Planter"

print("Place the crop to be planted in slot 1, and the fuel in slot 2\nYou have 10 seconds")
os.sleep(10)

crop = turtle.getItemDetail(1).name
fuel = turtle.getItemDetail(2).name

print("Enter the radius for the patrolable area: ")
local patrolAreaRadius = read()
print("Please also enter the minimum fuel level to maintain: ")
local minFuelLevel = read()
print("Please enter how many block is the chest from the turtle:")
local chestBlock = read()
print("Please enter how many seconds to wait between patrols(higher will save fuel):")
local waitSeconds = read()

while true do
    refueler.refuel(minFuelLevel, fuel)
    treeCutter.cutTree()
    planter.plant(crop)
    for i = 1 ,patrolAreaRadius,1 do
        UtilityFunctions.breakLeft()
        UtilityFunctions.moveLeft(1)
        treeCutter.cutTree()
        planter.plant(crop)
    end

    UtilityFunctions.moveRight(patrolAreaRadius)

    for i = 1 ,patrolAreaRadius,1 do
        UtilityFunctions.breakRight()
        UtilityFunctions.moveRight(1)
        treeCutter.cutTree()
        planter.plant(crop)
    end
    UtilityFunctions.moveLeft(patrolAreaRadius)
    invManage.emptyInventory(chestBlock)
    invManage.refillCrops()
    os.sleep(waitSeconds)
end