; Generated using SmartGUI Creator 4.0
; 但若想要使用 SmartGUI Creator 再次開啟此檔，請先另外備份。因SmartGUI Creator會移除函數及註解

RunGUI(){

Gui, Font, S8 CDefault bold, Verdana
;可延伸閱讀 g-標籤 概念，點擊會運行GoToWebsite標籤
Gui, Add, Text, x30 y15 w120 h20 +cBlue gGoToWebsite, Go to GitHub
Gui, Font, norm, 
Gui, Add, Edit, x252 y20 w0 h0 , 123 ; dummy edit to avoid a mysterious bug

;上方公告
Gui, Font, S8 CDefault bold cRed, Verdana
;按住F12來停止所有運作中的功能。若按住數秒後仍卡死，請使用Ctrl+Alt+Del叫出工作管理員，再手動停止工作。
Gui, Add, Text, x150 y15 w650 h30 , Press and hold F12 to stop all running functions. If it is still stuck after holding it down for a few seconds`, please use Ctrl+Alt+Del to call out the Task Manager`, and then stop the work manually.`n
;以下按鍵設置皆為2560x1080視窗大小下的情況。若你的視窗並非此設定，請使用SHIFT+D查詢，並設定功能中的座標設定值。
Gui, Add, Text, x810 y15 w720 h30 , The following button settings are all based on the 2560x1080 window size. If your window does not have this setting`, please use Shift+D to query and set the coordinate settings in the function.
;運作時可最小化但不可關閉此視窗。
Gui, Add, Text, x1560 y15 w300 h40 , This window can be minimized but cannot be closed during operation


; Quick Flasks

Gui, Font, S8 CDefault bold, Verdana
;XButton2
Gui, Add, GroupBox, x22 y59 w430 h240 , QuickFlask
Gui, Add, Text, x42 y99 w230 h20 , XButton2 (Mouse front side button)

Gui, Font, S8 CDefault norm, Verdana
Gui, Add, Text, x50 y125 w250 h20 , Click to use the flask in the flask list.
Gui, Add, Edit, x285 y120 w140 h20 , %quick_flask_list%

;Ctrl + L
Gui, Font, S8 CDefault bold, Verdana
Gui, Add, Text, x42 y149 w80 h20 , Ctrl + L

Gui, Font, S8 CDefault norm, Verdana
Gui, Add, Text, x142 y149 w100 h20 , to turn on /off
Gui, Add, Text, x62 y169 w360 h30 , When enabled`, changes hotkey actions to keys in the output list.


Gui, Font, S8 CDefault bold, Verdana
Gui, Add, Text, x42 y209 w500 h20 , Two kinds of Hotkey (accept key combination)

;(1)
Gui, Font, S8 CDefault norm, Verdana
;vChosenHotkey的含意是可接受使用者按下的按鍵組合，例如Ctrl+2。此處範例命名為vquickFlasksHotkey0
Gui, Add, Hotkey, vquickFlasksHotkey0 x42 y239 w40 h20 , %quickFlasksHotkey0%
Gui, Add, Text, x100 y239 w180 h20 , to quick use flasks (1)`, list:

Gui, Add, Text, x285 y239 w140 h20 , Same as XButton2

;(2)
;vChosenHotkey的含意是可接受使用者按下的按鍵組合，例如Ctrl+2。此處範例命名為quickFlasksHotkey1
Gui, Add, Hotkey, vquickFlasksHotkey1 x42 y269 w40 h20 , %quickFlasksHotkey1%
Gui, Add, Text, x100 y269 w180 h20 , to quick use flasks (2)`, list:
Gui, Add, Edit, x285 y269 w140 h20 vquick_flask_list_1, %quick_flask_list_1%



;找字用的 紅色底線粗體 但Hotkey內不會顯示顏色
Gui, Font, cRed underline bold, Verdana
Gui, Font, S8 CDefault norm, Verdana



;AutoTime
Gui, Font, S8 CDefault bold, Verdana
Gui, Add, GroupBox, x22 y319 w430 h350 , AutoTime
;XButton1
Gui, Add, Text, x42 y339 w230 h20 , XButton1 (Mouse back side button)
Gui, Font, S8 CDefault norm, Verdana
Gui, Add, Edit, x285 y339 w140 h20 , %AutoTime_attack_list%
Gui, Add, Text, x52 y359 w370 h30 , Click, Will hold down the right mouse button and press the keys in the list periodically.


;MButton
Gui, Font, S8 CDefault bold, Verdana
Gui, Add, Text, x42 y399 w230 h20 , MButton (Mouse Wheel)
Gui, Font, S8 CDefault norm, Verdana
Gui, Add, Text, x52 y419 w370 h40 , Click, Will Hold down keep_attack_list and press the keys in the AutoTime_flask_list and AutoTime_attack_list periodically.

Gui, Add, Text, x130 y455 w140 h20 , keep_attack_list
Gui, Add, Edit, x285 y455 w140 h20 , %keep_attack_list%

Gui, Add, Text, x130 y485 w140 h20 , AutoTime_flask_list
Gui, Add, Edit, x285 y485 w140 h20 , %AutoTime_flask_list%

Gui, Add, Text, x130 y515 w140 h20 , AutoTime_attack_list
Gui, Add, Text, x285 y515 w140 h20 , Same as XButton1

Gui, Add, Text, x130 y545 w140 h20 , AutoInterval
Gui, Add, Edit, x285 y545 w60 h20 , %AutoInterval%
Gui, Add, Text, x380 y545 w30 h20 , (ms)

;公告，僅建議使用立即施放類型的技能。不然很可能會無法施放完畢。
Gui, Font, S8 CDefault bold cRed, Verdana
Gui, Add, Text, x52 y575 w370 h40 , Only immediate cast type skills are recommended. Otherwise, it is very likely that the cast will not be completed.

;Quick Enter
Gui, Font, S8 CDefault bold, Verdana
Gui, Add, GroupBox, x482 y59 w440 h250 , Quick Enter
Gui, Add, Text, x500 y90 w80 h20 , F3
Gui, Add, Text, x500 y120 w80 h20 , Ctrl+F3
Gui, Add, Text, x500 y150 w80 h20 , Ctrl+F4
Gui, Add, Text, x500 y180 w80 h20 , F5
Gui, Add, Text, x500 y210 w80 h20 , F6
Gui, Add, Text, x500 y240 w80 h20 , Ctrl+F6
Gui, Add, Text, x502 y269 w80 h20 , Ctrl + ~
Gui, Font, S8 CDefault norm, Verdana
Gui, Add, Edit, x592 y89 w110 h20 vquickEnterText0, %quickEnterText0%
Gui, Add, Edit, x592 y119 w110 h20 vquickEnterText1, %quickEnterText1%
Gui, Add, Edit, x592 y149 w110 h20 vquickEnterText2, %quickEnterText2%
Gui, Add, Edit, x592 y179 w110 h20 vquickEnterText3, %quickEnterText3%
Gui, Add, Edit, x592 y209 w110 h20 vquickEnterText4, %quickEnterText4%
Gui, Add, Edit, x592 y239 w110 h20 vquickEnterText5, %quickEnterText5%
Gui, Add, Edit, x592 y269 w110 h20 vquickEnterText7, %quickEnterText7%

;Misc
Gui, Font, S8 CDefault bold, Verdana
Gui, Add, GroupBox, x482 y319 w440 h590 , Misc
Gui, Add, Text, x492 y349 w80 h20 , Shift + D
Gui, Font, S8 CDefault norm, Verdana
Gui, Add, Text, x592 y349 w250 h20 , get [coordinate, color] on cursor

;F2
Gui, Font, S8 CDefault bold, Verdana
Gui, Add, Text, x492 y379 w80 h20 , F2
Gui, Font, S8 CDefault norm, Verdana
Gui, Add, Text, x592 y379 w300 h30 , Quick moving item from Quick moving item from inventory

Gui, Font, S8 CDefault bold, Verdana
Gui, Add, Text, x512 y469 w390 h20 , The sharp corner of the lower right edge of your inventory
Gui, Add, Text, x512 y409 w380 h20 , The sharp corner of the upper left edge of your inventory

Gui, Font, S8 CDefault norm, Verdana
Gui, Add, Text, x512 y439 w70 h20 , BagFirstX
Gui, Add, Text, x692 y439 w70 h20 , BagFirstY
Gui, Add, Text, x512 y499 w70 h20 , BagLastX
Gui, Add, Text, x692 y499 w70 h20 , BagLastY
Gui, Add, Edit, x592 y439 w90 h20 , %BagFirstX%
Gui, Add, Edit, x772 y439 w90 h20 , %BagFirstY%
Gui, Add, Edit, x592 y499 w90 h20 , %BagLastX%
Gui, Add, Edit, x772 y499 w90 h20 , %BagLastY%

;Shift+F2
Gui, Font, S8 CDefault bold, Verdana
Gui, Add, Text, x492 y539 w80 h20 , Shift+F2

Gui, Font, S8 CDefault norm, Verdana
Gui, Add, Text, x592 y539 w300 h20 , Quick scanning item from trade

Gui, Font, S8 CDefault bold, Verdana
Gui, Add, Text, x512 y569 w370 h20 , The sharp corner of the upper left edge of trade
Gui, Add, Text, x512 y629 w380 h20 , The sharp corner of the lower right edge of trade

Gui, Font, S8 CDefault norm, Verdana
Gui, Add, Text, x512 y599 w70 h20 , tradeFirstX
Gui, Add, Text, x692 y599 w70 h20 , tradeFirstY
Gui, Add, Text, x512 y659 w70 h20 , tradeLastX
Gui, Add, Text, x692 y659 w70 h20 , tradeLastY
Gui, Add, Edit, x592 y599 w90 h20 , %tradeFirstX%
Gui, Add, Edit, x772 y599 w90 h20 , %tradeFirstY%
Gui, Add, Edit, x592 y659 w90 h20 , %tradeLastX%
Gui, Add, Edit, x772 y659 w90 h20 , %tradeLastY%

;F4
Gui, Font, S8 CDefault bold, Verdana
Gui, Add, Text, x492 y699 w80 h20 , F4
Gui, Font, S8 CDefault norm, Verdana
Gui, Add, Text, x592 y699 w300 h50 , After pressing`, use Orb of Scouring and Orb of Alchemy for the item coordinates. The default is item in currency tab.

Gui, Add, Text, x512 y749 w80 h20 , ScouringX
Gui, Add, Text, x772 y749 w80 h20 , ScouringY
Gui, Add, Text, x512 y779 w80 h20 , AlchemyX
Gui, Add, Text, x772 y779 w80 h20 , AlchemyY
Gui, Add, Text, x512 y809 w80 h20 , ItemX
Gui, Add, Text, x772 y809 w80 h20 , ItemY

Gui, Add, Edit, x592 y749 w90 h20 , %ScouringX%
Gui, Add, Edit, x772 y749 w90 h20 , %ScouringY%
Gui, Add, Edit, x592 y779 w90 h20 , %AlchemyX%
Gui, Add, Edit, x772 y779 w90 h20 , %AlchemyY%
Gui, Add, Edit, x592 y809 w90 h20 , %ItemX%
Gui, Add, Edit, x772 y809 w90 h20 , %ItemY%



;Misc2
Gui, Font, S8 CDefault bold, Verdana
Gui, Add, GroupBox, x960 y59 w480 h850 , Misc2


;F9
Gui, Font, S8 CDefault bold, Verdana
Gui, Add, Text, x990 y89 w80 h20 , F9
Gui, Font, S8 CDefault norm, Verdana
Gui, Add, Text, x1082 y89 w290 h40 , For the currency that has been picked up by right-clicking`, such as Orb of Fusing`, continuously click on the item at the cursor coordinates.

;F10
Gui, Font, S8 CDefault bold, Verdana
Gui, Add, Text, x990 y159 w80 h20 , F10

Gui, Font, S8 CDefault norm, Verdana
Gui, Add, Text, x1082 y159 w290 h40 , Click to move objects in the first to fifth columns on the left side of the tab. The default is tab without folders.


Gui, Font, S8 CDefault bold, Verdana
Gui, Add, Text, x1010 y219 w380 h20 , The sharp corner of the upper left edge of tab
Gui, Add, Text, x1010 y279 w380 h30 , The sharp corner at the bottom right edge of the fifth column of the tab

Gui, Font, S8 CDefault norm, Verdana
Gui, Add, Text, x1010 y249 w70 h20 , TabFirstX
Gui, Add, Text, x1200 y249 w70 h20 , TabFirstY
Gui, Add, Text, x1010 y319 w70 h20 , TabLastX
Gui, Add, Text, x1200 y319 w70 h20 , TabLastY
Gui, Add, Edit, x1092 y249 w90 h20 , %TabFirstX%
Gui, Add, Edit, x1282 y249 w90 h20 , %TabFirstY%
Gui, Add, Edit, x1092 y319 w90 h20 , %TabLastX%
Gui, Add, Edit, x1282 y319 w90 h20 , %TabLastY%

;Ctrl+F10
Gui, Font, S8 CDefault bold, Verdana
Gui, Add, Text, x990 y359 w80 h20 , Ctrl+F10

Gui, Font, S8 CDefault norm, Verdana
Gui, Add, Text, x1082 y359 w290 h40 , Click to move objects in the sixth to tenth columns on the left side of the tab. The default is tab without folders.

Gui, Font, S8 CDefault bold, Verdana
Gui, Add, Text, x1010 y409 w360 h30 , The sharp corner of the upper left edge of the sixth column of the tab
Gui, Add, Text, x1010 y479 w360 h30 , The sharp corner at the bottom right edge of the tenth column of the warehouse tab

Gui, Font, S8 CDefault norm, Verdana
Gui, Add, Text, x1010 y449 w90 h20 , Tab2ndFirstX
Gui, Add, Edit, x1112 y449 w70 h20 , %Tab2ndFirstX%
Gui, Add, Text, x1200 y449 w90 h20 , Tab2ndFirstY
Gui, Add, Edit, x1302 y449 w70 h20 , %Tab2ndFirstY%
Gui, Add, Text, x1010 y519 w90 h20 , Tab2ndLastX
Gui, Add, Edit, x1112 y519 w70 h20 , %Tab2ndLastX%
Gui, Add, Text, x1200 y519 w90 h20 , Tab2ndLastY
Gui, Add, Edit, x1302 y519 w70 h20 , %Tab2ndLastY%


;F11
Gui, Font, S8 CDefault bold, Verdana
Gui, Add, Text, x990 y559 w80 h20 , F11
Gui, Font, S8 CDefault norm, Verdana
Gui, Add, Text, x1082 y559 w300 h40 , Hold the button and move the mouse cursor to quickly move the object the cursor passes.

;Ctrl+D
Gui, Font, S8 CDefault bold, Verdana
Gui, Add, Text, x990 y609 w80 h20 , Ctrl+D

Gui, Font, S8 CDefault norm, Verdana
Gui, Add, Text, x1082 y609 w300 h30 , Turn on/off automatic detonate mines.

Gui, Font, S8 CDefault bold, Verdana
Gui, Add, Text, x1010 y639 w110 h30 , RButton (mouse Right-click)

Gui, Font, S8 CDefault norm, Verdana
Gui, Add, Text, x1132 y639 w300 h30 , When automation detonate mines is turned on, use right-click skills and detonate mines.
Gui, Add, Text, x1132 y679 w130 h20 , mine_laying_time
Gui, Add, Edit, x1262 y679 w70 h20 , %mine_laying_time%
Gui, Add, Text, x1352 y679 w30 h20 , (ms)

;Deprecated
Gui, Font, S8 CDefault bold, Verdana
Gui, Add, GroupBox, x1462 y59 w430 h350 , Deprecated

;Shift+V
Gui, Font, S8 CDefault bold, Verdana
Gui, Add, Text, x1482 y89 w80 h20 , Shift+V

Gui, Font, S8 CDefault norm, Verdana
Gui, Add, Text, x1572 y89 w300 h50 , Broadcast in multiple trading channels in turn. When using it`, the input method needs to be in uppercase English. But it is of little use in international servers.
Gui, Add, Edit, x1482 y149 w400 h50 , %Announce%

;Ctrl+PageUp
Gui, Font, S8 CDefault bold, Verdana
Gui, Add, Text, x1482 y219 w80 h20 , Ctrl+PageUp
Gui, Font, S8 CDefault norm, Verdana
Gui, Add, Text, x1582 y219 w290 h80 , Click to check the price on the official website. But Awakened PoE Trade (international server) or rchin-poe-trade (hotcool) are more useful`, so this one has been abandoned.

Gui, Font, S8 CDefault bold strike, Verdana
Gui, Add, Text, x1482 y289 w90 h30 , Ctrl+F (Deprecated)
Gui, Add, Text, x1582 y289 w280 h30 , to open inventory and use portal scroll (Deprecated)
Gui, Font, S8 CDefault norm strike, Verdana
;Gui, Add, Text, x1602 y359 w120 h20 , Portal Scroll X
;Gui, Add, Edit, x1732 y359 w140 h20 , %portalX%
;Gui, Add, Text, x1602 y389 w140 h20 , Portal Scroll Y
;Gui, Add, Edit, x1732 y389 w140 h20 , %portalY%

Gui, Font, S8 CDefault norm, Verdana
Gui, Add, Text, x1482 y329 w350 h20 , This function has been built into the game after 3.24



;AutoFlask
Gui, Font, S8 CDefault bold, Verdana
Gui, Add, GroupBox, x1462 y529 w430 h170 , AutoFlask
Gui, Font, S8 CDefault norm, Verdana
Gui, Add, Text, x1482 y549 w380 h50 , Detect the color of the specified coordinates. If it is not the specified color, use Flask. But there will be errors when the light is different. So it's not very useful.
Gui, Add, Text, x1492 y599 w380 h20 , Point to blood line you want to auto-flasks, and press:
Gui, Font, S8 CDefault bold, Verdana
Gui, Add, Text, x1492 y629 w100 h20 , Ctrl + Shift + F
Gui, Font, S8 CDefault norm, Verdana
Gui, Add, Text, x1592 y629 w250 h20 , to set coordinates and color to detect
Gui, Font, S8 CDefault bold, Verdana
Gui, Add, Text, x1482 y659 w100 h20 , Ctrl + Shift + L
Gui, Font, S8 CDefault norm, Verdana
Gui, Add, Text, x1592 y659 w150 h20 , to turn on /off`, list:
Gui, Add, Edit, x1725 y659 w140 h20 vlow_life_flask_list, %low_life_flask_list%
 
;Loot
Gui, Font, S8 CDefault bold, Verdana
Gui, Add, GroupBox, x1462 y709 w430 h150 , Loot
Gui, Font, S8 CDefault norm, Verdana
Gui, Add, Text, x1482 y729 w380 h40 , Requires an item filter of specified color. But the pickup speed cannot be too fast`, so it is not very useful.
Gui, Add, Text, x1482 y779 w100 h20 , loot color:
Gui, Add, Edit, x1555 y779 w100 h20 vlootColor, %lootColor%

Gui, Font, S8 CDefault bold, Verdana
Gui, Add, Text, x1482 y809 w80 h20 , Ctrl + A
Gui, Font, S8 CDefault norm, Verdana
Gui, Add, Text, x1555 y809 w180 h20 , Hold to keep looting. delay:
Gui, Add, Edit, x1750 y809 w60 h20 , %loot_dalay%
Gui, Add, Text, x1820 y809 w30 h20 , (ms)



;公告，按下此按鈕儲存，或此視窗關閉後儲存並離開。
Gui, Font, S8 CDefault bold cRed, Verdana
Gui, Add, Text, x1500 y890 w240 h40 , Click this button to save, or close this window to save and exit

;按鈕
Gui, Font, S8 CDefault norm, Verdana
Gui, Add, Button, x1760 y890 w90 h40 , Apply change


;程式名稱
Gui, Show, x19 y314 h962 w1922, POE_Utilitybundles
Return

GuiClose:
SaveSettings()
ExitApp


GoToWebsite:
Run https://github.com/bamd5alifes7/POE_Utilitybundles
return

}

;以下函數供gui中使用

;ButtonApplyChange()函數名稱可被Apply change為名的Button所辨識，並在按下按鈕後呼叫執行。
ButtonApplyChange(){
    TurnOffAllHotkey()
	;意思是儲存變數並持續顯示gui視窗
    Gui, Submit, NoHide
    TurnOnAllHotkey()
    MsgBox , 0, , Change applied, 1
}

TurnOffAllHotkey(){
    TurnOffHotkey(quickFlasksHotkey0)
    TurnOffHotkey(quickFlasksHotkey1)
}

TurnOnAllHotkey(){
    TurnOnHotkey(quickFlasksHotkey0, "QuickFlaskLabel0")
    TurnOnHotkey(quickFlasksHotkey1, "QuickFlaskLabel1")
}

TurnOffHotkey(key){
    if %key%{
        Hotkey, %key%, Off
    }
    return
}

TurnOnHotkey(key, label){
    if key{
        Hotkey, %key%, %label%, On
    }
    else{
        ;Msgbox, %key%
    }
    return
}