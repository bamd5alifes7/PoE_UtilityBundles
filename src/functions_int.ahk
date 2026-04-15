
AutoDetonate(){
    global auto_detonate_active, mine_laying_time
    if auto_detonate_active{
        while (GetKeyState("RButton", "P")){
            Send "{RButton}"
            Sleep mine_laying_time
            Send "{d}"
            rand := Random(10, 40)
            Sleep rand
        }
    }
    else{
    }
}

Activate_AutoDetonate(){
    global auto_detonate_active
    auto_detonate_active := !auto_detonate_active
    if auto_detonate_active{
        MsgBox("Auto Detonate : On",, "T0.5")
    }
    else{
        MsgBox("Auto Detonate : Off",, "T0.5")
    }
    return
}

Activate_AutoFlask(){
    global auto_flask_active
    auto_flask_active := !auto_flask_active
    if auto_flask_active{
        MsgBox("Auto flask : On",, "T0.5")
        SetTimer(AutoFlaskTick, 100)
    }
    else{
        SetTimer(AutoFlaskTick, 0)
        MsgBox("Auto flask : Off",, "T0.5")
    }
    return
}

AutoFlaskTick(){
    global auto_flask_active, low_life_X, low_life_Y, life_color, low_life_flask_list
    static readyAt := 0

    if !auto_flask_active || !WinActive("ahk_exe PathOfExile.exe")
        return

    if A_TickCount < readyAt
        return

    color := PixelGetColor(low_life_X, low_life_Y, "RGB")
    if color != life_color {
        QuickFlask(low_life_flask_list)
        readyAt := A_TickCount + 250
    }
}

Set_Autoflask(){
    global low_life_X, low_life_Y, life_color
    MouseGetPos(&low_life_X, &low_life_Y)
    life_color := PixelGetColor(low_life_X, low_life_Y, "RGB")
    MsgBox("Auto Flask reset. X: " low_life_X ". Y: " low_life_Y ". color: " life_color, , "T1")
    return
}


Activate_QuickFlask(){
    global quick_flask_active
    quick_flask_active := !quick_flask_active
    if quick_flask_active{
        MsgBox("Quick flask : On",, "T0.5")
    }
    else{
        MsgBox("Quick flask : Off",, "T0.5")
    }
    return
}




QuickFlask(list){
    for item in StrSplit(list, "-") {
        if item == ""
            continue
        Send "{" item "}"
        Sleep 50
    }
    return
}

BuildGridCenters(topLeftX, topLeftY, bottomRightX, bottomRightY, columns, rows){
    positions := []
    cellWidth := (bottomRightX - topLeftX) / columns
    cellHeight := (bottomRightY - topLeftY) / rows

    Loop columns * rows
    {
        index := A_Index - 1
        column := Floor(index / rows)
        row := Mod(index, rows)
        positions.Push({
            x: topLeftX + cellWidth * column + cellWidth / 2,
            y: topLeftY + cellHeight * row + cellHeight / 2
        })
    }

    return positions
}

AutoTimeFlask(flasklist, attacklist, keepattacklist, AutoInterval){
    Interval := Ceil(AutoInterval / 200)

    for item in StrSplit(keepattacklist, "-") {
        if item == ""
            continue
        Send "{" item " down}"
        Sleep 40
    }

    while true {
        for item in StrSplit(flasklist, "-") {
            if item == ""
                continue
            Send "{" item "}"
            Sleep 40
        }

        for item in StrSplit(attacklist, "-") {
            if item == ""
                continue
            Send "{" item "}"
            Sleep 40
        }

        Loop Interval {
            Sleep 200
            if GetKeyState("F12", "P") {
                for item in StrSplit(keepattacklist, "-") {
                    if item == ""
                        continue
                    Send "{" item " up}"
                    Sleep 40
                }
                return
            }
        }
    }
    return
}


