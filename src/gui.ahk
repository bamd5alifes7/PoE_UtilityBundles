RunGUI(){
    global mainGui
    global hotkeyQuickFlaskPrimary, hotkeyToggleQuickFlask, hotkeyAutoattack, hotkeyAutoTimeFlask
    global hotkeyQuickEnter0, hotkeyQuickEnter1, hotkeyQuickEnter2, hotkeyQuickEnter3, hotkeyQuickEnter4, hotkeyQuickEnter5, hotkeyQuickEnter7
    global hotkeyCheckMousePos, hotkeySaveCoordinates, hotkeyQuickBagmoving, hotkeyQuickTradeScanning
    global hotkeyQuickScouringAlchemy, hotkeyQuickJewellerFusing, hotkeyQuickFastGuard, hotkeyQuickFast2ndGuard, hotkeyQuickFast3rdGuard
    global hotkeyQuickmoving, hotkeyQuickChanceToUnique, hotkeyQuickOpenDeck, hotkeyQuickTradeCards
    global hotkeyActivateAutoDetonate, hotkeyAutoDetonateTrigger, hotkeyAnnouncement
    global hotkeySetAutoflask, hotkeyActivateAutoflask, hotkeyLootAll
    global quickFlasksHotkey0, quickFlasksHotkey1, quick_flask_list, quick_flask_list_1
    global AutoTime_attack_list, AutoTime_flask_list, keep_attack_list, AutoInterval
    global quickEnterText0, quickEnterText1, quickEnterText2, quickEnterText3, quickEnterText4, quickEnterText5, quickEnterText7
    global BagFirstX, BagFirstY, BagLastX, BagLastY, DeckX, DeckY, ChanceX, ChanceY, cardTradeX, cardTradeY, tradeFirstX, tradeFirstY, tradeLastX, tradeLastY
    global ScouringX, ScouringY, ItemX, ItemY, AlchemyX, AlchemyY
    global stash1To5TopLeftX, stash1To5TopLeftY, stash1To5BottomRightX, stash1To5BottomRightY
    global stash6To10TopLeftX, stash6To10TopLeftY, stash6To10BottomRightX, stash6To10BottomRightY
    global stash11To12TopLeftX, stash11To12TopLeftY, stash11To12BottomRightX, stash11To12BottomRightY
    global mine_laying_time, stashMoveDelayMin, stashMoveDelayMax, Announce, low_life_flask_list, lootColor, loot_dalay
    global low_life_X, low_life_Y, life_color

    mainGui := Gui("+Resize +MinSize920x860", "POE_Utilitybundles")
    mainGui.MarginX := 20
    mainGui.MarginY := 16
    mainGui.SetFont("s9", "Segoe UI")
    mainGui.Add("Edit", "x0 y0 w0 h0 Hidden")

    mainGui.SetFont("w700 c2B579A")
    mainGui.Add("Text", "x20 y16 w360 h20 BackgroundTrans", "PoE Utility Bundles")
    mainGui.SetFont("norm cDefault")
    mainGui.Add("Text", "x20 y42 w520 h20", "Set hotkeys here. Detailed feature notes live in the GitHub README.")
    mainGui.Add("Link", "x20 y66 w360 h22", '<a href="https://github.com/bamd5alifes7/PoE_UtilityBundles/blob/master/README.md">Open README on GitHub</a>')
    mainGui.Add("Text", "x420 y42 w380 h20", "AHK syntax: ^ Ctrl, + Shift, ! Alt, ~ keep original key.")
    mainGui.Add("Text", "x420 y66 w380 h20", "Leave a hotkey blank to disable that action.")

    mainGui.SetFont("s9", "Segoe UI")
    tabCtrl := mainGui.Add("Tab3", "xs y+14 w824 h700", ["Home", "Flask / Timer", "Quick Enter", "Coords / Core", "Coords / Stash", "More"])

    tabCtrl.UseTab(1)
    mainGui.Add("GroupBox", "x16 y120 w382 h220", "Flask / Combat")
    AddHomeHotkey(mainGui, 32, 148, "hotkeyQuickFlaskPrimary", "Quick flask", hotkeyQuickFlaskPrimary)
    AddHomeHotkey(mainGui, 32, 172, "hotkeyToggleQuickFlask", "Toggle quick flask", hotkeyToggleQuickFlask)
    AddHomeHotkey(mainGui, 32, 196, "hotkeyAutoattack", "Auto attack", hotkeyAutoattack)
    AddHomeHotkey(mainGui, 32, 220, "hotkeyAutoTimeFlask", "Auto cycle", hotkeyAutoTimeFlask)
    AddHomeHotkey(mainGui, 32, 244, "quickFlasksHotkey0", "Extra flask hotkey 1", quickFlasksHotkey0)
    AddHomeHotkey(mainGui, 32, 268, "quickFlasksHotkey1", "Extra flask hotkey 2", quickFlasksHotkey1)
    AddHomeHotkey(mainGui, 32, 292, "hotkeySetAutoflask", "Set auto flask", hotkeySetAutoflask)
    AddHomeHotkey(mainGui, 32, 316, "hotkeyActivateAutoflask", "Toggle auto flask", hotkeyActivateAutoflask)

    mainGui.Add("GroupBox", "x422 y120 w382 h194", "Quick Enter / Travel")
    AddHomeHotkey(mainGui, 438, 148, "hotkeyQuickEnter0", "Quick enter 1", hotkeyQuickEnter0)
    AddHomeHotkey(mainGui, 438, 172, "hotkeyQuickEnter1", "Quick enter 2", hotkeyQuickEnter1)
    AddHomeHotkey(mainGui, 438, 196, "hotkeyQuickEnter2", "Quick enter 3", hotkeyQuickEnter2)
    AddHomeHotkey(mainGui, 438, 220, "hotkeyQuickEnter3", "Quick enter 4", hotkeyQuickEnter3)
    AddHomeHotkey(mainGui, 438, 244, "hotkeyQuickEnter4", "Quick enter 5", hotkeyQuickEnter4)
    AddHomeHotkey(mainGui, 438, 268, "hotkeyQuickEnter5", "Quick enter 6", hotkeyQuickEnter5)
    AddHomeHotkey(mainGui, 438, 292, "hotkeyQuickEnter7", "Exit to char", hotkeyQuickEnter7)

    mainGui.Add("GroupBox", "x16 y352 w382 h98", "Coords / Detection")
    AddHomeHotkey(mainGui, 32, 380, "hotkeyCheckMousePos", "Probe color/pos", hotkeyCheckMousePos)
    AddHomeHotkey(mainGui, 32, 404, "hotkeySaveCoordinates", "Save cursor position", hotkeySaveCoordinates)

    mainGui.Add("GroupBox", "x16 y462 w382 h170", "Movement / Stash")
    AddHomeHotkey(mainGui, 32, 490, "hotkeyQuickBagmoving", "Move bag items", hotkeyQuickBagmoving)
    AddHomeHotkey(mainGui, 32, 514, "hotkeyQuickFastGuard", "Stash 1-5", hotkeyQuickFastGuard)
    AddHomeHotkey(mainGui, 32, 538, "hotkeyQuickFast2ndGuard", "Stash 6-10", hotkeyQuickFast2ndGuard)
    AddHomeHotkey(mainGui, 32, 562, "hotkeyQuickFast3rdGuard", "Stash 11-12", hotkeyQuickFast3rdGuard)
    AddHomeHotkey(mainGui, 32, 586, "hotkeyQuickmoving", "Move along cursor", hotkeyQuickmoving)
    AddHomeHotkey(mainGui, 32, 610, "hotkeyLootAll", "Loot all", hotkeyLootAll)

    mainGui.Add("GroupBox", "x422 y326 w382 h170", "Trade / Craft")
    AddHomeHotkey(mainGui, 438, 354, "hotkeyQuickTradeScanning", "Scan trade", hotkeyQuickTradeScanning)
    AddHomeHotkey(mainGui, 438, 378, "hotkeyQuickScouringAlchemy", "Scour + alchemy", hotkeyQuickScouringAlchemy)
    AddHomeHotkey(mainGui, 438, 402, "hotkeyQuickJewellerFusing", "Fusing spam", hotkeyQuickJewellerFusing)
    AddHomeHotkey(mainGui, 438, 426, "hotkeyQuickChanceToUnique", "Chance to unique", hotkeyQuickChanceToUnique)
    AddHomeHotkey(mainGui, 438, 450, "hotkeyQuickOpenDeck", "Open deck", hotkeyQuickOpenDeck)
    AddHomeHotkey(mainGui, 438, 474, "hotkeyQuickTradeCards", "Trade cards", hotkeyQuickTradeCards)

    mainGui.Add("GroupBox", "x422 y532 w382 h146", "Utility / Mine")
    AddHomeHotkey(mainGui, 438, 560, "hotkeyActivateAutoDetonate", "Toggle detonate", hotkeyActivateAutoDetonate)
    AddHomeHotkey(mainGui, 438, 584, "hotkeyAutoDetonateTrigger", "Detonate trigger", hotkeyAutoDetonateTrigger)
    AddHomeHotkey(mainGui, 438, 608, "hotkeyAnnouncement", "Broadcast", hotkeyAnnouncement)

    tabCtrl.UseTab(2)
    mainGui.Add("GroupBox", "x16 y120 w780 h228", "QuickFlask")
    mainGui.SetFont("bold")
    mainGui.Add("Text", "x32 y146 w360 h18", "Main hotkeys are configurable on Home")
    mainGui.SetFont("norm")
    mainGui.Add("Text", "x32 y170 w200 h18", "Flask list (use - between keys)")
    mainGui.Add("Edit", "x240 y166 w220 h22 vquick_flask_list", quick_flask_list)
    mainGui.Add("Text", "x32 y204 w560 h18", "Extra hotkeys for quick flask remap mode")
    mainGui.Add("Text", "x32 y236 w120 h18", "Extra hotkey 1")
    mainGui.Add("Edit", "x156 y232 w90 h22 ReadOnly", quickFlasksHotkey0)
    mainGui.Add("Text", "x258 y236 w200 h18", "list 1 (same as quick flask)")
    mainGui.Add("Text", "x32 y268 w120 h18", "Extra hotkey 2")
    mainGui.Add("Edit", "x156 y264 w90 h22 ReadOnly", quickFlasksHotkey1)
    mainGui.Add("Text", "x258 y268 w120 h18", "list 2")
    mainGui.Add("Edit", "x380 y264 w220 h22 vquick_flask_list_1", quick_flask_list_1)

    mainGui.Add("GroupBox", "x16 y356 w780 h320", "AutoTime")
    mainGui.SetFont("bold")
    mainGui.Add("Text", "x32 y382 w320 h18", "Auto attack / cycle")
    mainGui.SetFont("norm")
    mainGui.Add("Text", "x32 y406 w200 h18", "Attack sequence (timer)")
    mainGui.Add("Edit", "x240 y402 w220 h22 vAutoTime_attack_list", AutoTime_attack_list)
    mainGui.Add("Text", "x32 y436 w740 h32", "The Home tab controls which key triggers these actions. Use instant-cast skills only.")
    mainGui.Add("Text", "x48 y474 w140 h18", "keep_attack_list")
    mainGui.Add("Edit", "x200 y470 w260 h22 vkeep_attack_list", keep_attack_list)
    mainGui.Add("Text", "x48 y504 w140 h18", "AutoTime_flask_list")
    mainGui.Add("Edit", "x200 y500 w260 h22 vAutoTime_flask_list", AutoTime_flask_list)
    mainGui.Add("Text", "x48 y534 w160 h18", "AutoTime_attack_list")
    mainGui.Add("Text", "x200 y534 w360 h18", "(same field as attack sequence above)")
    mainGui.Add("Text", "x48 y560 w140 h18", "AutoInterval (ms)")
    mainGui.Add("Edit", "x200 y556 w80 h22 vAutoInterval", AutoInterval)
    mainGui.SetFont("bold c800000")
    mainGui.Add("Text", "x32 y592 w740 h36", "Non-instant skills may not finish before next step.")
    mainGui.SetFont("norm cDefault")

    tabCtrl.UseTab(3)
    mainGui.Add("GroupBox", "x16 y120 w780 h540", "Quick Enter (chat)")
    mainGui.Add("Text", "x36 y148 w700 h18", "Hotkeys are editable on Home. These fields only control the sent text.")
    mainGui.SetFont("bold")
    mainGui.Add("Text", "x36 y180 w120 h18", "Quick enter 1")
    mainGui.Add("Text", "x36 y212 w120 h18", "Quick enter 2")
    mainGui.Add("Text", "x36 y244 w120 h18", "Quick enter 3")
    mainGui.Add("Text", "x36 y276 w120 h18", "Quick enter 4")
    mainGui.Add("Text", "x36 y308 w120 h18", "Quick enter 5")
    mainGui.Add("Text", "x36 y340 w120 h18", "Quick enter 6")
    mainGui.Add("Text", "x36 y372 w120 h18", "Exit to char")
    mainGui.SetFont("norm s9", "Malgun Gothic")
    mainGui.Add("Edit", "x160 y174 w580 h24 vquickEnterText0", quickEnterText0)
    mainGui.Add("Edit", "x160 y206 w580 h24 vquickEnterText1", quickEnterText1)
    mainGui.Add("Edit", "x160 y238 w580 h24 vquickEnterText2", quickEnterText2)
    mainGui.Add("Edit", "x160 y270 w580 h24 vquickEnterText3", quickEnterText3)
    mainGui.Add("Edit", "x160 y302 w580 h24 vquickEnterText4", quickEnterText4)
    mainGui.Add("Edit", "x160 y334 w580 h24 vquickEnterText5", quickEnterText5)
    mainGui.Add("Edit", "x160 y366 w580 h24 vquickEnterText7", quickEnterText7)
    mainGui.SetFont("norm s9", "Segoe UI")

    tabCtrl.UseTab(4)
    mainGui.Add("GroupBox", "x16 y120 w780 h78", "Probe")
    mainGui.Add("Text", "x28 y134 w740 h20", "Shift+D default reads pixel color + position at cursor.")
    mainGui.Add("Text", "x28 y156 w740 h20", "Save cursor position opens a picker for bag, trade, crafting, stash, and auto-flask positions.")
    mainGui.Add("Text", "x28 y178 w740 h18", "Tip: 'Save cursor position' is usually the fastest way to set these values.")
    mainGui.Add("GroupBox", "x16 y202 w780 h132", "Bag Bounds")
    mainGui.Add("Text", "x40 y226 w72 h18", "Top Left X")
    mainGui.Add("Edit", "x134 y222 w100 h22 vBagFirstX", BagFirstX)
    mainGui.Add("Text", "x252 y226 w72 h18", "Top Left Y")
    mainGui.Add("Edit", "x346 y222 w100 h22 vBagFirstY", BagFirstY)
    mainGui.Add("Text", "x40 y254 w90 h18", "Bottom Right X")
    mainGui.Add("Edit", "x134 y250 w100 h22 vBagLastX", BagLastX)
    mainGui.Add("Text", "x252 y254 w100 h18", "Bottom Right Y")
    mainGui.Add("Edit", "x346 y250 w100 h22 vBagLastY", BagLastY)
    mainGui.Add("GroupBox", "x16 y340 w780 h120", "Trade Window Bounds")
    mainGui.Add("Text", "x40 y376 w90 h18", "Top Left X")
    mainGui.Add("Edit", "x134 y372 w100 h22 vtradeFirstX", tradeFirstX)
    mainGui.Add("Text", "x252 y376 w90 h18", "Top Left Y")
    mainGui.Add("Edit", "x346 y372 w100 h22 vtradeFirstY", tradeFirstY)
    mainGui.Add("Text", "x40 y408 w100 h18", "Bottom Right X")
    mainGui.Add("Edit", "x134 y404 w100 h22 vtradeLastX", tradeLastX)
    mainGui.Add("Text", "x252 y408 w100 h18", "Bottom Right Y")
    mainGui.Add("Edit", "x346 y404 w100 h22 vtradeLastY", tradeLastY)
    mainGui.Add("GroupBox", "x16 y458 w780 h252", "Action Targets")
    mainGui.Add("Text", "x40 y486 w110 h18", "Stacked Deck")
    mainGui.Add("Text", "x154 y486 w14 h18", "X")
    mainGui.Add("Edit", "x170 y482 w72 h22 vDeckX", DeckX)
    mainGui.Add("Text", "x250 y486 w14 h18", "Y")
    mainGui.Add("Edit", "x266 y482 w72 h22 vDeckY", DeckY)
    mainGui.Add("Text", "x430 y486 w110 h18", "Card Trade Inv")
    mainGui.Add("Text", "x544 y486 w14 h18", "X")
    mainGui.Add("Edit", "x560 y482 w72 h22 vcardTradeX", cardTradeX)
    mainGui.Add("Text", "x640 y486 w14 h18", "Y")
    mainGui.Add("Edit", "x656 y482 w72 h22 vcardTradeY", cardTradeY)

    mainGui.Add("Text", "x40 y514 w110 h18", "Orb of Chance")
    mainGui.Add("Text", "x154 y514 w14 h18", "X")
    mainGui.Add("Edit", "x170 y510 w72 h22 vChanceX", ChanceX)
    mainGui.Add("Text", "x250 y514 w14 h18", "Y")
    mainGui.Add("Edit", "x266 y510 w72 h22 vChanceY", ChanceY)
    mainGui.Add("Text", "x430 y514 w110 h18", "Craft Target")
    mainGui.Add("Text", "x544 y514 w14 h18", "X")
    mainGui.Add("Edit", "x560 y510 w72 h22 vItemX", ItemX)
    mainGui.Add("Text", "x640 y514 w14 h18", "Y")
    mainGui.Add("Edit", "x656 y510 w72 h22 vItemY", ItemY)

    mainGui.Add("Text", "x40 y542 w110 h18", "Orb of Scouring")
    mainGui.Add("Text", "x154 y542 w14 h18", "X")
    mainGui.Add("Edit", "x170 y538 w72 h22 vScouringX", ScouringX)
    mainGui.Add("Text", "x250 y542 w14 h18", "Y")
    mainGui.Add("Edit", "x266 y538 w72 h22 vScouringY", ScouringY)
    mainGui.Add("Text", "x430 y542 w110 h18", "Auto Flask")
    mainGui.Add("Text", "x544 y542 w14 h18", "X")
    mainGui.Add("Edit", "x560 y538 w72 h22 vlow_life_X", low_life_X)
    mainGui.Add("Text", "x640 y542 w14 h18", "Y")
    mainGui.Add("Edit", "x656 y538 w72 h22 vlow_life_Y", low_life_Y)

    mainGui.Add("Text", "x40 y570 w110 h18", "Orb of Alchemy")
    mainGui.Add("Text", "x154 y570 w14 h18", "X")
    mainGui.Add("Edit", "x170 y566 w72 h22 vAlchemyX", AlchemyX)
    mainGui.Add("Text", "x250 y570 w14 h18", "Y")
    mainGui.Add("Edit", "x266 y566 w72 h22 vAlchemyY", AlchemyY)
    mainGui.Add("Text", "x430 y570 w110 h18", "Life Color")
    mainGui.Add("Edit", "x560 y566 w120 h22 vlife_color", life_color)
    mainGui.Add("Text", "x430 y600 w320 h36", "Auto flask probe can also be reset from the Set auto flask hotkey.")

    tabCtrl.UseTab(5)
    mainGui.Add("GroupBox", "x16 y120 w780 h360", "Stash Ranges")
    mainGui.Add("Text", "x32 y138 w740 h18", "These ranges control the stash sweep hotkeys from Home.")
    mainGui.Add("Text", "x32 y156 w740 h18", "Tip: 'Save cursor position' is usually the fastest way to capture stash corners.")
    mainGui.Add("Text", "x32 y178 w140 h18", "Stash 1-5")
    mainGui.Add("Text", "x48 y202 w120 h18", "Top Left X")
    mainGui.Add("Edit", "x172 y198 w90 h22 vstash1To5TopLeftX", stash1To5TopLeftX)
    mainGui.Add("Text", "x278 y202 w120 h18", "Top Left Y")
    mainGui.Add("Edit", "x402 y198 w90 h22 vstash1To5TopLeftY", stash1To5TopLeftY)
    mainGui.Add("Text", "x48 y234 w120 h18", "Bottom Right X")
    mainGui.Add("Edit", "x172 y230 w90 h22 vstash1To5BottomRightX", stash1To5BottomRightX)
    mainGui.Add("Text", "x278 y234 w120 h18", "Bottom Right Y")
    mainGui.Add("Edit", "x402 y230 w90 h22 vstash1To5BottomRightY", stash1To5BottomRightY)
    mainGui.Add("Text", "x32 y274 w140 h18", "Stash 6-10")
    mainGui.Add("Text", "x48 y298 w120 h18", "Top Left X")
    mainGui.Add("Edit", "x172 y294 w90 h22 vstash6To10TopLeftX", stash6To10TopLeftX)
    mainGui.Add("Text", "x278 y298 w120 h18", "Top Left Y")
    mainGui.Add("Edit", "x402 y294 w90 h22 vstash6To10TopLeftY", stash6To10TopLeftY)
    mainGui.Add("Text", "x48 y330 w120 h18", "Bottom Right X")
    mainGui.Add("Edit", "x172 y326 w90 h22 vstash6To10BottomRightX", stash6To10BottomRightX)
    mainGui.Add("Text", "x278 y330 w120 h18", "Bottom Right Y")
    mainGui.Add("Edit", "x402 y326 w90 h22 vstash6To10BottomRightY", stash6To10BottomRightY)
    mainGui.Add("Text", "x32 y370 w140 h18", "Stash 11-12")
    mainGui.Add("Text", "x48 y394 w120 h18", "Top Left X")
    mainGui.Add("Edit", "x172 y390 w90 h22 vstash11To12TopLeftX", stash11To12TopLeftX)
    mainGui.Add("Text", "x278 y394 w120 h18", "Top Left Y")
    mainGui.Add("Edit", "x402 y390 w90 h22 vstash11To12TopLeftY", stash11To12TopLeftY)
    mainGui.Add("Text", "x48 y426 w120 h18", "Bottom Right X")
    mainGui.Add("Edit", "x172 y422 w90 h22 vstash11To12BottomRightX", stash11To12BottomRightX)
    mainGui.Add("Text", "x278 y426 w120 h18", "Bottom Right Y")
    mainGui.Add("Edit", "x402 y422 w90 h22 vstash11To12BottomRightY", stash11To12BottomRightY)
    mainGui.Add("GroupBox", "x516 y186 w260 h170", "Stash Move Delay")
    mainGui.Add("Text", "x536 y214 w220 h34", "These delays are used by stash 1-5, 6-10, and 11-12 move actions.")
    mainGui.Add("Text", "x536 y266 w110 h18", "Min delay (ms)")
    mainGui.Add("Edit", "x652 y262 w90 h22 vstashMoveDelayMin", stashMoveDelayMin)
    mainGui.Add("Text", "x536 y298 w110 h18", "Max delay (ms)")
    mainGui.Add("Edit", "x652 y294 w90 h22 vstashMoveDelayMax", stashMoveDelayMax)
    mainGui.Add("Text", "x536 y330 w210 h18", "Use a slightly wider range for slower servers.")

    tabCtrl.UseTab(6)
    mainGui.Add("GroupBox", "x16 y120 w780 h210", "More: deprecated / broadcast / autoflask")
    mainGui.Add("Text", "x32 y146 w720 h18", "Deprecated / rare use")
    mainGui.Add("Text", "x32 y170 w720 h58", "Broadcast, auto flask, and loot-all hotkeys are all configurable on Home.")
    mainGui.Add("Text", "x32 y236 w720 h20", "Broadcast text:")
    mainGui.SetFont("s9", "Segoe UI")
    mainGui.Add("Edit", "x32 y260 w740 h54 vAnnounce", Announce)
    mainGui.Add("GroupBox", "x16 y338 w780 h118", "AutoFlask")
    mainGui.Add("Text", "x32 y362 w720 h18", "low_life_flask_list")
    mainGui.Add("Edit", "x240 y358 w200 h22 vlow_life_flask_list", low_life_flask_list)
    mainGui.Add("Text", "x32 y390 w180 h18", "mine_laying_time (ms)")
    mainGui.Add("Edit", "x240 y386 w80 h22 vmine_laying_time", mine_laying_time)
    mainGui.Add("Text", "x32 y418 w720 h36", "Color probe coordinates are managed from Coords / Core. 'Set auto flask' samples the life color under your current cursor.")
    mainGui.Add("GroupBox", "x16 y466 w780 h132", "Loot")
    mainGui.Add("Text", "x32 y490 w200 h18", "lootColor")
    mainGui.Add("Edit", "x240 y486 w140 h22 vlootColor", lootColor)
    mainGui.Add("Text", "x32 y518 w200 h18", "delay (ms)")
    mainGui.Add("Edit", "x240 y514 w80 h22 vloot_dalay", loot_dalay)
    mainGui.Add("Text", "x32 y544 w740 h36", "Pickup uses pixel color; speed limited.")

    tabCtrl.UseTab()
    mainGui.SetFont("bold cRed")
    mainGui.Add("Text", "x14 y808 w840 h22", "Apply change saves settings.ini and re-registers hotkeys. Blank hotkey fields disable that action.")
    mainGui.SetFont("norm")
    btnApply := mainGui.Add("Button", "x688 y836 w150 h34 Default", "Apply change")
    btnApply.OnEvent("Click", ButtonApplyChange)

    mainGui.OnEvent("Close", GuiClose)
    mainGui.Show("w860 h880 Center")
}

