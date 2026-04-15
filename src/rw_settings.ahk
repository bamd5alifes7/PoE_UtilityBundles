SettingsFilePath(){
    return A_ScriptDir "\settings.ini"
}

EnsureSettingsFileEncoding(){
    settingsFile := SettingsFilePath()
    if !FileExist(settingsFile)
        return

    file := FileOpen(settingsFile, "r")
    if !file
        return

    firstByte := file.ReadUChar()
    secondByte := file.AtEOF ? -1 : file.ReadUChar()
    file.Close()

    if (firstByte = 0xFF && secondByte = 0xFE)
        return

    text := FileRead(settingsFile)
    FileDelete(settingsFile)
    FileAppend(text, settingsFile, "UTF-16")
}

ReadSettings(){
    global hotkeyQuickFlaskPrimary, hotkeyToggleQuickFlask, hotkeyAutoattack, hotkeyAutoTimeFlask
    global hotkeyQuickEnter0, hotkeyQuickEnter1, hotkeyQuickEnter2, hotkeyQuickEnter3, hotkeyQuickEnter4, hotkeyQuickEnter5, hotkeyQuickEnter7
    global hotkeyCheckMousePos, hotkeySaveCoordinates, hotkeyQuickBagmoving, hotkeyQuickTradeScanning
    global hotkeyQuickScouringAlchemy, hotkeyQuickJewellerFusing, hotkeyQuickFastGuard, hotkeyQuickFast2ndGuard, hotkeyQuickFast3rdGuard
    global hotkeyQuickmoving, hotkeyQuickChanceToUnique, hotkeyQuickOpenDeck, hotkeyQuickTradeCards
    global hotkeyActivateAutoDetonate, hotkeyAutoDetonateTrigger, hotkeyAnnouncement
    global hotkeySetAutoflask, hotkeyActivateAutoflask, hotkeyLootAll
    global quickFlasksHotkey0, quickFlasksHotkey1, quick_flask_list, quick_flask_list_1
    global AutoTime_flask_list, AutoTime_attack_list, keep_attack_list, AutoInterval
    global lootColor, loot_dalay
    global low_life_X, low_life_Y, life_color, low_life_flask_list
    global quickEnterText0, quickEnterText1, quickEnterText2, quickEnterText3
    global quickEnterText4, quickEnterText5, quickEnterText7
    global mine_laying_time, stashMoveDelayMin, stashMoveDelayMax
    global BagFirstX, BagFirstY, BagLastX, BagLastY
    global DeckX, DeckY, ChanceX, ChanceY, cardTradeX, cardTradeY
    global tradeFirstX, tradeFirstY, tradeLastX, tradeLastY
    global ScouringX, ScouringY, ItemX, ItemY, AlchemyX, AlchemyY
    global stash1To5TopLeftX, stash1To5TopLeftY, stash1To5BottomRightX, stash1To5BottomRightY
    global stash6To10TopLeftX, stash6To10TopLeftY, stash6To10BottomRightX, stash6To10BottomRightY
    global stash11To12TopLeftX, stash11To12TopLeftY, stash11To12BottomRightX, stash11To12BottomRightY
    global Announce
    EnsureSettingsFileEncoding()
    settingsFile := SettingsFilePath()

    hotkeyQuickFlaskPrimary := IniRead(settingsFile, "settings", "hotkeyQuickFlaskPrimary", "~XButton2")
    hotkeyToggleQuickFlask := IniRead(settingsFile, "settings", "hotkeyToggleQuickFlask", "~^l")
    hotkeyAutoattack := IniRead(settingsFile, "settings", "hotkeyAutoattack", "~XButton1")
    hotkeyAutoTimeFlask := IniRead(settingsFile, "settings", "hotkeyAutoTimeFlask", "~MButton")
    hotkeyQuickEnter0 := IniRead(settingsFile, "settings", "hotkeyQuickEnter0", "~F3")
    hotkeyQuickEnter1 := IniRead(settingsFile, "settings", "hotkeyQuickEnter1", "~^F3")
    hotkeyQuickEnter2 := IniRead(settingsFile, "settings", "hotkeyQuickEnter2", "~^F4")
    hotkeyQuickEnter3 := IniRead(settingsFile, "settings", "hotkeyQuickEnter3", "~F5")
    hotkeyQuickEnter4 := IniRead(settingsFile, "settings", "hotkeyQuickEnter4", "~F6")
    hotkeyQuickEnter5 := IniRead(settingsFile, "settings", "hotkeyQuickEnter5", "~^F6")
    hotkeyQuickEnter7 := IniRead(settingsFile, "settings", "hotkeyQuickEnter7", "~^``")
    hotkeyCheckMousePos := IniRead(settingsFile, "settings", "hotkeyCheckMousePos", "~+d")
    hotkeySaveCoordinates := IniRead(settingsFile, "settings", "hotkeySaveCoordinates", "~F7")
    hotkeyQuickBagmoving := IniRead(settingsFile, "settings", "hotkeyQuickBagmoving", "~F2")
    hotkeyQuickTradeScanning := IniRead(settingsFile, "settings", "hotkeyQuickTradeScanning", "~+F2")
    hotkeyQuickScouringAlchemy := IniRead(settingsFile, "settings", "hotkeyQuickScouringAlchemy", "~F4")
    hotkeyQuickJewellerFusing := IniRead(settingsFile, "settings", "hotkeyQuickJewellerFusing", "~F9")
    hotkeyQuickFastGuard := IniRead(settingsFile, "settings", "hotkeyQuickFastGuard", "~F10")
    hotkeyQuickFast2ndGuard := IniRead(settingsFile, "settings", "hotkeyQuickFast2ndGuard", "~^F10")
    hotkeyQuickFast3rdGuard := IniRead(settingsFile, "settings", "hotkeyQuickFast3rdGuard", "~+F10")
    hotkeyQuickmoving := IniRead(settingsFile, "settings", "hotkeyQuickmoving", "~F11")
    hotkeyQuickChanceToUnique := IniRead(settingsFile, "settings", "hotkeyQuickChanceToUnique", "~^F7")
    hotkeyQuickOpenDeck := IniRead(settingsFile, "settings", "hotkeyQuickOpenDeck", "^F8")
    hotkeyQuickTradeCards := IniRead(settingsFile, "settings", "hotkeyQuickTradeCards", "^+F8")
    hotkeyActivateAutoDetonate := IniRead(settingsFile, "settings", "hotkeyActivateAutoDetonate", "~^d")
    hotkeyAutoDetonateTrigger := IniRead(settingsFile, "settings", "hotkeyAutoDetonateTrigger", "~RButton")
    hotkeyAnnouncement := IniRead(settingsFile, "settings", "hotkeyAnnouncement", "~+v")
    hotkeySetAutoflask := IniRead(settingsFile, "settings", "hotkeySetAutoflask", "~^+F")
    hotkeyActivateAutoflask := IniRead(settingsFile, "settings", "hotkeyActivateAutoflask", "~^+l")
    hotkeyLootAll := IniRead(settingsFile, "settings", "hotkeyLootAll", "~^a")
    quickFlasksHotkey0 := IniRead(settingsFile, "settings", "quickFlasksHotkey0", "^2")
    quickFlasksHotkey1 := IniRead(settingsFile, "settings", "quickFlasksHotkey1", "^3")
    quick_flask_list := IniRead(settingsFile, "settings", "quick_flask_list", "1-2-3-4-5")
    quick_flask_list_1 := IniRead(settingsFile, "settings", "quick_flask_list_1", "3-w")
    AutoTime_flask_list := IniRead(settingsFile, "settings", "AutoTime_flask_list", "1")
    AutoTime_attack_list := IniRead(settingsFile, "settings", "AutoTime_attack_list", "w")
    keep_attack_list := IniRead(settingsFile, "settings", "keep_attack_list", "RButton")
    AutoInterval := IniRead(settingsFile, "settings", "AutoInterval", "4000")
    lootColor := IniRead(settingsFile, "settings", "lootColor", "0x790062")
    loot_dalay := IniRead(settingsFile, "settings", "loot_dalay", "400")
    low_life_X := IniRead(settingsFile, "settings", "low_life_X", "169")
    low_life_Y := IniRead(settingsFile, "settings", "low_life_Y", "923")
    life_color := IniRead(settingsFile, "settings", "life_color", "0x180B8F")
    low_life_flask_list := IniRead(settingsFile, "settings", "low_life_flask_list", "1")
    quickEnterText0 := IniRead(settingsFile, "settings", "quickEnterText0", "/global 168")
    quickEnterText1 := IniRead(settingsFile, "settings", "quickEnterText1", "/trade 615")
    quickEnterText2 := IniRead(settingsFile, "settings", "quickEnterText2", "/global 666 english")
    quickEnterText3 := IniRead(settingsFile, "settings", "quickEnterText3", "/hideout")
    quickEnterText4 := IniRead(settingsFile, "settings", "quickEnterText4", "/global 5587")
    quickEnterText5 := IniRead(settingsFile, "settings", "quickEnterText5", A_Space)
    quickEnterText7 := IniRead(settingsFile, "settings", "quickEnterText7", "/exit")
    mine_laying_time := IniRead(settingsFile, "settings", "mine_laying_time", "300")
    stashMoveDelayMin := IniRead(settingsFile, "settings", "stashMoveDelayMin", "10")
    stashMoveDelayMax := IniRead(settingsFile, "settings", "stashMoveDelayMax", "20")
    BagFirstX := IniRead(settingsFile, "settings", "BagFirstX", "1694")
    BagFirstY := IniRead(settingsFile, "settings", "BagFirstY", "781")
    BagLastX := IniRead(settingsFile, "settings", "BagLastX", "2539")
    BagLastY := IniRead(settingsFile, "settings", "BagLastY", "1137")
    DeckX := IniRead(settingsFile, "settings", "DeckX", "649")
    DeckY := IniRead(settingsFile, "settings", "DeckY", "537")
    ChanceX := IniRead(settingsFile, "settings", "ChanceX", "303")
    ChanceY := IniRead(settingsFile, "settings", "ChanceY", "370")
    cardTradeX := IniRead(settingsFile, "settings", "cardTradeX", "846")
    cardTradeY := IniRead(settingsFile, "settings", "cardTradeY", "617")
    tradeFirstX := IniRead(settingsFile, "settings", "tradeFirstX", "412")
    tradeFirstY := IniRead(settingsFile, "settings", "tradeFirstY", "269")
    tradeLastX := IniRead(settingsFile, "settings", "tradeLastX", "1261")
    tradeLastY := IniRead(settingsFile, "settings", "tradeLastY", "612")
    ScouringX := IniRead(settingsFile, "settings", "ScouringX", "583")
    ScouringY := IniRead(settingsFile, "settings", "ScouringY", "690")
    ItemX := IniRead(settingsFile, "settings", "ItemX", "441")
    ItemY := IniRead(settingsFile, "settings", "ItemY", "608")
    AlchemyX := IniRead(settingsFile, "settings", "AlchemyX", "663")
    AlchemyY := IniRead(settingsFile, "settings", "AlchemyY", "375")
    stash1To5TopLeftX := IniRead(settingsFile, "settings", "stash1To5TopLeftX", "23")
    stash1To5TopLeftY := IniRead(settingsFile, "settings", "stash1To5TopLeftY", "185")
    stash1To5BottomRightX := IniRead(settingsFile, "settings", "stash1To5BottomRightX", "373")
    stash1To5BottomRightY := IniRead(settingsFile, "settings", "stash1To5BottomRightY", "1022")
    stash6To10TopLeftX := IniRead(settingsFile, "settings", "stash6To10TopLeftX", "374")
    stash6To10TopLeftY := IniRead(settingsFile, "settings", "stash6To10TopLeftY", "178")
    stash6To10BottomRightX := IniRead(settingsFile, "settings", "stash6To10BottomRightX", "724")
    stash6To10BottomRightY := IniRead(settingsFile, "settings", "stash6To10BottomRightY", "1023")
    stash11To12TopLeftX := IniRead(settingsFile, "settings", "stash11To12TopLeftX", "725")
    stash11To12TopLeftY := IniRead(settingsFile, "settings", "stash11To12TopLeftY", "178")
    stash11To12BottomRightX := IniRead(settingsFile, "settings", "stash11To12BottomRightX", "864")
    stash11To12BottomRightY := IniRead(settingsFile, "settings", "stash11To12BottomRightY", "1023")
    Announce := IniRead(settingsFile, "settings", "Announce", "")
}