QuickEnter(channel){

	;為了避免按鍵沾黏，等按鍵釋放後才發動效果
	;KeyWait Control
	
	;考慮到危急情況需要趕快登出逃跑，手動釋放LControl鍵避免按鍵沾黏
	Send("{LControl up}")
	
    BlockInput("On")

	Send("{Enter}")
    Sleep 50
    SendText(channel)
    Sleep 50
    Send("{Enter}")
	
	BlockInput("Off")
	
    return
}

CheckMousePos(){
    MouseGetPos(&MouseX, &MouseY)
    color := PixelGetColor(MouseX, MouseY, "RGB")
    MsgBox("x=" MouseX " y=" MouseY " Color=" color ".")
    return
}

GetCoordinateSlots() {
    return [
        {id: "1", key: "deck", label: "Stacked Deck", guiLabel: "Stacked Deck", xVar: "DeckX", yVar: "DeckY"},
        {id: "2", key: "chance", label: "Orb of Chance", guiLabel: "Orb of Chance", xVar: "ChanceX", yVar: "ChanceY"},
        {id: "3", key: "scouring", label: "Orb of Scouring", guiLabel: "Orb of Scouring", xVar: "ScouringX", yVar: "ScouringY"},
        {id: "4", key: "alchemy", label: "Orb of Alchemy", guiLabel: "Orb of Alchemy", xVar: "AlchemyX", yVar: "AlchemyY"},
        {id: "5", key: "craftTarget", label: "Craft target item", guiLabel: "Craft Target", xVar: "ItemX", yVar: "ItemY"},
        {id: "6", key: "cardTrade", label: "Card trade inventory", guiLabel: "Card Trade Inv", xVar: "cardTradeX", yVar: "cardTradeY"},
        {id: "7", key: "bagTopLeft", label: "Bag top-left", guiLabel: "Bag top-left", xVar: "BagFirstX", yVar: "BagFirstY"},
        {id: "8", key: "bagBottomRight", label: "Bag bottom-right", guiLabel: "Bag bottom-right", xVar: "BagLastX", yVar: "BagLastY"},
        {id: "9", key: "tradeTopLeft", label: "Trade window top-left", guiLabel: "Trade window top-left", xVar: "tradeFirstX", yVar: "tradeFirstY"},
        {id: "10", key: "tradeBottomRight", label: "Trade window bottom-right", guiLabel: "Trade window bottom-right", xVar: "tradeLastX", yVar: "tradeLastY"},
        {id: "11", key: "stash1To5TopLeft", label: "Stash tabs 1-5 top-left", guiLabel: "Stash tabs 1-5 top-left", xVar: "stash1To5TopLeftX", yVar: "stash1To5TopLeftY"},
        {id: "12", key: "stash1To5BottomRight", label: "Stash tabs 1-5 bottom-right", guiLabel: "Stash tabs 1-5 bottom-right", xVar: "stash1To5BottomRightX", yVar: "stash1To5BottomRightY"},
        {id: "13", key: "stash6To10TopLeft", label: "Stash tabs 6-10 top-left", guiLabel: "Stash tabs 6-10 top-left", xVar: "stash6To10TopLeftX", yVar: "stash6To10TopLeftY"},
        {id: "14", key: "stash6To10BottomRight", label: "Stash tabs 6-10 bottom-right", guiLabel: "Stash tabs 6-10 bottom-right", xVar: "stash6To10BottomRightX", yVar: "stash6To10BottomRightY"},
        {id: "15", key: "stash11To12TopLeft", label: "Stash tabs 11-12 top-left", guiLabel: "Stash tabs 11-12 top-left", xVar: "stash11To12TopLeftX", yVar: "stash11To12TopLeftY"},
        {id: "16", key: "stash11To12BottomRight", label: "Stash tabs 11-12 bottom-right", guiLabel: "Stash tabs 11-12 bottom-right", xVar: "stash11To12BottomRightX", yVar: "stash11To12BottomRightY"},
        {id: "17", key: "autoFlaskProbe", label: "Auto flask life-color probe", guiLabel: "Auto Flask", xVar: "low_life_X", yVar: "low_life_Y"}
    ]
}

