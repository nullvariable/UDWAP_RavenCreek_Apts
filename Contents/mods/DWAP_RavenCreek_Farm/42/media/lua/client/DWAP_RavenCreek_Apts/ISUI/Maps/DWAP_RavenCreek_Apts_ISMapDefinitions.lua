print("DWAP RCA StashDesc.lua loaded")
LootMaps.Init.DWAP_RCA_StashMap1 = function(mapUI)
    print("Initializing DWAP_RCA_StashMap1")
    local mapAPI = mapUI.javaObject:getAPIv1()
    MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
    MapUtils.initDefaultStyleV1(mapUI)
    mapAPI:setBoundsInSquares(4449, 15684, 4704, 15620)
end
