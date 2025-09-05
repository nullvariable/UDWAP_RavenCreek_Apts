require "StashDescriptions/StashUtil";

local configs = {
    [1] = {
        name = "Raven Creek Apartment Map",
        stamps = {
            {"Asterisk", nil, 4623, 15562, 0, 0, 0},
        },
        buildingX = 4623,
        buildingY = 15562,
    },
}


for i = 1, #configs do
    local config = configs[i]
    local DWAPStashMap = StashUtil.newStash("DWAP_RCA_StashMap" .. i, "Map", "Base.RosewoodMap", "Stash_AnnotedMap");
    for j = 1, #config.stamps do
        local stamp = config.stamps[j]
        if config.buildingX and config.buildingY then
            DWAPStashMap.buildingX = config.buildingX
            DWAPStashMap.buildingY = config.buildingY
        end
        DWAPStashMap:addStamp(stamp[1], stamp[2], stamp[3], stamp[4], stamp[5], stamp[6], stamp[7])
    end
    DWAPStashMap.customName = config.name
    Events.OnInitGlobalModData.Add(function()
        if getActivatedMods():contains("\\Ladders") and SandboxVars.DWAP_RavenCreek_Apts.EnableLadders then
            table.insert(DWAPStashMap.annotations, {
                symbol = "Ladder",
                text = nil,
                x = 4647,
                y = 15556,
                anchorX = 0.00,
                anchorY = 0.00,
                rotation = 0.0,
                r = 0.0,
                g = 0.0,
                b = 0.0,
            })
        end
    end)
end