FindCoordinateSlotById(option) {
    for slot in GetCoordinateSlots() {
        if slot.id = option
            return slot
    }
    return ""
}

BuildCoordinateSlotListText() {
    text := ""

    for slot in GetCoordinateSlots() {
        if text != ""
            text .= "`r`n"
        text .= slot.id " = " slot.label
    }

    return text
}

SaveCoordinateSlotValue(slotKey, mouseX, mouseY) {
    global DeckX, DeckY, ChanceX, ChanceY, cardTradeX, cardTradeY, ScouringX, ScouringY, ItemX, ItemY, AlchemyX, AlchemyY
    global BagFirstX, BagFirstY, BagLastX, BagLastY
    global tradeFirstX, tradeFirstY, tradeLastX, tradeLastY
    global stash1To5TopLeftX, stash1To5TopLeftY, stash1To5BottomRightX, stash1To5BottomRightY
    global stash6To10TopLeftX, stash6To10TopLeftY, stash6To10BottomRightX, stash6To10BottomRightY
    global stash11To12TopLeftX, stash11To12TopLeftY, stash11To12BottomRightX, stash11To12BottomRightY
    global low_life_X, low_life_Y

    switch slotKey {
        case "deck":
            DeckX := mouseX, DeckY := mouseY
        case "chance":
            ChanceX := mouseX, ChanceY := mouseY
        case "scouring":
            ScouringX := mouseX, ScouringY := mouseY
        case "alchemy":
            AlchemyX := mouseX, AlchemyY := mouseY
        case "craftTarget":
            ItemX := mouseX, ItemY := mouseY
        case "cardTrade":
            cardTradeX := mouseX, cardTradeY := mouseY
        case "bagTopLeft":
            BagFirstX := mouseX, BagFirstY := mouseY
        case "bagBottomRight":
            BagLastX := mouseX, BagLastY := mouseY
        case "tradeTopLeft":
            tradeFirstX := mouseX, tradeFirstY := mouseY
        case "tradeBottomRight":
            tradeLastX := mouseX, tradeLastY := mouseY
        case "stash1To5TopLeft":
            stash1To5TopLeftX := mouseX, stash1To5TopLeftY := mouseY
        case "stash1To5BottomRight":
            stash1To5BottomRightX := mouseX, stash1To5BottomRightY := mouseY
        case "stash6To10TopLeft":
            stash6To10TopLeftX := mouseX, stash6To10TopLeftY := mouseY
        case "stash6To10BottomRight":
            stash6To10BottomRightX := mouseX, stash6To10BottomRightY := mouseY
        case "stash11To12TopLeft":
            stash11To12TopLeftX := mouseX, stash11To12TopLeftY := mouseY
        case "stash11To12BottomRight":
            stash11To12BottomRightX := mouseX, stash11To12BottomRightY := mouseY
        case "autoFlaskProbe":
            low_life_X := mouseX, low_life_Y := mouseY
        default:
            return false
    }

    return true
}

SaveCoordinatesTool(){
    if !WinActive("ahk_exe PathOfExile.exe") {
        MsgBox("Please switch to Path of Exile first, then place your cursor on the spot you want to save.")
        return
    }

    MouseGetPos(&mouseX, &mouseY)
    option := PromptCoordinateSaveOption(mouseX, mouseY)
    if option = ""
        return

    slot := FindCoordinateSlotById(option)
    if !IsObject(slot) {
        MsgBox("Unknown option. Please enter a number from 1 to " GetCoordinateSlots().Length ".")
        return
    }

    if !SaveCoordinateSlotValue(slot.key, mouseX, mouseY) {
        MsgBox("Unable to save that coordinate slot.")
        return
    }

    SaveSettings()
    MsgBox("Saved " slot.label " at x=" mouseX " y=" mouseY, , "T1")
}