AddHomeHotkey(guiObj, x, y, varName, title, value){
    guiObj.SetFont("norm")
    guiObj.Add("Text", Format("x{} y{} w136 h18", x, y), title)
    guiObj.Add("Edit", Format("x{} y{} w188 h22 v{}", x + 142, y - 4, varName), value)
}

GuiClose(*) {
    global mainGui
    currentValues := mainGui.Submit(false)
    if HasUnsavedChanges(currentValues) {
        result := MsgBox("You have unsaved changes.`n`nYes = Save and exit`nNo = Exit without saving`nCancel = Keep editing", "Unsaved Changes", "YesNoCancel Icon!")
        if result = "Cancel"
            return true
        if result = "Yes" {
            TurnOffAllHotkey()
            ApplyGuiValues(currentValues)
            SaveSettings()
            TurnOnAllHotkey()
        }
    }
    ExitApp()
}

ButtonApplyChange(*) {
    global mainGui
    TurnOffAllHotkey()
    ApplyGuiValues(mainGui.Submit(false))
    SaveSettings()
    TurnOnAllHotkey()
    MsgBox("Change applied", , "T1")
}

HasUnsavedChanges(values){
    global hotkeyQuickFlaskPrimary, hotkeyToggleQuickFlask, hotkeyAutoattack, hotkeyAutoTimeFlask
    global hotkeyQuickEnter0, hotkeyQuickEnter1, hotkeyQuickEnter2, hotkeyQuickEnter3, hotkeyQuickEnter4, hotkeyQuickEnter5, hotkeyQuickEnter7
    global hotkeyCheckMousePos, hotkeySaveCoordinates, hotkeyQuickBagmoving, hotkeyQuickTradeScanning
    global hotkeyQuickScouringAlchemy, hotkeyQuickJewellerFusing, hotkeyQuickFastGuard, hotkeyQuickFast2ndGuard, hotkeyQuickFast3rdGuard
    global hotkeyQuickmoving, hotkeyQuickChanceToUnique, hotkeyQuickOpenDeck, hotkeyQuickTradeCards
    global hotkeyActivateAutoDetonate, hotkeyAutoDetonateTrigger, hotkeyAnnouncement
    global hotkeySetAutoflask, hotkeyActivateAutoflask, hotkeyLootAll
    global quickFlasksHotkey0, quickFlasksHotkey1, quick_flask_list, quick_flask_list_1
    global AutoTime_attack_list, AutoTime_flask_list, keep_attack_list, AutoInterval
    global quickEnterText0, quickEnterText1, quickEnterText2, quickEnterText3, quickEnterText4, quickEnterText5, quickEnterText7
    global BagFirstX, BagFirstY, BagLastX, BagLastY, DeckX, DeckY, ChanceX, ChanceY, cardTradeX, cardTradeY, tradeFirstX, tradeFirstY, tradeLastX, tradeLastY
    global ScouringX, ScouringY, ItemX, ItemY, AlchemyX, AlchemyY
    global stash1To5TopLeftX, stash1To5TopLeftY, stash1To5BottomRightX, stash1To5BottomRightY
    global stash6To10TopLeftX, stash6To10TopLeftY, stash6To10BottomRightX, stash6To10BottomRightY
    global stash11To12TopLeftX, stash11To12TopLeftY, stash11To12BottomRightX, stash11To12BottomRightY
    global mine_laying_time, stashMoveDelayMin, stashMoveDelayMax, Announce, low_life_flask_list, lootColor, loot_dalay
    global low_life_X, low_life_Y, life_color

    trackedFields := Map(
        "hotkeyQuickFlaskPrimary", hotkeyQuickFlaskPrimary,
        "hotkeyToggleQuickFlask", hotkeyToggleQuickFlask,
        "hotkeyAutoattack", hotkeyAutoattack,
        "hotkeyAutoTimeFlask", hotkeyAutoTimeFlask,
        "hotkeyQuickEnter0", hotkeyQuickEnter0,
        "hotkeyQuickEnter1", hotkeyQuickEnter1,
        "hotkeyQuickEnter2", hotkeyQuickEnter2,
        "hotkeyQuickEnter3", hotkeyQuickEnter3,
        "hotkeyQuickEnter4", hotkeyQuickEnter4,
        "hotkeyQuickEnter5", hotkeyQuickEnter5,
        "hotkeyQuickEnter7", hotkeyQuickEnter7,
        "hotkeyCheckMousePos", hotkeyCheckMousePos,
        "hotkeySaveCoordinates", hotkeySaveCoordinates,
        "hotkeyQuickBagmoving", hotkeyQuickBagmoving,
        "hotkeyQuickTradeScanning", hotkeyQuickTradeScanning,
        "hotkeyQuickScouringAlchemy", hotkeyQuickScouringAlchemy,
        "hotkeyQuickJewellerFusing", hotkeyQuickJewellerFusing,
        "hotkeyQuickFastGuard", hotkeyQuickFastGuard,
        "hotkeyQuickFast2ndGuard", hotkeyQuickFast2ndGuard,
        "hotkeyQuickFast3rdGuard", hotkeyQuickFast3rdGuard,
        "hotkeyQuickmoving", hotkeyQuickmoving,
        "hotkeyQuickChanceToUnique", hotkeyQuickChanceToUnique,
        "hotkeyQuickOpenDeck", hotkeyQuickOpenDeck,
        "hotkeyQuickTradeCards", hotkeyQuickTradeCards,
        "hotkeyActivateAutoDetonate", hotkeyActivateAutoDetonate,
        "hotkeyAutoDetonateTrigger", hotkeyAutoDetonateTrigger,
        "hotkeyAnnouncement", hotkeyAnnouncement,
        "hotkeySetAutoflask", hotkeySetAutoflask,
        "hotkeyActivateAutoflask", hotkeyActivateAutoflask,
        "hotkeyLootAll", hotkeyLootAll,
        "quickFlasksHotkey0", quickFlasksHotkey0,
        "quickFlasksHotkey1", quickFlasksHotkey1,
        "quick_flask_list", quick_flask_list,
        "quick_flask_list_1", quick_flask_list_1,
        "AutoTime_attack_list", AutoTime_attack_list,
        "AutoTime_flask_list", AutoTime_flask_list,
        "keep_attack_list", keep_attack_list,
        "AutoInterval", AutoInterval,
        "quickEnterText0", quickEnterText0,
        "quickEnterText1", quickEnterText1,
        "quickEnterText2", quickEnterText2,
        "quickEnterText3", quickEnterText3,
        "quickEnterText4", quickEnterText4,
        "quickEnterText5", quickEnterText5,
        "quickEnterText7", quickEnterText7,
        "BagFirstX", BagFirstX,
        "BagFirstY", BagFirstY,
        "BagLastX", BagLastX,
        "BagLastY", BagLastY,
        "DeckX", DeckX,
        "DeckY", DeckY,
        "ChanceX", ChanceX,
        "ChanceY", ChanceY,
        "cardTradeX", cardTradeX,
        "cardTradeY", cardTradeY,
        "tradeFirstX", tradeFirstX,
        "tradeFirstY", tradeFirstY,
        "tradeLastX", tradeLastX,
        "tradeLastY", tradeLastY,
        "ScouringX", ScouringX,
        "ScouringY", ScouringY,
        "ItemX", ItemX,
        "ItemY", ItemY,
        "AlchemyX", AlchemyX,
        "AlchemyY", AlchemyY,
        "low_life_X", low_life_X,
        "low_life_Y", low_life_Y,
        "life_color", life_color,
        "stash1To5TopLeftX", stash1To5TopLeftX,
        "stash1To5TopLeftY", stash1To5TopLeftY,
        "stash1To5BottomRightX", stash1To5BottomRightX,
        "stash1To5BottomRightY", stash1To5BottomRightY,
        "stash6To10TopLeftX", stash6To10TopLeftX,
        "stash6To10TopLeftY", stash6To10TopLeftY,
        "stash6To10BottomRightX", stash6To10BottomRightX,
        "stash6To10BottomRightY", stash6To10BottomRightY,
        "stash11To12TopLeftX", stash11To12TopLeftX,
        "stash11To12TopLeftY", stash11To12TopLeftY,
        "stash11To12BottomRightX", stash11To12BottomRightX,
        "stash11To12BottomRightY", stash11To12BottomRightY,
        "mine_laying_time", mine_laying_time,
        "stashMoveDelayMin", stashMoveDelayMin,
        "stashMoveDelayMax", stashMoveDelayMax,
        "Announce", Announce,
        "low_life_flask_list", low_life_flask_list,
        "lootColor", lootColor,
        "loot_dalay", loot_dalay
    )

    for fieldName, currentValue in trackedFields {
        guiValue := values.%fieldName%
        if String(guiValue) != String(currentValue)
            return true
    }

    return false
}

