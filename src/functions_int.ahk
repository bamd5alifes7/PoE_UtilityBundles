
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
        AutoFlask()
    }
    else{
        MsgBox("Auto flask : Off",, "T0.5")
    }
    return
}

AutoFlask(){
    global auto_flask_active, low_life_X, low_life_Y, life_color, low_life_flask_list
    while auto_flask_active
    {
        if WinActive("Path of Exile")
        {
            color := PixelGetColor(low_life_X, low_life_Y, "RGB")
            if color == life_color
            {
                QuickFlask(low_life_flask_list)
                Sleep 200
            }
        }
    }
    return
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
        AutoFlask()
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
    while (GetKeyState("LControl", "P") && GetKeyState("a", "P")){
        if !LootSmallRegion(){
            break
        }
        Sleep 100
    }

    while (GetKeyState("LControl", "P") && GetKeyState("a", "P")){
        LootBigRegion()
        Sleep 400
        while (GetKeyState("LControl", "P") && GetKeyState("a", "P")){
            if !LootSmallRegion(){
                break
            }
            Sleep 100
        }
    }
}

OpenPortal(){
    global portalX, portalY

	;為了避免按鍵沾黏，等按鍵釋放後才發動效果
	KeyWait("F")
	KeyWait("Control")
	
	;根據官方語法更建議SendMode，因為他會把按鍵存起來之後釋放。而BlockInput是直接丟棄按鍵，但懶得改
    BlockInput("On")
	
	;避免按鍵沾黏，主動釋放按鍵，不太實用但保留範例
	;send {LControl up}	

    MouseGetPos(&x, &y)
    Sleep 50
    Send("{i}")
    Sleep 50	

	;應該是因為數字需要整數，若設置為非0尾數會失敗
	MouseMove(portalX, portalY)
	
	;可直接使用座標數字
	;MouseMove(2500, 1100)
	
	Sleep 50
	MouseClick("right")
    Sleep 50
    Send("{i}")
    Sleep 50
    MouseMove(x, y)
    Sleep 50
    BlockInput("Off")
    return   
}