PromptCoordinateSaveOption(mouseX, mouseY) {
    choice := ""
    dialog := Gui("+AlwaysOnTop", "Save Cursor Position")
    dialog.SetFont("s9", "Segoe UI")
    dialog.Add("Text", "x16 y16 w700 h20", "Current cursor position: [" mouseX ", " mouseY "]")
    dialog.Add("Edit", "x16 y44 w700 h290 ReadOnly -Wrap", BuildCoordinateSlotListText())
    dialog.Add("Text", "x16 y350 w420 h20", "Enter the number for the position you want to save:")
    optionEdit := dialog.Add("Edit", "x16 y376 w96 h26 vselectedOption", "1")
    saveButton := dialog.Add("Button", "x500 y372 w100 h30 Default", "Save")
    cancelButton := dialog.Add("Button", "x616 y372 w100 h30", "Cancel")

    saveButton.OnEvent("Click", (*) => (
        submitted := dialog.Submit(false),
        choice := Trim(submitted.selectedOption),
        dialog.Destroy()
    ))
    cancelButton.OnEvent("Click", (*) => dialog.Destroy())
    dialog.OnEvent("Close", (*) => dialog.Destroy())
    dialog.OnEvent("Escape", (*) => dialog.Destroy())

    dialog.Show("w736 h424 Center")
    dialogHwnd := dialog.Hwnd
    optionEdit.Focus()
    WinWaitClose("ahk_id " dialogHwnd)
    return choice
}

GetCoordinateOptionLabel(option) {
    slot := FindCoordinateSlotById(option)
    return IsObject(slot) ? slot.label : "option " option
}

LootBigRegion(){
    global lootColor
    local Px, Py
    found := PixelSearch(&Px, &Py, 100, 100, A_ScreenWidth - 10, A_ScreenHeight - 150, lootColor, 5)
    if !found {
        return False
    }
    Click Px, Py
    return True
}

LootSmallRegion(){
    global lootColor
    local Px, Py
    found := PixelSearch(&Px, &Py, 650, 300, 950, 500, lootColor, 5)
    if !found {
        return False
    }
    Click Px, Py
    return True
}

LootAll(){
    global loot_dalay
    smallDelay := 100
    largeDelay := IsNumber(loot_dalay) ? Round(loot_dalay) : 400

    while (GetKeyState("LControl", "P") && GetKeyState("a", "P")){
        if !LootSmallRegion(){
            break
        }
        Sleep smallDelay
    }

    while (GetKeyState("LControl", "P") && GetKeyState("a", "P")){
        LootBigRegion()
        Sleep largeDelay
        while (GetKeyState("LControl", "P") && GetKeyState("a", "P")){
            if !LootSmallRegion(){
                break
            }
            Sleep smallDelay
        }
    }
}

Quickmoving(){
    Send("{Ctrl down}")
    Loop
        {
		
        if not GetKeyState("F11", "P")
			{
			Send("{Ctrl up}")
            break
			}
			
		Click("left")
        Sleep 40
        }
	
    return
}

QuickJewellerandFusing(){
	
	KeyWait("F2")
	
	Send("^{LShift Down}")

    Loop
        { 
        if GetKeyState("F12") 
            break
      
		;之前寫死在倉庫頁，何必咧
        ;Click left 441, 608
		
		Click("left")
		
		;台服 20ms即可
        ;Random, rand, 10, 20
		;Sleep, rand
		
		;國際服 
		rand := Random(190, 200)
		Sleep rand	
		
        }
    Send "^{LShift Up}"
    return
}

