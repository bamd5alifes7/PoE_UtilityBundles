RunGUI(){
    global mainGui, quick_flask_list, quick_flask_list_1, quickFlasksHotkey0, quickFlasksHotkey1
    global AutoTime_attack_list, AutoTime_flask_list, keep_attack_list, AutoInterval
    global quickEnterText0, quickEnterText1, quickEnterText2, quickEnterText3, quickEnterText4, quickEnterText5, quickEnterText7
    global BagFirstX, BagFirstY, BagLastX, BagLastY, tradeFirstX, tradeFirstY, tradeLastX, tradeLastY
    global ScouringX, ScouringY, ItemX, ItemY, AlchemyX, AlchemyY
    global TabFirstX, TabFirstY, TabLastX, TabLastY, Tab2ndFirstX, Tab2ndFirstY, Tab2ndLastX, Tab2ndLastY
    global mine_laying_time, Announce, low_life_flask_list, lootColor, loot_dalay

    mainGui := Gui("+Resize +MinSize920x860", "POE_Utilitybundles")
    mainGui.MarginX := 20
    mainGui.MarginY := 16
    mainGui.SetFont("s9", "Segoe UI")
    mainGui.Add("Edit", "x0 y0 w0 h0 Hidden")

    mainGui.SetFont("w700 c2B579A")
    githubText := mainGui.Add("Text", "x20 y16 w780 h20 BackgroundTrans", "Go to GitHub")
    githubText.OnEvent("Click", GoToWebsite)

    mainGui.SetFont("norm cDefault")
    mainGui.Add("Text", "x28 y+10 w760 h36", "F12: stop running loops. Coordinates assume 2560x1080 unless you change values (Shift+D). Path of Exile only (script hotkeys).")

    mainGui.SetFont("s9", "Segoe UI")
    tabCtrl := mainGui.Add("Tab3", "xs y+14 w804 h700", ["Flask / Timer", "Quick Enter", "Coords", "Stash / Tools", "More"])

    tabCtrl.UseTab(1)
    mainGui.Add("GroupBox", "x16 y120 w780 h228", "QuickFlask")
    mainGui.SetFont("bold")
    mainGui.Add("Text", "x32 y146 w360 h18", "XButton2 / mouse front side")
    mainGui.SetFont("norm")
    mainGui.Add("Text", "x32 y170 w200 h18", "Flask list (use - between keys)")
    mainGui.Add("Edit", "x240 y166 w220 h22 vquick_flask_list", quick_flask_list)
    mainGui.SetFont("bold")
    mainGui.Add("Text", "x32 y204 w120 h18", "Ctrl + L")
    mainGui.SetFont("norm")
    mainGui.Add("Text", "x160 y204 w560 h32", "Toggle: remap configured keys to quick-flask list when on.")
    mainGui.SetFont("italic")
    mainGui.Add("Text", "x32 y240 w720 h18", "Extra hotkeys (deprecated UI, still works)")
    mainGui.SetFont("norm")
    mainGui.Add("Hotkey", "x32 y264 w72 h22 vquickFlasksHotkey0", quickFlasksHotkey0)
    mainGui.Add("Text", "x112 y268 w240 h18", "list 1 (same as XButton2)")
    mainGui.Add("Hotkey", "x32 y294 w72 h22 vquickFlasksHotkey1", quickFlasksHotkey1)
    mainGui.Add("Text", "x112 y298 w120 h18", "list 2")
    mainGui.Add("Edit", "x220 y292 w240 h22 vquick_flask_list_1", quick_flask_list_1)

    mainGui.Add("GroupBox", "x16 y356 w780 h320", "AutoTime")
    mainGui.SetFont("bold")
    mainGui.Add("Text", "x32 y382 w320 h18", "XButton1 / mouse back side")
    mainGui.SetFont("norm")
    mainGui.Add("Text", "x32 y406 w200 h18", "Attack sequence (timer)")
    mainGui.Add("Edit", "x240 y402 w220 h22 vAutoTime_attack_list", AutoTime_attack_list)
    mainGui.Add("Text", "x32 y436 w740 h32", "MButton: holds keep_attack_list, then cycles flask + attack keys. Use instant-cast skills only.")
    mainGui.Add("Text", "x48 y474 w140 h18", "keep_attack_list")
    mainGui.Add("Edit", "x200 y470 w260 h22 vkeep_attack_list", keep_attack_list)
    mainGui.Add("Text", "x48 y504 w140 h18", "AutoTime_flask_list")
    mainGui.Add("Edit", "x200 y500 w260 h22 vAutoTime_flask_list", AutoTime_flask_list)
    mainGui.Add("Text", "x48 y534 w160 h18", "AutoTime_attack_list")
    mainGui.Add("Text", "x200 y534 w360 h18", "(same field as XButton1 above)")
    mainGui.Add("Text", "x48 y560 w140 h18", "AutoInterval (ms)")
    mainGui.Add("Edit", "x200 y556 w80 h22 vAutoInterval", AutoInterval)
    mainGui.SetFont("bold c800000")
    mainGui.Add("Text", "x32 y592 w740 h36", "Non-instant skills may not finish before next step.")
    mainGui.SetFont("norm cDefault")

    tabCtrl.UseTab(2)
    mainGui.Add("GroupBox", "x16 y120 w780 h540", "Quick Enter (chat)")
    mainGui.SetFont("bold")
    mainGui.Add("Text", "x36 y148 w120 h18", "F3")
    mainGui.Add("Text", "x36 y180 w120 h18", "Ctrl+F3")
    mainGui.Add("Text", "x36 y212 w120 h18", "Ctrl+F4")
    mainGui.Add("Text", "x36 y244 w120 h18", "F5")
    mainGui.Add("Text", "x36 y276 w120 h18", "F6")
    mainGui.Add("Text", "x36 y308 w120 h18", "Ctrl+F6")
    mainGui.Add("Text", "x36 y340 w120 h18", "Ctrl+~")
    mainGui.SetFont("norm")
    mainGui.Add("Edit", "x160 y142 w580 h24 vquickEnterText0", quickEnterText0)
    mainGui.Add("Edit", "x160 y174 w580 h24 vquickEnterText1", quickEnterText1)
    mainGui.Add("Edit", "x160 y206 w580 h24 vquickEnterText2", quickEnterText2)
    mainGui.Add("Edit", "x160 y238 w580 h24 vquickEnterText3", quickEnterText3)
    mainGui.Add("Edit", "x160 y270 w580 h24 vquickEnterText4", quickEnterText4)
    mainGui.Add("Edit", "x160 y302 w580 h24 vquickEnterText5", quickEnterText5)
    mainGui.Add("Edit", "x160 y334 w580 h24 vquickEnterText7", quickEnterText7)
    mainGui.Add("Text", "x36 y376 w700 h22", "Slot quickEnterText6 exists in INI but has no hotkey in script.")

    tabCtrl.UseTab(3)
    mainGui.Add("GroupBox", "x16 y120 w780 h56", "Probe")
    mainGui.Add("Text", "x28 y134 w740 h20", "Shift+D: read pixel color + position at cursor (for this .ini).")
    mainGui.Add("GroupBox", "x16 y186 w780 h132", "F2 - bag corners (TL / BR)")
    mainGui.Add("Text", "x40 y210 w72 h18", "BagFirstX")
    mainGui.Add("Edit", "x116 y206 w100 h22 vBagFirstX", BagFirstX)
    mainGui.Add("Text", "x232 y210 w72 h18", "BagFirstY")
    mainGui.Add("Edit", "x308 y206 w100 h22 vBagFirstY", BagFirstY)
    mainGui.Add("Text", "x40 y238 w72 h18", "BagLastX")
    mainGui.Add("Edit", "x116 y234 w100 h22 vBagLastX", BagLastX)
    mainGui.Add("Text", "x232 y238 w72 h18", "BagLastY")
    mainGui.Add("Edit", "x308 y234 w100 h22 vBagLastY", BagLastY)
    mainGui.Add("GroupBox", "x16 y324 w780 h120", "Shift+F2 - trade window corners")
    mainGui.Add("Text", "x40 y360 w90 h18", "tradeFirstX")
    mainGui.Add("Edit", "x134 y356 w100 h22 vtradeFirstX", tradeFirstX)
    mainGui.Add("Text", "x252 y360 w90 h18", "tradeFirstY")
    mainGui.Add("Edit", "x346 y356 w100 h22 vtradeFirstY", tradeFirstY)
    mainGui.Add("Text", "x40 y392 w90 h18", "tradeLastX")
    mainGui.Add("Edit", "x134 y388 w100 h22 vtradeLastX", tradeLastX)
    mainGui.Add("Text", "x252 y392 w90 h18", "tradeLastY")
    mainGui.Add("Edit", "x346 y388 w100 h22 vtradeLastY", tradeLastY)
    mainGui.Add("GroupBox", "x16 y442 w780 h240", "F4 - Scouring / Alchemy / item")
    mainGui.Add("Text", "x40 y470 w80 h18", "ScouringX")
    mainGui.Add("Edit", "x124 y466 w90 h22 vScouringX", ScouringX)
    mainGui.Add("Text", "x230 y462 w80 h18", "ScouringY")
    mainGui.Add("Edit", "x314 y458 w90 h22 vScouringY", ScouringY)
    mainGui.Add("Text", "x40 y498 w80 h18", "AlchemyX")
    mainGui.Add("Edit", "x124 y494 w90 h22 vAlchemyX", AlchemyX)
    mainGui.Add("Text", "x230 y498 w80 h18", "AlchemyY")
    mainGui.Add("Edit", "x314 y494 w90 h22 vAlchemyY", AlchemyY)
    mainGui.Add("Text", "x40 y526 w80 h18", "ItemX")
    mainGui.Add("Edit", "x124 y522 w90 h22 vItemX", ItemX)
    mainGui.Add("Text", "x230 y526 w80 h18", "ItemY")
    mainGui.Add("Edit", "x314 y522 w90 h22 vItemY", ItemY)

    tabCtrl.UseTab(4)
    mainGui.Add("GroupBox", "x16 y120 w780 h220", "F10 / Ctrl+F10 - stash tab corners")
    mainGui.Add("Text", "x32 y138 w740 h18", "Tab 1-5 columns (first & last corner)")
    mainGui.Add("Text", "x48 y166 w80 h18", "TabFirstX")
    mainGui.Add("Edit", "x132 y162 w90 h22 vTabFirstX", TabFirstX)
    mainGui.Add("Text", "x240 y166 w80 h18", "TabFirstY")
    mainGui.Add("Edit", "x324 y162 w90 h22 vTabFirstY", TabFirstY)
    mainGui.Add("Text", "x48 y198 w80 h18", "TabLastX")
    mainGui.Add("Edit", "x132 y194 w90 h22 vTabLastX", TabLastX)
    mainGui.Add("Text", "x240 y198 w80 h18", "TabLastY")
    mainGui.Add("Edit", "x324 y194 w90 h22 vTabLastY", TabLastY)
    mainGui.Add("Text", "x32 y238 w740 h18", "Tab 6-10 columns")
    mainGui.Add("Text", "x48 y266 w90 h18", "Tab2ndFirstX")
    mainGui.Add("Edit", "x144 y262 w90 h22 vTab2ndFirstX", Tab2ndFirstX)
    mainGui.Add("Text", "x260 y266 w90 h18", "Tab2ndFirstY")
    mainGui.Add("Edit", "x356 y262 w90 h22 vTab2ndFirstY", Tab2ndFirstY)
    mainGui.Add("Text", "x48 y298 w90 h18", "Tab2ndLastX")
    mainGui.Add("Edit", "x144 y294 w90 h22 vTab2ndLastX", Tab2ndLastX)
    mainGui.Add("Text", "x260 y298 w90 h18", "Tab2ndLastY")
    mainGui.Add("Edit", "x356 y294 w90 h22 vTab2ndLastY", Tab2ndLastY)
    mainGui.Add("GroupBox", "x16 y356 w780 h160", "F9 / F11 / mines")
    mainGui.Add("Text", "x32 y372 w360 h18", "F9: spam click at cursor (currency on cursor)")
    mainGui.Add("Text", "x32 y394 w360 h18", "F11: hold Ctrl and click to move along path")
    mainGui.Add("Text", "x32 y416 w740 h40", "Ctrl+D + RButton: auto detonate. mine_laying_time (ms):")
    mainGui.Add("Edit", "x620 y420 w80 h22 vmine_laying_time", mine_laying_time)

    tabCtrl.UseTab(5)
    mainGui.Add("GroupBox", "x16 y120 w780 h210", "More: deprecated / Shift+V broadcast")
    mainGui.Add("Text", "x32 y146 w720 h18", "Deprecated / rare use")
    mainGui.Add("Text", "x32 y170 w720 h58", "Shift+V multi-channel (IME: caps English).`nCtrl+PageUp trade site (legacy).")
    mainGui.Add("Text", "x32 y236 w720 h20", "Broadcast text:")
    mainGui.SetFont("s9", "Segoe UI")
    mainGui.Add("Edit", "x32 y260 w740 h54 vAnnounce", Announce)
    mainGui.Add("GroupBox", "x16 y338 w780 h118", "AutoFlask (color / light sensitive)")
    mainGui.Add("Text", "x32 y362 w720 h36", "Ctrl+Shift+F / Ctrl+Shift+L. Low-life flask list:")
    mainGui.Add("Edit", "x32 y400 w200 h22 vlow_life_flask_list", low_life_flask_list)
    mainGui.Add("GroupBox", "x16 y466 w780 h132", "Loot (Ctrl+A hold)")
    mainGui.Add("Text", "x32 y490 w200 h18", "lootColor")
    mainGui.Add("Edit", "x240 y486 w140 h22 vlootColor", lootColor)
    mainGui.Add("Text", "x32 y518 w200 h18", "delay (ms)")
    mainGui.Add("Edit", "x240 y514 w80 h22 vloot_dalay", loot_dalay)
    mainGui.Add("Text", "x32 y544 w740 h36", "Pickup uses pixel color; speed limited.")

    tabCtrl.UseTab()
    mainGui.SetFont("bold cRed")
    mainGui.Add("Text", "x14 y808 w820 h22", "Apply change saves settings.ini | Closing the window saves and exits.")
    mainGui.SetFont("norm")
    btnApply := mainGui.Add("Button", "x688 y836 w150 h34 Default", "Apply change")
    btnApply.OnEvent("Click", ButtonApplyChange)

    mainGui.OnEvent("Close", GuiClose)
    mainGui.Show("w860 h880 Center")
}

