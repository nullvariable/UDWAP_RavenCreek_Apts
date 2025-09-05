local basements = {
    lot_basement_jamieton_bunker_01 = { width=4, height=14, stairx=2, stairy=9, stairDir="N" },
    dummy = { width=1, height=1, stairx=0, stairy=0, stairDir='N' },
}

local basement_access = {
    ba_dwap_generator = { width=1, height=1, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_jamieton_bunker_01 = { width=3, height=8, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_ravencreek_apts = { width=2, height=2, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_ravencreek_apts_solar = { width=2, height=4, stairx=0, stairy=1, stairDir="N" },
    ba_dwap_ravencreek_apts_tunnel = { width=21, height=4, stairx=0, stairy=2, stairDir="N" },
}

local doSolar = getActivatedMods():contains("\\ISA") and SandboxVars.DWAP.EnableGenSystemSolar
local doLadders = getActivatedMods():contains("\\Ladders") and SandboxVars.DWAP_RavenCreek_Apts.EnableLadders
local fullConfig = table.newarray()
fullConfig[1] = {
    locations = {
        {x=4628, y = 15556, z=0, stairDir="N", choices={"lot_basement_jamieton_bunker_01"}, access="ba_dwap_ravencreek_apts", },
        {x=4626, y = 15547, z = -1, stairDir="N", choices={"dummy"}, access="ba_dwap_jamieton_bunker_01"},
        {x=4618, y = 15558, z = -2, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"},
    },
}
if doSolar then
    fullConfig[1].locations[1].access = "ba_dwap_ravencreek_apts_solar"
end
if doLadders then
    table.insert(fullConfig[1].locations, {x=4627, y = 15561, z=-1, stairDir="N", choices={"dummy"}, access="ba_dwap_ravencreek_apts_tunnel", })
end

local locations = {}

for i = 1, #fullConfig do
    for j = 1, #fullConfig[i].locations do
        table.insert(locations, fullConfig[i].locations[j])
    end
end

local api = Basements.getAPIv1()
api:addAccessDefinitions('Raven Creek B42', basement_access)
api:addBasementDefinitions('Raven Creek B42', basements)
api:addSpawnLocations('Raven Creek B42', locations)

print("DWAP Raven Creek Apartments basements.lua loaded")