QuickChanceToUnique(){
    global BagFirstX, BagFirstY, BagLastX, BagLastY
    global ChanceX, ChanceY, ScouringX, ScouringY

    beltSlots := [1, 2, 3, 4, 5, 11, 12, 13, 14, 15]
    bagPositions := BuildGridCenters(BagFirstX, BagFirstY, BagLastX, BagLastY, 12, 5)

    BlockInput("On")
    MouseGetPos(&startX, &startY)

    for slot in beltSlots {
        if GetKeyState("F12", "P")
            break

        while true {
            if GetKeyState("F12", "P")
                break

            sleepTime := Random(80, 100)
            MouseMove(bagPositions[slot].x, bagPositions[slot].y, 1)
            Sleep sleepTime
            A_Clipboard := ""
            Send("^c")
            Sleep 30
            Send("^c")
            if !ClipWait(0.3) {
                Sleep sleepTime
                continue
            }

            itemRarity := GetItemRarity(A_Clipboard)
            if itemRarity = 3
                break

            MouseMove(ScouringX, ScouringY, 1)
            Sleep sleepTime
            Click("right")
            MouseMove(bagPositions[slot].x, bagPositions[slot].y, 1)
            Sleep sleepTime
            Click("left")
            MouseMove(ChanceX, ChanceY, 1)
            Sleep sleepTime
            Click("right")
            MouseMove(bagPositions[slot].x, bagPositions[slot].y, 1)
            Sleep sleepTime
            Click("left")
        }
    }

    MouseMove(startX, startY, 1)
    BlockInput("Off")
}

QuickTradeCards(){
    global BagFirstX, BagFirstY, BagLastX, BagLastY, cardTradeX, cardTradeY

    bagPositions := BuildGridCenters(BagFirstX, BagFirstY, BagLastX, BagLastY, 12, 5)

    BlockInput("On")
    Send("{Ctrl down}")
    MouseGetPos(&startX, &startY)

    for position in bagPositions {
        if GetKeyState("F12", "P")
            break

        sleepTime := Random(200, 220)
        MouseMove(position.x, position.y, 1)
        Click()
        Sleep sleepTime
        MouseMove(cardTradeX, cardTradeY, 1)
        Click()
        Sleep sleepTime
    }

    MouseMove(startX, startY, 1)
    Send("{Ctrl up}")
    BlockInput("Off")
}

QuickOpenDeck(){
    global DeckX, DeckY, BagFirstX, BagFirstY, BagLastX, BagLastY

    bagSlot := BuildGridCenters(BagFirstX, BagFirstY, BagLastX, BagLastY, 12, 5)[1]

    BlockInput("On")

    Loop 5000
    {
        if GetKeyState("F12", "P") {
            Send("{Ctrl up}")
            BlockInput("Off")
            return
        }

        sleepTime := Random(260, 300)
        Send("{Ctrl up}")
        MouseMove(DeckX, DeckY, 1)
        Click("right")
        Sleep sleepTime

        MouseMove(bagSlot.x, bagSlot.y, 1)
        Click()
        Sleep sleepTime

        Send("{Ctrl down}")
        MouseMove(bagSlot.x, bagSlot.y, 1)
        Click()
        Sleep sleepTime
    }

    Send("{Ctrl up}")
    BlockInput("Off")
}

GetItemRarity(text){
    if InStr(text, "稀有度: 普通") || InStr(text, "Rarity: Normal")
        return 0
    if InStr(text, "稀有度: 魔法") || InStr(text, "Rarity: Magic")
        return 1
    if InStr(text, "稀有度: 稀有") || InStr(text, "Rarity: Rare")
        return 2
    if InStr(text, "稀有度: 傳奇") || InStr(text, "Rarity: Unique")
        return 3
    return -1
}

QuickScouringAndAlchemy(ScouringX,ScouringY,ItemX,ItemY,AlchemyX,AlchemyY){
    MouseMove(ItemX, ItemY, 2)
    Sleep 50
	
    BlockInput("On")
	;3.17重鑄石的座標更改
    MouseMove(ScouringX, ScouringY, 1)
    Sleep 50
    Click("right")
    Sleep 50
    MouseMove(ItemX, ItemY, 1)
    Sleep 50
    Click("left")
    Sleep 50
	;3.17點金石的座標更改
    MouseMove(AlchemyX, AlchemyY, 1)
    Sleep 50
    Click("right")
    Sleep 50
    MouseMove(ItemX, ItemY, 1)
    Sleep 50
    Click("left")

    BlockInput("Off")
    return
}



