SettingsFilePath(){
    return A_ScriptDir "\settings.ini"
}

ReadSettings(){
    global quickFlasksHotkey0, quickFlasksHotkey1, quick_flask_list, quick_flask_list_1
    global AutoTime_flask_list, AutoTime_attack_list, keep_attack_list, AutoInterval
    global lootColor, loot_dalay, portalX, portalY
    global low_life_X, low_life_Y, life_color, low_life_flask_list
    global quickEnterText0, quickEnterText1, quickEnterText2, quickEnterText3
    global quickEnterText4, quickEnterText5, quickEnterText6, quickEnterText7
    global mine_laying_time, url
    global BagFirstX, BagFirstY, BagLastX, BagLastY
    global tradeFirstX, tradeFirstY, tradeLastX, tradeLastY
    global ScouringX, ScouringY, ItemX, ItemY, AlchemyX, AlchemyY
    global TabFirstX, TabFirstY, TabLastX, TabLastY
    global Tab2ndFirstX, Tab2ndFirstY, Tab2ndLastX, Tab2ndLastY
    global Announce
    settingsFile := SettingsFilePath()

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
    portalX := IniRead(settingsFile, "settings", "portalX", "2500")
    portalY := IniRead(settingsFile, "settings", "portalY", "1100")
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
    quickEnterText6 := IniRead(settingsFile, "settings", "quickEnterText6", A_Space)
    quickEnterText7 := IniRead(settingsFile, "settings", "quickEnterText7", "/exit")
    mine_laying_time := IniRead(settingsFile, "settings", "mine_laying_time", "300")
    url := IniRead(settingsFile, "settings", "url", "https://www.pathofexile.com/trade/search/Settlers")
    BagFirstX := IniRead(settingsFile, "settings", "BagFirstX", "1694")
    BagFirstY := IniRead(settingsFile, "settings", "BagFirstY", "781")
    BagLastX := IniRead(settingsFile, "settings", "BagLastX", "2539")
    BagLastY := IniRead(settingsFile, "settings", "BagLastY", "1137")
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
    TabFirstX := IniRead(settingsFile, "settings", "TabFirstX", "23")
    TabFirstY := IniRead(settingsFile, "settings", "TabFirstY", "185")
    TabLastX := IniRead(settingsFile, "settings", "TabLastX", "373")
    TabLastY := IniRead(settingsFile, "settings", "TabLastY", "1022")
    Tab2ndFirstX := IniRead(settingsFile, "settings", "Tab2ndFirstX", "374")
    Tab2ndFirstY := IniRead(settingsFile, "settings", "Tab2ndFirstY", "178")
    Tab2ndLastX := IniRead(settingsFile, "settings", "Tab2ndLastX", "724")
    Tab2ndLastY := IniRead(settingsFile, "settings", "Tab2ndLastY", "1023")
    Announce := IniRead(settingsFile, "settings", "Announce", "")
}

SaveSettings(){
    global quickFlasksHotkey0, quickFlasksHotkey1, quick_flask_list, quick_flask_list_1
    global AutoTime_flask_list, AutoTime_attack_list, keep_attack_list, AutoInterval
    global lootColor, loot_dalay, portalX, portalY
    global low_life_X, low_life_Y, life_color, low_life_flask_list
    global quickEnterText0, quickEnterText1, quickEnterText2, quickEnterText3
    global quickEnterText4, quickEnterText5, quickEnterText6, quickEnterText7
    global mine_laying_time, url
    global BagFirstX, BagFirstY, BagLastX, BagLastY
    global tradeFirstX, tradeFirstY, tradeLastX, tradeLastY
    global ScouringX, ScouringY, ItemX, ItemY, AlchemyX, AlchemyY
    global TabFirstX, TabFirstY, TabLastX, TabLastY
    global Tab2ndFirstX, Tab2ndFirstY, Tab2ndLastX, Tab2ndLastY
    global Announce
    settingsFile := SettingsFilePath()

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
    IniWrite(portalX, settingsFile, "settings", "portalX")
    IniWrite(portalY, settingsFile, "settings", "portalY")
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
    IniWrite(quickEnterText6, settingsFile, "settings", "quickEnterText6")
    IniWrite(quickEnterText7, settingsFile, "settings", "quickEnterText7")
    IniWrite(mine_laying_time, settingsFile, "settings", "mine_laying_time")
    IniWrite(url, settingsFile, "settings", "url")
    IniWrite(BagFirstX, settingsFile, "settings", "BagFirstX")
    IniWrite(BagFirstY, settingsFile, "settings", "BagFirstY")
    IniWrite(BagLastX, settingsFile, "settings", "BagLastX")
    IniWrite(BagLastY, settingsFile, "settings", "BagLastY")
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
    IniWrite(TabFirstX, settingsFile, "settings", "TabFirstX")
    IniWrite(TabFirstY, settingsFile, "settings", "TabFirstY")
    IniWrite(TabLastX, settingsFile, "settings", "TabLastX")
    IniWrite(TabLastY, settingsFile, "settings", "TabLastY")
    IniWrite(Tab2ndFirstX, settingsFile, "settings", "Tab2ndFirstX")
    IniWrite(Tab2ndFirstY, settingsFile, "settings", "Tab2ndFirstY")
    IniWrite(Tab2ndLastX, settingsFile, "settings", "Tab2ndLastX")
    IniWrite(Tab2ndLastY, settingsFile, "settings", "Tab2ndLastY")
    IniWrite(Announce, settingsFile, "settings", "Announce")
}