SaveSettings(){
    global hotkeyQuickFlaskPrimary, hotkeyToggleQuickFlask, hotkeyAutoattack, hotkeyAutoTimeFlask
    global hotkeyQuickEnter0, hotkeyQuickEnter1, hotkeyQuickEnter2, hotkeyQuickEnter3, hotkeyQuickEnter4, hotkeyQuickEnter5, hotkeyQuickEnter7
    global hotkeyCheckMousePos, hotkeySaveCoordinates, hotkeyQuickBagmoving, hotkeyQuickTradeScanning
    global hotkeyQuickScouringAlchemy, hotkeyQuickJewellerFusing, hotkeyQuickFastGuard, hotkeyQuickFast2ndGuard, hotkeyQuickFast3rdGuard
    global hotkeyQuickmoving, hotkeyQuickChanceToUnique, hotkeyQuickOpenDeck, hotkeyQuickTradeCards
    global hotkeyActivateAutoDetonate, hotkeyAutoDetonateTrigger, hotkeyAnnouncement
    global hotkeySetAutoflask, hotkeyActivateAutoflask, hotkeyLootAll
    global quickFlasksHotkey0, quickFlasksHotkey1, quick_flask_list, quick_flask_list_1
    global AutoTime_flask_list, AutoTime_attack_list, keep_attack_list, AutoInterval
    global lootColor, loot_dalay
    global low_life_X, low_life_Y, life_color, low_life_flask_list
    global quickEnterText0, quickEnterText1, quickEnterText2, quickEnterText3
    global quickEnterText4, quickEnterText5, quickEnterText7
    global mine_laying_time, stashMoveDelayMin, stashMoveDelayMax
    global BagFirstX, BagFirstY, BagLastX, BagLastY
    global DeckX, DeckY, ChanceX, ChanceY, cardTradeX, cardTradeY
    global tradeFirstX, tradeFirstY, tradeLastX, tradeLastY
    global ScouringX, ScouringY, ItemX, ItemY, AlchemyX, AlchemyY
    global stash1To5TopLeftX, stash1To5TopLeftY, stash1To5BottomRightX, stash1To5BottomRightY
    global stash6To10TopLeftX, stash6To10TopLeftY, stash6To10BottomRightX, stash6To10BottomRightY
    global stash11To12TopLeftX, stash11To12TopLeftY, stash11To12BottomRightX, stash11To12BottomRightY
    global Announce
    settingsFile := SettingsFilePath()

    IniWrite(hotkeyQuickFlaskPrimary, settingsFile, "settings", "hotkeyQuickFlaskPrimary")
    IniWrite(hotkeyToggleQuickFlask, settingsFile, "settings", "hotkeyToggleQuickFlask")
    IniWrite(hotkeyAutoattack, settingsFile, "settings", "hotkeyAutoattack")
    IniWrite(hotkeyAutoTimeFlask, settingsFile, "settings", "hotkeyAutoTimeFlask")
    IniWrite(hotkeyQuickEnter0, settingsFile, "settings", "hotkeyQuickEnter0")
    IniWrite(hotkeyQuickEnter1, settingsFile, "settings", "hotkeyQuickEnter1")
    IniWrite(hotkeyQuickEnter2, settingsFile, "settings", "hotkeyQuickEnter2")
    IniWrite(hotkeyQuickEnter3, settingsFile, "settings", "hotkeyQuickEnter3")
    IniWrite(hotkeyQuickEnter4, settingsFile, "settings", "hotkeyQuickEnter4")
    IniWrite(hotkeyQuickEnter5, settingsFile, "settings", "hotkeyQuickEnter5")
    IniWrite(hotkeyQuickEnter7, settingsFile, "settings", "hotkeyQuickEnter7")
    IniWrite(hotkeyCheckMousePos, settingsFile, "settings", "hotkeyCheckMousePos")
    IniWrite(hotkeySaveCoordinates, settingsFile, "settings", "hotkeySaveCoordinates")
    IniWrite(hotkeyQuickBagmoving, settingsFile, "settings", "hotkeyQuickBagmoving")
    IniWrite(hotkeyQuickTradeScanning, settingsFile, "settings", "hotkeyQuickTradeScanning")
    IniWrite(hotkeyQuickScouringAlchemy, settingsFile, "settings", "hotkeyQuickScouringAlchemy")
    IniWrite(hotkeyQuickJewellerFusing, settingsFile, "settings", "hotkeyQuickJewellerFusing")
    IniWrite(hotkeyQuickFastGuard, settingsFile, "settings", "hotkeyQuickFastGuard")
    IniWrite(hotkeyQuickFast2ndGuard, settingsFile, "settings", "hotkeyQuickFast2ndGuard")
    IniWrite(hotkeyQuickFast3rdGuard, settingsFile, "settings", "hotkeyQuickFast3rdGuard")
    IniWrite(hotkeyQuickmoving, settingsFile, "settings", "hotkeyQuickmoving")
    IniWrite(hotkeyQuickChanceToUnique, settingsFile, "settings", "hotkeyQuickChanceToUnique")
    IniWrite(hotkeyQuickOpenDeck, settingsFile, "settings", "hotkeyQuickOpenDeck")
    IniWrite(hotkeyQuickTradeCards, settingsFile, "settings", "hotkeyQuickTradeCards")
    IniWrite(hotkeyActivateAutoDetonate, settingsFile, "settings", "hotkeyActivateAutoDetonate")
    IniWrite(hotkeyAutoDetonateTrigger, settingsFile, "settings", "hotkeyAutoDetonateTrigger")
    IniWrite(hotkeyAnnouncement, settingsFile, "settings", "hotkeyAnnouncement")
    IniWrite(hotkeySetAutoflask, settingsFile, "settings", "hotkeySetAutoflask")
    IniWrite(hotkeyActivateAutoflask, settingsFile, "settings", "hotkeyActivateAutoflask")
    IniWrite(hotkeyLootAll, settingsFile, "settings", "hotkeyLootAll")
    IniWrite(quickFlasksHotkey0, settingsFile, "settings", "quickFlasksHotkey0")
    IniWrite(quickFlasksHotkey1, settingsFile, "settings", "quickFlasksHotkey1")
    IniWrite(quick_flask_list, settingsFile, "settings", "quick_flask_list")
    IniWrite(quick_flask_list_1, settingsFile, "settings", "quick_flask_list_1")
    IniWrite(AutoTime_flask_list, settingsFile, "settings", "AutoTime_flask_list")
    IniWrite(AutoTime_attack_list, settingsFile, "settings", "AutoTime_attack_list")
    IniWrite(keep_attack_list, settingsFile, "settings", "keep_attack_list")
    IniWrite(AutoInterval, settingsFile, "settings", "AutoInterval")
    IniWrite(lootColor, settingsFile, "settings", "lootColor")
    IniWrite(loot_dalay, settingsFile, "settings", "loot_dalay")
    IniWrite(low_life_X, settingsFile, "settings", "low_life_X")
    IniWrite(low_life_Y, settingsFile, "settings", "low_life_Y")
    IniWrite(life_color, settingsFile, "settings", "life_color")
    IniWrite(low_life_flask_list, settingsFile, "settings", "low_life_flask_list")
    IniWrite(quickEnterText0, settingsFile, "settings", "quickEnterText0")
    IniWrite(quickEnterText1, settingsFile, "settings", "quickEnterText1")
    IniWrite(quickEnterText2, settingsFile, "settings", "quickEnterText2")
    IniWrite(quickEnterText3, settingsFile, "settings", "quickEnterText3")
    IniWrite(quickEnterText4, settingsFile, "settings", "quickEnterText4")
    IniWrite(quickEnterText5, settingsFile, "settings", "quickEnterText5")
    IniWrite(quickEnterText7, settingsFile, "settings", "quickEnterText7")
    IniWrite(mine_laying_time, settingsFile, "settings", "mine_laying_time")
    IniWrite(stashMoveDelayMin, settingsFile, "settings", "stashMoveDelayMin")
    IniWrite(stashMoveDelayMax, settingsFile, "settings", "stashMoveDelayMax")
    IniWrite(BagFirstX, settingsFile, "settings", "BagFirstX")
    IniWrite(BagFirstY, settingsFile, "settings", "BagFirstY")
    IniWrite(BagLastX, settingsFile, "settings", "BagLastX")
    IniWrite(BagLastY, settingsFile, "settings", "BagLastY")
    IniWrite(DeckX, settingsFile, "settings", "DeckX")
    IniWrite(DeckY, settingsFile, "settings", "DeckY")
    IniWrite(ChanceX, settingsFile, "settings", "ChanceX")
    IniWrite(ChanceY, settingsFile, "settings", "ChanceY")
    IniWrite(cardTradeX, settingsFile, "settings", "cardTradeX")
    IniWrite(cardTradeY, settingsFile, "settings", "cardTradeY")
    IniWrite(tradeFirstX, settingsFile, "settings", "tradeFirstX")
    IniWrite(tradeFirstY, settingsFile, "settings", "tradeFirstY")
    IniWrite(tradeLastX, settingsFile, "settings", "tradeLastX")
    IniWrite(tradeLastY, settingsFile, "settings", "tradeLastY")
    IniWrite(ScouringX, settingsFile, "settings", "ScouringX")
    IniWrite(ScouringY, settingsFile, "settings", "ScouringY")
    IniWrite(ItemX, settingsFile, "settings", "ItemX")
    IniWrite(ItemY, settingsFile, "settings", "ItemY")
    IniWrite(AlchemyX, settingsFile, "settings", "AlchemyX")
    IniWrite(AlchemyY, settingsFile, "settings", "AlchemyY")
    IniWrite(stash1To5TopLeftX, settingsFile, "settings", "stash1To5TopLeftX")
    IniWrite(stash1To5TopLeftY, settingsFile, "settings", "stash1To5TopLeftY")
    IniWrite(stash1To5BottomRightX, settingsFile, "settings", "stash1To5BottomRightX")
    IniWrite(stash1To5BottomRightY, settingsFile, "settings", "stash1To5BottomRightY")
    IniWrite(stash6To10TopLeftX, settingsFile, "settings", "stash6To10TopLeftX")
    IniWrite(stash6To10TopLeftY, settingsFile, "settings", "stash6To10TopLeftY")
    IniWrite(stash6To10BottomRightX, settingsFile, "settings", "stash6To10BottomRightX")
    IniWrite(stash6To10BottomRightY, settingsFile, "settings", "stash6To10BottomRightY")
    IniWrite(stash11To12TopLeftX, settingsFile, "settings", "stash11To12TopLeftX")
    IniWrite(stash11To12TopLeftY, settingsFile, "settings", "stash11To12TopLeftY")
    IniWrite(stash11To12BottomRightX, settingsFile, "settings", "stash11To12BottomRightX")
    IniWrite(stash11To12BottomRightY, settingsFile, "settings", "stash11To12BottomRightY")
    IniWrite(Announce, settingsFile, "settings", "Announce")
    EnsureSettingsFileEncoding()
}