QuickBagmoving(BagFirstX,BagFirstY,BagLastX,BagLastY){
    bagPositions := BuildGridCenters(BagFirstX, BagFirstY, BagLastX, BagLastY, 12, 5)

    BlockInput("On")
    Send("{Ctrl down}")
	MouseGetPos(&tempX, &tempY)
	
    for position in bagPositions
		{	
		
		if GetKeyState("F12", "P") 
		break 
		
		MouseMove(position.x, position.y, 1)
		; 國際服間隔個時間增加
		rand := Random(20, 40)
		
		Sleep rand	
		MouseClick()
		Sleep rand	
		}
	
	MouseMove(tempX, tempY, 1)
    Send("{Ctrl up}")
    BlockInput("Off")
    return

}

Quicktradescanning(tradeFirstX,tradeFirstY,tradeLastX,tradeLastY){
tradePositions := BuildGridCenters(tradeFirstX, tradeFirstY, tradeLastX, tradeLastY, 12, 5)

	MouseGetPos(&tempMouseX, &tempMouseY)

    for position in tradePositions
    {	
	
	;會使判斷在第七物件之後重新一遍，所以取消按住判定，改為按鍵取消
    if GetKeyState("F12") 
		break 
	
    MouseMove(position.x, position.y, 1)
    rand := Random(30, 40)
    Sleep rand	

    }
	
	MouseMove(tempMouseX, tempMouseY, 1)
    Send("{Shift up}")
    return

}

MoveStashColumns1To5(stash1To5TopLeftX,stash1To5TopLeftY,stash1To5BottomRightX,stash1To5BottomRightY)
{
    global stashMoveDelayMin, stashMoveDelayMax
    tabPositions := BuildGridCenters(stash1To5TopLeftX, stash1To5TopLeftY, stash1To5BottomRightX, stash1To5BottomRightY, 5, 12)
    minDelay := Min(stashMoveDelayMin, stashMoveDelayMax)
    maxDelay := Max(stashMoveDelayMin, stashMoveDelayMax)
	
BlockInput("On")
    Send("{Ctrl down}")
	MouseGetPos(&tempX, &tempY)
	
    for position in tabPositions
    {    
    
	;台服設置MouseMove,1  Random, 10, 20 (待測)
	;國際服設置MouseMove,1  Random, 600, 620 (實測)
	
    if GetKeyState("F12", "P") 
		break 

	rand := Random(minDelay, maxDelay)
	Sleep rand
    MouseMove(position.x, position.y, 1)
	rand := Random(minDelay, maxDelay)
	Sleep rand
    MouseClick()
	
	
    }
	
	MouseMove(tempX, tempY, 1)
    Send("{Ctrl up}")
	Send("{Shift up}")
    BlockInput("Off")
    return
	
}

MoveStashColumns6To10(stash6To10TopLeftX,stash6To10TopLeftY,stash6To10BottomRightX,stash6To10BottomRightY)
{
	global stashMoveDelayMin, stashMoveDelayMax
Tab2ndPositions := BuildGridCenters(stash6To10TopLeftX, stash6To10TopLeftY, stash6To10BottomRightX, stash6To10BottomRightY, 5, 12)
    minDelay := Min(stashMoveDelayMin, stashMoveDelayMax)
    maxDelay := Max(stashMoveDelayMin, stashMoveDelayMax)
	
BlockInput("On")
    Send("{Ctrl down}")
	MouseGetPos(&tempX, &tempY)
	
    for position in Tab2ndPositions
    {    
    
	;台服設置MouseMove,1  Random, 10, 20 (待測)
	;國際服設置MouseMove,1  Random, 600, 620 (實測)
	
    if GetKeyState("F12", "P") 
		break 

	rand := Random(minDelay, maxDelay)
	Sleep rand
    MouseMove(position.x, position.y, 1)
	rand := Random(minDelay, maxDelay)
	Sleep rand
    MouseClick()
	
	
    }
	
	MouseMove(tempX, tempY, 1)
    Send("{Ctrl up}")
	Send("{Shift up}")
	Send("{Alt up}")
    BlockInput("Off")
    return
	
}