GuiClose(*){
    SaveSettings()
    ExitApp()
}

GoToWebsite(*){
    Run("https://github.com/bamd5alifes7/POE_Utilitybundles")
}

ButtonApplyChange(*){
    global mainGui
    TurnOffAllHotkey()
    ApplyGuiValues(mainGui.Submit(false))
    SaveSettings()
    TurnOnAllHotkey()
    MsgBox("Change applied", , "T1")
}

ApplyGuiValues(values){
    global quick_flask_list, quick_flask_list_1, quickFlasksHotkey0, quickFlasksHotkey1
    global AutoTime_attack_list, AutoTime_flask_list, keep_attack_list, AutoInterval
    global quickEnterText0, quickEnterText1, quickEnterText2, quickEnterText3, quickEnterText4, quickEnterText5, quickEnterText7
    global BagFirstX, BagFirstY, BagLastX, BagLastY, tradeFirstX, tradeFirstY, tradeLastX, tradeLastY
    global ScouringX, ScouringY, ItemX, ItemY, AlchemyX, AlchemyY
    global TabFirstX, TabFirstY, TabLastX, TabLastY, Tab2ndFirstX, Tab2ndFirstY, Tab2ndLastX, Tab2ndLastY
    global mine_laying_time, Announce, low_life_flask_list, lootColor, loot_dalay

    quick_flask_list := values.quick_flask_list
    quick_flask_list_1 := values.quick_flask_list_1
    quickFlasksHotkey0 := values.quickFlasksHotkey0
    quickFlasksHotkey1 := values.quickFlasksHotkey1
    AutoTime_attack_list := values.AutoTime_attack_list
    AutoTime_flask_list := values.AutoTime_flask_list
    keep_attack_list := values.keep_attack_list
    AutoInterval := values.AutoInterval
    quickEnterText0 := values.quickEnterText0
    quickEnterText1 := values.quickEnterText1
    quickEnterText2 := values.quickEnterText2
    quickEnterText3 := values.quickEnterText3
    quickEnterText4 := values.quickEnterText4
    quickEnterText5 := values.quickEnterText5
    quickEnterText7 := values.quickEnterText7
    BagFirstX := values.BagFirstX
    BagFirstY := values.BagFirstY
    BagLastX := values.BagLastX
    BagLastY := values.BagLastY
    tradeFirstX := values.tradeFirstX
    tradeFirstY := values.tradeFirstY
    tradeLastX := values.tradeLastX
    tradeLastY := values.tradeLastY
    ScouringX := values.ScouringX
    ScouringY := values.ScouringY
    ItemX := values.ItemX
    ItemY := values.ItemY
    AlchemyX := values.AlchemyX
    AlchemyY := values.AlchemyY
    TabFirstX := values.TabFirstX
    TabFirstY := values.TabFirstY
    TabLastX := values.TabLastX
    TabLastY := values.TabLastY
    Tab2ndFirstX := values.Tab2ndFirstX
    Tab2ndFirstY := values.Tab2ndFirstY
    Tab2ndLastX := values.Tab2ndLastX
    Tab2ndLastY := values.Tab2ndLastY
    mine_laying_time := values.mine_laying_time
    Announce := values.Announce
    low_life_flask_list := values.low_life_flask_list
    lootColor := values.lootColor
    loot_dalay := values.loot_dalay
}

TurnOffAllHotkey(){
    global quickFlasksHotkey0, quickFlasksHotkey1
    TurnOffHotkey(quickFlasksHotkey0, "QuickFlaskLabel0")
    TurnOffHotkey(quickFlasksHotkey1, "QuickFlaskLabel1")
}

TurnOnAllHotkey(){
    global quickFlasksHotkey0, quickFlasksHotkey1
    TurnOnHotkey(quickFlasksHotkey0, "QuickFlaskLabel0")
    TurnOnHotkey(quickFlasksHotkey1, "QuickFlaskLabel1")
}

TurnOffHotkey(key, label){
    key := Trim(key "")
    if !key
        return
    try Hotkey(key, Func(label), "Off")
}

TurnOnHotkey(key, label){
    key := Trim(key "")
    if !key
        return
    try Hotkey(key, Func(label), "On")
}