QuickSearchItem(){
    global url
    temp := A_Clipboard
    A_Clipboard := GetItemName()
    if A_Clipboard != ""
        SearchItem(url)
    A_Clipboard := temp
    return
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
        Sleep 20
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

	;背包欄最左上邊緣的尖角,改成用全域變數
	;BagFirstX = 1694
	;BagFirstY = 781
	;背包欄最右下邊緣的尖角,改成用全域變數
	;BagLastX = 2539
	;BagLastY = 1137
	;背包座標的數列
	BagPosX := []
	BagPosY := []

	;由左上角和右下角座標，計算60個需操作的位置。
	Loop 60
	{
        i := A_Index

		;初始X座標 + 格子長度*無條件捨去((當前數字-1)/5) + 格子一半長度
		TempX := BagFirstX + ((BagLastX - BagFirstX) / 12) * Floor((i - 1) / 5) + (BagLastX - BagFirstX) / 12 / 2
		BagPosX.Push(TempX)
		;初始Y座標 + 格子高度*餘數((當前數字-1)/5) + 格子一半高度
		TempY := BagFirstY + (BagLastY - BagFirstY) / 5 * Mod(i - 1, 5) + (BagLastY - BagFirstY) / 5 / 2
		BagPosY.Push(TempY)
	}

    BlockInput("On")
    Send("{Ctrl down}")
	MouseGetPos(&tempX, &tempY)
	
    for k, v in BagPosX
		{	
		
		if GetKeyState("F12", "P") 
		break 
		
		MouseMove(BagPosX[k], BagPosY[k], 1)
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

;交易欄最左上邊緣的尖角,改成用全域變數
;tradeFirstX = 412
;tradeFirstY = 269
;交易欄最右下邊緣的尖角,改成用全域變數
;tradeLastX = 1261
;tradeLastY = 612
tradePosX := []
tradePosY := []

	MouseGetPos(&tempMouseX, &tempMouseY)
	
	Loop 60
	{
        i := A_Index

	TempX := tradeFirstX + ((tradeLastX - tradeFirstX) / 12) * Floor((i - 1) / 5) + (tradeLastX - tradeFirstX) / 12 / 2
	tradePosX.Push(TempX)
	TempY := tradeFirstY + (tradeLastY - tradeFirstY) / 5 * Mod(i - 1, 5) + (tradeLastY - tradeFirstY) / 5 / 2
	tradePosY.Push(TempY)
	}

    for k, v in tradePosX
    {	
	
	;會使判斷在第七物件之後重新一遍，所以取消按住判定，改為按鍵取消
    if GetKeyState("F12") 
		break 
	
    MouseMove(tradePosX[k], tradePosY[k], 1)
    rand := Random(30, 40)
    Sleep rand	

    }
	
	MouseMove(tempMouseX, tempMouseY, 1)
    Send("{Shift up}")
    return

}

QuickFastGuadmoving(TabFirstX,TabFirstY,TabLastX,TabLastY)
{

/*
倉庫頁最左上邊緣的尖角,改成用全域變數	
TabFirstX = 23
TabFirstY = 185
倉庫頁第五直欄最右下邊緣的尖角,改成用全域變數
TabLastX = 373
TabLastY = 1022
*/

TabPosX := []
TabPosY := []

	Loop 60
	{
        i := A_Index

	TempX := TabFirstX + ((TabLastX - TabFirstX) / 5) * Floor((i - 1) / 12) + (TabLastX - TabFirstX) / 5 / 2
	TabPosX.Push(TempX)
	TempY := TabFirstY + (TabLastY - TabFirstY) / 12 * Mod(i - 1, 12) + (TabLastY - TabFirstY) / 12 / 2
	TabPosY.Push(TempY)
	}
	
BlockInput("On")
    Send("{Ctrl down}")
	MouseGetPos(&tempX, &tempY)
	
    for k, v in TabPosX
    {    
    
	;台服設置MouseMove,1  Random, 10, 20 (待測)
	;國際服設置MouseMove,1  Random, 600, 620 (實測)
	
    if GetKeyState("F12", "P") 
		break 

	rand := Random(10, 20)
	Sleep rand
    MouseMove(TabPosX[k], TabPosY[k], 1)
	rand := Random(10, 20)
	Sleep rand
    MouseClick()
	
	
    }
	
	MouseMove(tempX, tempY, 1)
    Send("{Ctrl up}")
	Send("{Shift up}")
    BlockInput("Off")
    return
	
}

QuickFast2ndGuadmoving(Tab2ndFirstX,Tab2ndFirstY,Tab2ndLastX,Tab2ndLastY)
{
	
Tab2ndPosX := []
Tab2ndPosY := []

	Loop 60
	{
        i := A_Index

	TempX := Tab2ndFirstX + ((Tab2ndLastX - Tab2ndFirstX) / 5) * Floor((i - 1) / 12) + (Tab2ndLastX - Tab2ndFirstX) / 5 / 2
	Tab2ndPosX.Push(TempX)
	TempY := Tab2ndFirstY + (Tab2ndLastY - Tab2ndFirstY) / 12 * Mod(i - 1, 12) + (Tab2ndLastY - Tab2ndFirstY) / 12 / 2
	Tab2ndPosY.Push(TempY)
	}
	
BlockInput("On")
    Send("{Ctrl down}")
	MouseGetPos(&tempX, &tempY)
	
    for k, v in Tab2ndPosX
    {    
    
	;台服設置MouseMove,1  Random, 10, 20 (待測)
	;國際服設置MouseMove,1  Random, 600, 620 (實測)
	
    if GetKeyState("F12", "P") 
		break 

	rand := Random(10, 20)
	Sleep rand
    MouseMove(Tab2ndPosX[k], Tab2ndPosY[k], 1)
	rand := Random(10, 20)
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