MoveStashColumns11To12(stash11To12TopLeftX,stash11To12TopLeftY,stash11To12BottomRightX,stash11To12BottomRightY)
{
    global stashMoveDelayMin, stashMoveDelayMax
    Tab3rdPositions := BuildGridCenters(stash11To12TopLeftX, stash11To12TopLeftY, stash11To12BottomRightX, stash11To12BottomRightY, 2, 12)
    minDelay := Min(stashMoveDelayMin, stashMoveDelayMax)
    maxDelay := Max(stashMoveDelayMin, stashMoveDelayMax)

    BlockInput("On")
    Send("{Ctrl down}")
    MouseGetPos(&tempX, &tempY)

    for position in Tab3rdPositions
    {
        if GetKeyState("F12", "P")
            break

        rand := Random(minDelay, maxDelay)
        Sleep rand
        MouseMove(position.x, position.y, 1)
        rand := Random(minDelay, maxDelay)
        Sleep rand
        MouseClick()
    }

    MouseMove(tempX, tempY, 1)
    Send("{Ctrl up}")
    Send("{Shift up}")
    Send("{Alt up}")
    BlockInput("Off")
    return
}

;這功能原本是寫給公倉用的，慢速版的移動倉庫物品。但實際上用不著，已廢棄
QuickGuadmoving(){
	
GuadFirstX := 15
GuadFirstY := 170
GuadLastX := 650
GuadLastY := 380
GuadPosX := []
GuadPosY := []

	Loop 60
	{
        i := A_Index

	TempX := GuadFirstX + ((GuadLastX - GuadFirstX) / 12) * Floor((i - 1) / 5) + (GuadLastX - GuadFirstX) / 12 / 2
	GuadPosX.Push(TempX)
	TempY := GuadFirstY + (GuadLastY - GuadFirstY) / 4 * Mod(i - 1, 5) + (GuadLastY - GuadFirstY) / 4 / 2
	GuadPosY.Push(TempY)
	}
	
    BlockInput("On")
    Send("{Ctrl down}")
	MouseGetPos(&tempMouseX, &tempMouseY)
	
    for k, v in GuadPosX
    {	
	
    if GetKeyState("F12", "P") 
    break 

    MouseMove(GuadPosX[k],GuadPosY[k],1)
	rand := Random(10, 20)
    Sleep rand
    MouseClick()
    rand := Random(10, 20)
    Sleep rand
    }
	
	MouseMove(tempMouseX,tempMouseY,1)
    Send("{Ctrl up}")
    BlockInput("Off")
    return
	
}

Quick2ndGuadmoving()
{
	
GuadFirstX := 15
GuadFirstY := 390
GuadLastX := 540
GuadLastY := 600
GuadPosX := []
GuadPosY := []

	Loop 60
	{
        i := A_Index

	TempX := GuadFirstX + ((GuadLastX - GuadFirstX) / 12) * Floor((i - 1) / 5) + (GuadLastX - GuadFirstX) / 12 / 2
	GuadPosX.Push(TempX)
	TempY := GuadFirstY + (GuadLastY - GuadFirstY) / 4 * Mod(i - 1, 5) + (GuadLastY - GuadFirstY) / 4 / 2
	GuadPosY.Push(TempY)
	}
	
    BlockInput("On")
    Send("{Ctrl down}")
	MouseGetPos(&tempMouseX, &tempMouseY)
	
    for k, v in GuadPosX
    {	
	
    if GetKeyState("F12", "P") 
    break 

    MouseMove(GuadPosX[k],GuadPosY[k],1)
	rand := Random(10, 20)
    Sleep rand
    MouseClick()
    rand := Random(10, 20)
    Sleep rand
    }
	
	MouseMove(tempMouseX,tempMouseY,1)
    Send("{Ctrl up}")
    BlockInput("Off")
    return
	
	
}