ApplyGuiValues(values){
    global hotkeyQuickFlaskPrimary, hotkeyToggleQuickFlask, hotkeyAutoattack, hotkeyAutoTimeFlask
    global hotkeyQuickEnter0, hotkeyQuickEnter1, hotkeyQuickEnter2, hotkeyQuickEnter3, hotkeyQuickEnter4, hotkeyQuickEnter5, hotkeyQuickEnter7
    global hotkeyCheckMousePos, hotkeySaveCoordinates, hotkeyQuickBagmoving, hotkeyQuickTradeScanning
    global hotkeyQuickScouringAlchemy, hotkeyQuickJewellerFusing, hotkeyQuickFastGuard, hotkeyQuickFast2ndGuard, hotkeyQuickFast3rdGuard
    global hotkeyQuickmoving, hotkeyQuickChanceToUnique, hotkeyQuickOpenDeck, hotkeyQuickTradeCards
    global hotkeyActivateAutoDetonate, hotkeyAutoDetonateTrigger, hotkeyAnnouncement
    global hotkeySetAutoflask, hotkeyActivateAutoflask, hotkeyLootAll
    global quickFlasksHotkey0, quickFlasksHotkey1, quick_flask_list, quick_flask_list_1
    global AutoTime_attack_list, AutoTime_flask_list, keep_attack_list, AutoInterval
    global quickEnterText0, quickEnterText1, quickEnterText2, quickEnterText3, quickEnterText4, quickEnterText5, quickEnterText7
    global BagFirstX, BagFirstY, BagLastX, BagLastY, DeckX, DeckY, ChanceX, ChanceY, cardTradeX, cardTradeY, tradeFirstX, tradeFirstY, tradeLastX, tradeLastY
    global ScouringX, ScouringY, ItemX, ItemY, AlchemyX, AlchemyY
    global stash1To5TopLeftX, stash1To5TopLeftY, stash1To5BottomRightX, stash1To5BottomRightY
    global stash6To10TopLeftX, stash6To10TopLeftY, stash6To10BottomRightX, stash6To10BottomRightY
    global stash11To12TopLeftX, stash11To12TopLeftY, stash11To12BottomRightX, stash11To12BottomRightY
    global mine_laying_time, stashMoveDelayMin, stashMoveDelayMax, Announce, low_life_flask_list, lootColor, loot_dalay
    global low_life_X, low_life_Y, life_color

    hotkeyQuickFlaskPrimary := values.hotkeyQuickFlaskPrimary
    hotkeyToggleQuickFlask := values.hotkeyToggleQuickFlask
    hotkeyAutoattack := values.hotkeyAutoattack
    hotkeyAutoTimeFlask := values.hotkeyAutoTimeFlask
    hotkeyQuickEnter0 := values.hotkeyQuickEnter0
    hotkeyQuickEnter1 := values.hotkeyQuickEnter1
    hotkeyQuickEnter2 := values.hotkeyQuickEnter2
    hotkeyQuickEnter3 := values.hotkeyQuickEnter3
    hotkeyQuickEnter4 := values.hotkeyQuickEnter4
    hotkeyQuickEnter5 := values.hotkeyQuickEnter5
    hotkeyQuickEnter7 := values.hotkeyQuickEnter7
    hotkeyCheckMousePos := values.hotkeyCheckMousePos
    hotkeySaveCoordinates := values.hotkeySaveCoordinates
    hotkeyQuickBagmoving := values.hotkeyQuickBagmoving
    hotkeyQuickTradeScanning := values.hotkeyQuickTradeScanning
    hotkeyQuickScouringAlchemy := values.hotkeyQuickScouringAlchemy
    hotkeyQuickJewellerFusing := values.hotkeyQuickJewellerFusing
    hotkeyQuickFastGuard := values.hotkeyQuickFastGuard
    hotkeyQuickFast2ndGuard := values.hotkeyQuickFast2ndGuard
    hotkeyQuickFast3rdGuard := values.hotkeyQuickFast3rdGuard
    hotkeyQuickmoving := values.hotkeyQuickmoving
    hotkeyQuickChanceToUnique := values.hotkeyQuickChanceToUnique
    hotkeyQuickOpenDeck := values.hotkeyQuickOpenDeck
    hotkeyQuickTradeCards := values.hotkeyQuickTradeCards
    hotkeyActivateAutoDetonate := values.hotkeyActivateAutoDetonate
    hotkeyAutoDetonateTrigger := values.hotkeyAutoDetonateTrigger
    hotkeyAnnouncement := values.hotkeyAnnouncement
    hotkeySetAutoflask := values.hotkeySetAutoflask
    hotkeyActivateAutoflask := values.hotkeyActivateAutoflask
    hotkeyLootAll := values.hotkeyLootAll
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
    DeckX := values.DeckX
    DeckY := values.DeckY
    ChanceX := values.ChanceX
    ChanceY := values.ChanceY
    cardTradeX := values.cardTradeX
    cardTradeY := values.cardTradeY
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
    low_life_X := values.low_life_X
    low_life_Y := values.low_life_Y
    life_color := values.life_color
    stash1To5TopLeftX := values.stash1To5TopLeftX
    stash1To5TopLeftY := values.stash1To5TopLeftY
    stash1To5BottomRightX := values.stash1To5BottomRightX
    stash1To5BottomRightY := values.stash1To5BottomRightY
    stash6To10TopLeftX := values.stash6To10TopLeftX
    stash6To10TopLeftY := values.stash6To10TopLeftY
    stash6To10BottomRightX := values.stash6To10BottomRightX
    stash6To10BottomRightY := values.stash6To10BottomRightY
    stash11To12TopLeftX := values.stash11To12TopLeftX
    stash11To12TopLeftY := values.stash11To12TopLeftY
    stash11To12BottomRightX := values.stash11To12BottomRightX
    stash11To12BottomRightY := values.stash11To12BottomRightY
    mine_laying_time := values.mine_laying_time
    stashMoveDelayMin := values.stashMoveDelayMin
    stashMoveDelayMax := values.stashMoveDelayMax
    Announce := values.Announce
    low_life_flask_list := values.low_life_flask_list
    lootColor := values.lootColor
    loot_dalay := values.loot_dalay
}

TurnOffAllHotkey(){
    HotIfWinActive("ahk_exe PathOfExile.exe")
    ApplyConfiguredHotkeys("Off")
    HotIf
}

TurnOnAllHotkey(){
    HotIfWinActive("ahk_exe PathOfExile.exe")
    ApplyConfiguredHotkeys("On")
    HotIf
}
