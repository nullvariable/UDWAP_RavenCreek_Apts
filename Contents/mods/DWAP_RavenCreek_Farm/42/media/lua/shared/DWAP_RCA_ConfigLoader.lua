local DWAPUtils = require "DWAPUtils"
Events.OnLoadRadioScripts.Add(function()
    local config = {
        minimumVersion = 17,
        file = "DWAP_RavenCreek_Apts/configs/RCA",
        overrides = {
            makePrimary = SandboxVars.DWAP_RavenCreek_Apts.MakePrimary,
            keyAndMap = SandboxVars.DWAP_RavenCreek_Apts.KeyAndMap,
            essentialLoot = SandboxVars.DWAP_RavenCreek_Apts.EssentialLoot,
            regularLoot = SandboxVars.DWAP_RavenCreek_Apts.RegularLoot,
        },
    }
    if SandboxVars.DWAP_RavenCreek_Apts.ExtraLoot then
        config.file = "DWAP_RavenCreek_Apts/configs/RCA_ExtraLoot"
    end
    DWAPUtils.dprint("Loading DWAP_RavenCreek_Apts config")
    DWAPUtils.dprint(config)
    DWAPUtils.addExternalConfig(config)
end)


function DWAP_RCA_AfterSpawn()
    local result = DWAPUtils.lightsOnCurrentRoom(nil, -120)
    if not result then
        DWAPUtils.DeferMinute(function()
            DWAPUtils.lightsOnCurrentRoom()
        end)
    end
end
Events.OnNewGame.Add(function(player)
    local spawnRegion = MapSpawnSelect.instance.selectedRegion
    if not spawnRegion then
        spawnRegion = MapSpawnSelect.instance:useDefaultSpawnRegion()
    end

    local modData = player:getModData()
    if not modData.DWAP_RCA_Spawn then
        if spawnRegion.name == "DWAP_RavenCreek_Apts" then
            DWAP_RCA_AfterSpawn()
        end
        modData.DWAP_RCA_Spawn = true
    end
end)