checkChannel()
{
    global check
    check := 1

    ;以下動作為，點選交易頻道按鈕，複製並檢查對話欄的內容是否包含trade字眼
rand := Random(100, 200)

Send("{LShift Up}")
Send("{Enter}")
    Sleep rand

;世界頻按鈕，因台服已不可在世界頻提供服務，移除
;MouseMove, 203, 533, 1

;交易頻按鈕	
MouseMove(620, 500, 1)

    Sleep rand
MouseClick("right")
    Sleep rand
Send("^a")	
    Sleep rand
Send("^c")
    Sleep rand
Send("{Enter}")
    Sleep rand
	
;MsgBox ,clipboard `= %clipboard%
FoundPos := RegExMatch(A_Clipboard, "trade")
;MsgBox ,FoundPos `= " FoundPos
if FoundPos == 0
{
	check := 0
	MsgBox("失敗了!請在關閉對話欄及倉庫頁的情況下使用快捷鍵")
	return 0
}

}

Announcement()
{
    global AnnounceChannel, Announce, check

    ;BlockInput On

    ;為了避免按鍵沾黏，等按鍵釋放後才發動效果
    KeyWait("Shift")


    ;呼叫checkChannel確認是否對話狀態處在交易頻道下
    checkChannel()
    if check == 0
        return
	
	;針對指定的頻道們，依次切換頻道並輸入內容
	
    for Pushindex, element in AnnounceChannel 
	{
		
		for index, element in AnnounceChannel[Pushindex] 
		{
			;檢查是否有按住F12，有則終止動作
			if GetKeyState("F12", "P")
			{
			;BlockInput Off		
			break 
			} 
		
			;MsgBox % "Element number " . index . " is " . element
			
			;準備切頻道，製作切頻道用的字串
			Channel := "/trade " element
			;MsgBox ,type = %Channel%
			
			;切頻道，並確認處在交易頻中。
		
			loop{
			
				;檢查是否有按住F12，有則終止動作
				if GetKeyState("F12", "P"){
				;BlockInput Off		
				break 
				}
			
				;設置動作間的休息時間
				rand := Random(100, 200)
				
				Send("{Enter}")
				Sleep rand
				;貼上切頻道用的字串
				Send(Channel)
				Sleep rand
				Send("{Enter}")
				Sleep rand
				
				checkChannel()
				if check == 0
					return
				if Channel == A_Clipboard
					break
				}
				
			;輸入廣播內容
			Send "{Enter}"
			Sleep rand
			Send(Announce)
			Sleep rand
			Send("{Enter}")
			Sleep rand

		
		}
		
	}
	
BlockInput("Off")
}


Autoattack(AutoTimeattacklist)
{
    SendInput "{RButton down}"
    while true {
        for item in StrSplit(AutoTimeattacklist, "-") {
            if item == ""
                continue
            if GetKeyState("F12", "P") {
                SendInput "{RButton up}"
                SendInput "{" item " up}"
                return
            }
            SendInput "{" item " down}"
            Sleep 300
            SendInput "{" item " up}"
            Sleep 1000
        }
    }
}

RunAsAdmin()
{
    params := ""
    for index, param in A_Args
        params .= A_Space . param

    ShellExecute := "shell32\ShellExecute"
    if !A_IsAdmin
    {
        if A_IsCompiled {
            DllCall(ShellExecute, "ptr", 0, "str", "RunAs", "str", A_ScriptFullPath, "str", params, "str", A_WorkingDir, "int", 1)
        } else {
            quote := Chr(34)
            scriptArgs := quote . A_ScriptFullPath . quote . A_Space . params
            DllCall(ShellExecute, "ptr", 0, "str", "RunAs", "str", A_AhkPath, "str", scriptArgs, "str", A_WorkingDir, "int", 1)
        }
        ExitApp()
    }
}
