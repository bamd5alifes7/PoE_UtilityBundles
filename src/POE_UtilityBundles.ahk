#Requires AutoHotkey v2.0
#SingleInstance Force
#MaxThreadsPerHotkey 2
#HotIf WinActive("ahk_exe PathOfExile.exe")

;將執行方式改為系統管理員
RunAsAdmin()
ShowIntroduction()

#Include functions_int.ahk
#Include gui.ahk
#Include rw_settings.ahk


SetDefaultMouseSpeed(0)

;===============================================================================
; Settings:
;數值設定由rw_settings設定於settings.ini文件中，也可手動修改
;===============================================================================

;用以辨識兩種不同類型的定時喝水設定


; 設定要用於自動撿拾功能的篩選器顏色。該功能配合篩選器使用，自動點選畫面中此處設定的色號。(可用Shift + D查詢色號) (單下撿拾自動撿拾很OK。但全自動撿拾速度過慢，頗雞肋)

; 拾取功能的動作間延遲

; 傳送卷軸的座標(可用Shift + D查詢), 預設是在2560x1080視窗大小下背包的最右下角。
; 備註:需要數字個位數字是0，若座標為1549 會導致設置失效，
; 備註2:3.24以後遊戲中已經內建自動開啟傳送卷軸功能，已廢棄。

;設定一鍵快速喝水的按鍵。可包含技能，但盡量選立即施放的，不然忽然原地站樁會有點蠢。
; This is a sequence of keys to send in QuickFlask, use '-' as a delimiter.

;設定一鍵快速喝水的按鍵。可切換的第二組。


;設定定時循環喝水的按鍵。可包含技能，但盡量選立即施放的，不然忽然原地站樁會有點蠢。
; This is a sequence of keys to send in AutoTimeFlask, use '-' as a delimiter.
; In case: "2-3-4-5-q-r"
;     [2, 3, 4, 5]: Utility Flasks 功能藥劑
;     [q]: Phase Run 暗影迷蹤
;     [r]: Blood Rage 鮮血狂怒

; This is a sequence of keys to send in AutoTimeFlask, use '-' as a delimiter.
; In my case: "2-3-4-5-q-r"
;     [2, 3, 4, 5]: Utility Flasks 功能藥劑
;     [q]: Phase Run 暗影迷蹤
;     [r]: Blood Rage 鮮血狂怒

; This is a sequence of keys to send in AutoTimeFlask, use '-' as a delimiter.
; In my case: "2-3-4-5-q-r"
;     [2, 3, 4, 5]: Utility Flasks 功能藥劑
;     [q]: Phase Run 暗影迷蹤
;     [r]: Blood Rage 鮮血狂怒



; Auto flask when low life. 
; 低血量時自動喝水。判斷特定位置的顏色，若非指定色則喝水。當地形光線不同時，判讀會有落差。所以用處不大

;判斷是否開啟循環喝水的設定值，預設為否
auto_flask_active := false
quick_flask_active := false

; Keep detonating mine when holding right button. 
; 定時引爆地雷
; Put your arc mine on right button.
; And also put arc mine on another button, in case 
; that you don't want to detonate immediately.
;判斷是否開啟循環喝水的設定值，預設為否
auto_detonate_active := false

;定時引爆地雷的延遲設定

; Search item integration was removed.

;自動多頻道廣播的內容設定
AnnounceChannel := []
;設置想要廣播的交易頻道 
AnnounceChannel.Push(["3","4","5","6","7","8","9","10","820","821","822","823","1127","7721","2","1"])
;設置廣播內容，使用時遊戲內輸入法需切成英文大寫

;設置廣播內容，以下是定型文，用來複製的。
;global Announce = "賣 托菈技能2億經驗兩台1D 已跑請進"
;global Announce = "五軍 4場16D 怪量均萬 最高10786 86%物免/89%三大抗/可借混抗經驗裝/ C% -3"
;global Announce = "賣 挑戰 毒茸傳說 第四條 五詞已汙染凋落蔓延 1D 秒解請進"

;單下按鍵自動廣播的設定值

;用於QuickBagmoving的背包座標
;BagFirst是指背包欄最左上邊緣的尖角
;The sharp corner of the upper left edge of your inventory 
;BagLast是指背包欄最右下邊緣的尖角
;The sharp corner of the lower right edge of your inventory

;用於Quicktradescanning的背包座標
;tradeFirst是指交易欄最左上邊緣的尖角
;The sharp corner of the upper left edge of trade
;tradeLast是指交易欄最右下邊緣的尖角
;The sharp corner of the lower right edge of trade

;用於QuickScouringAndAlchemy的座標

;用於 Stash 1-5 搬移功能的倉庫頁座標
;TabFirst是指倉庫頁最左上邊緣的尖角
;The sharp corner of the upper left edge of tab
;TabLast是指倉庫頁第五欄最右下邊緣的尖角
;The sharp corner at the bottom right edge of the fifth column of the tab

;用於 Stash 6-10 搬移功能的倉庫頁座標
;Tab2ndFirst是指倉庫頁第六欄最左上邊緣的尖角
;The sharp corner of the upper left edge of the sixth column of the tab
;Tab2ndFirst是指倉庫頁第十欄最右下邊緣的尖角
;The sharp corner at the bottom right edge of the tenth column of the warehouse tab


;===============================================================================


ReadSettings()

TurnOnAllHotkey()

RunGUI()

;===============================================================================

ShowIntroduction(){
    introText := "
    (
    English user can skip this introduction.

    中文按鍵簡介

    按下確定後即開始使用。
    按住 F12 來停止所有運作中的功能。若按住數秒後仍卡死，請使用 Ctrl+Alt+Del 叫出工作管理員，再手動停止工作。
    以下按鍵設置皆為 2560x1080 視窗大小下的情況。若你的視窗並非此設定，請使用 Shift+D 查詢，並設定功能中的座標設定值。
    使用中可最小化但不可關閉 GUI 介面。

    [XButton2] 前滑鼠側鍵：單下按鍵，使用藥劑列表中的藥劑。
    [Ctrl+L] 開啟或關閉會啟用熱鍵的一鍵喝水模式。
    [XButton1] 後滑鼠側鍵：按住右鍵並定時施放列表中的技能。
    [MButton] 滑鼠滾輪：開啟定時動作。包含持續攻擊、定時喝水及定時攻擊。
    [F3] / [Ctrl+F3] / [Ctrl+F4] / [F5] / [F6] / [Ctrl+F6]：快速輸入。
    [Ctrl+`] 回到選角介面。
    [Shift+D] 得到物品顏色及座標位置。
    [F7] 將目前游標座標存到指定欄位。
    [F2] 快速移動背包物品。
    [Shift+F2] 迅速清點交易欄。
    [F4] 針對物品座標使用重鑄石及點金石。
    [F9] 對已拾取在手上的通貨連續點擊游標座標上的物品。
    [F10] / [Ctrl+F10] / [Shift+F10]：快速移動倉庫欄位物件。
    [F11] 按住按鈕後移動滑鼠游標，快速移動游標經過的物件。
    [Ctrl+F7] 對背包指定皮革腰帶自動重鑄 + 機會直到傳奇。
    [Ctrl+F8] 從牌組座標開卡，丟到背包第一格後 Ctrl 點回倉庫。
    [Ctrl+Shift+F8] 將背包中的命運卡依序投入交易欄。
    [Ctrl+D] 開啟 / 關閉自動引爆地雷。
    [Shift+V] 在多個交易頻道中廣播。
    [Ctrl+Shift+F] 設置自動喝水所需要的血量座標與顏色。
    [Ctrl+Shift+L] 開啟 / 關閉自動喝水。
    [Ctrl+A] 持續按壓時自動撿拾，需搭配指定顏色的物品篩選器。

    原作者：heyfey
    修訂者：bamd5alifes7
    )"

    MsgBox(introText)
}

;以下段落不能放在RunGUI()之前，會導致GUI無法顯示
RunQuickFlaskPrimaryHotkey(*) {
    global quick_flask_list
    QuickFlask(quick_flask_list)
}

RunAutoattackHotkey(*) {
    global AutoTime_attack_list
    Autoattack(AutoTime_attack_list)
}

RunAutoTimeFlaskHotkey(*) {
    global AutoTime_flask_list, AutoTime_attack_list, keep_attack_list, AutoInterval
    AutoTimeFlask(AutoTime_flask_list, AutoTime_attack_list, keep_attack_list, AutoInterval)
}

RunQuickEnter0Hotkey(*) {
    global quickEnterText0
    QuickEnter(quickEnterText0)
}

RunQuickEnter1Hotkey(*) {
    global quickEnterText1
    QuickEnter(quickEnterText1)
}

RunQuickEnter2Hotkey(*) {
    global quickEnterText2
    QuickEnter(quickEnterText2)
}

RunQuickEnter3Hotkey(*) {
    global quickEnterText3
    QuickEnter(quickEnterText3)
}

RunQuickEnter4Hotkey(*) {
    global quickEnterText4
    QuickEnter(quickEnterText4)
}

RunQuickEnter5Hotkey(*) {
    global quickEnterText5
    QuickEnter(quickEnterText5)
}

RunQuickEnter7Hotkey(*) {
    global quickEnterText7
    QuickEnter(quickEnterText7)
}

RunQuickBagmovingHotkey(*) {
    global BagFirstX, BagFirstY, BagLastX, BagLastY
    QuickBagmoving(BagFirstX, BagFirstY, BagLastX, BagLastY)
}

RunQuickTradeScanningHotkey(*) {
    global tradeFirstX, tradeFirstY, tradeLastX, tradeLastY
    Quicktradescanning(tradeFirstX, tradeFirstY, tradeLastX, tradeLastY)
}

RunQuickScouringAlchemyHotkey(*) {
    global ScouringX, ScouringY, ItemX, ItemY, AlchemyX, AlchemyY
    QuickScouringAndAlchemy(ScouringX, ScouringY, ItemX, ItemY, AlchemyX, AlchemyY)
}

RunQuickFastGuardHotkey(*) {
    global stash1To5TopLeftX, stash1To5TopLeftY, stash1To5BottomRightX, stash1To5BottomRightY
    MoveStashColumns1To5(stash1To5TopLeftX, stash1To5TopLeftY, stash1To5BottomRightX, stash1To5BottomRightY)
}

RunQuickFast2ndGuardHotkey(*) {
    global stash6To10TopLeftX, stash6To10TopLeftY, stash6To10BottomRightX, stash6To10BottomRightY
    MoveStashColumns6To10(stash6To10TopLeftX, stash6To10TopLeftY, stash6To10BottomRightX, stash6To10BottomRightY)
}

RunQuickFast3rdGuardHotkey(*) {
    global stash11To12TopLeftX, stash11To12TopLeftY, stash11To12BottomRightX, stash11To12BottomRightY
    MoveStashColumns11To12(stash11To12TopLeftX, stash11To12TopLeftY, stash11To12BottomRightX, stash11To12BottomRightY)
}

RunActivateQuickFlaskHotkey(*) {
    Activate_QuickFlask()
}

RunCheckMousePosHotkey(*) {
    CheckMousePos()
}

RunSaveCoordinatesHotkey(*) {
    SaveCoordinatesTool()
}

RunQuickJewellerFusingHotkey(*) {
    QuickJewellerandFusing()
}

RunQuickmovingHotkey(*) {
    Quickmoving()
}

RunQuickChanceToUniqueHotkey(*) {
    QuickChanceToUnique()
}

RunQuickOpenDeckHotkey(*) {
    QuickOpenDeck()
}

RunQuickTradeCardsHotkey(*) {
    QuickTradeCards()
}

RunActivateAutoDetonateHotkey(*) {
    Activate_AutoDetonate()
}

RunAutoDetonateTriggerHotkey(*) {
    AutoDetonate()
}

RunAnnouncementHotkey(*) {
    Announcement()
}

RunSetAutoflaskHotkey(*) {
    Set_Autoflask()
}

RunActivateAutoflaskHotkey(*) {
    Activate_AutoFlask()
}

RunLootAllHotkey(*) {
    LootAll()
}

QuickFlaskLabel0(*) {
    global quick_flask_active, quick_flask_list, quickFlasksHotkey0
    if quick_flask_active {
        QuickFlask(quick_flask_list)
    } else {
        Send(quickFlasksHotkey0)
    }
}

QuickFlaskLabel1(*) {
    global quick_flask_active, quick_flask_list_1, quickFlasksHotkey1
    if quick_flask_active {
        QuickFlask(quick_flask_list_1)
    } else {
        Send(quickFlasksHotkey1)
    }
}

ApplyConfiguredHotkeys(action) {
    global hotkeyQuickFlaskPrimary, hotkeyToggleQuickFlask, hotkeyAutoattack, hotkeyAutoTimeFlask
    global hotkeyQuickEnter0, hotkeyQuickEnter1, hotkeyQuickEnter2, hotkeyQuickEnter3, hotkeyQuickEnter4, hotkeyQuickEnter5, hotkeyQuickEnter7
    global hotkeyCheckMousePos, hotkeySaveCoordinates, hotkeyQuickBagmoving, hotkeyQuickTradeScanning
    global hotkeyQuickScouringAlchemy, hotkeyQuickJewellerFusing, hotkeyQuickFastGuard, hotkeyQuickFast2ndGuard, hotkeyQuickFast3rdGuard
    global hotkeyQuickmoving, hotkeyQuickChanceToUnique, hotkeyQuickOpenDeck, hotkeyQuickTradeCards
    global hotkeyActivateAutoDetonate, hotkeyAutoDetonateTrigger, hotkeyAnnouncement
    global hotkeySetAutoflask, hotkeyActivateAutoflask, hotkeyLootAll
    global quickFlasksHotkey0, quickFlasksHotkey1

    ApplyHotkeyAction(hotkeyQuickFlaskPrimary, RunQuickFlaskPrimaryHotkey, action)
    ApplyHotkeyAction(hotkeyToggleQuickFlask, RunActivateQuickFlaskHotkey, action)
    ApplyHotkeyAction(hotkeyAutoattack, RunAutoattackHotkey, action)
    ApplyHotkeyAction(hotkeyAutoTimeFlask, RunAutoTimeFlaskHotkey, action)
    ApplyHotkeyAction(hotkeyQuickEnter0, RunQuickEnter0Hotkey, action)
    ApplyHotkeyAction(hotkeyQuickEnter1, RunQuickEnter1Hotkey, action)
    ApplyHotkeyAction(hotkeyQuickEnter2, RunQuickEnter2Hotkey, action)
    ApplyHotkeyAction(hotkeyQuickEnter3, RunQuickEnter3Hotkey, action)
    ApplyHotkeyAction(hotkeyQuickEnter4, RunQuickEnter4Hotkey, action)
    ApplyHotkeyAction(hotkeyQuickEnter5, RunQuickEnter5Hotkey, action)
    ApplyHotkeyAction(hotkeyQuickEnter7, RunQuickEnter7Hotkey, action)
    ApplyHotkeyAction(hotkeyCheckMousePos, RunCheckMousePosHotkey, action)
    ApplyHotkeyAction(hotkeySaveCoordinates, RunSaveCoordinatesHotkey, action)
    ApplyHotkeyAction(hotkeyQuickBagmoving, RunQuickBagmovingHotkey, action)
    ApplyHotkeyAction(hotkeyQuickTradeScanning, RunQuickTradeScanningHotkey, action)
    ApplyHotkeyAction(hotkeyQuickScouringAlchemy, RunQuickScouringAlchemyHotkey, action)
    ApplyHotkeyAction(hotkeyQuickJewellerFusing, RunQuickJewellerFusingHotkey, action)
    ApplyHotkeyAction(hotkeyQuickFastGuard, RunQuickFastGuardHotkey, action)
    ApplyHotkeyAction(hotkeyQuickFast2ndGuard, RunQuickFast2ndGuardHotkey, action)
    ApplyHotkeyAction(hotkeyQuickFast3rdGuard, RunQuickFast3rdGuardHotkey, action)
    ApplyHotkeyAction(hotkeyQuickmoving, RunQuickmovingHotkey, action)
    ApplyHotkeyAction(hotkeyQuickChanceToUnique, RunQuickChanceToUniqueHotkey, action)
    ApplyHotkeyAction(hotkeyQuickOpenDeck, RunQuickOpenDeckHotkey, action)
    ApplyHotkeyAction(hotkeyQuickTradeCards, RunQuickTradeCardsHotkey, action)
    ApplyHotkeyAction(hotkeyActivateAutoDetonate, RunActivateAutoDetonateHotkey, action)
    ApplyHotkeyAction(hotkeyAutoDetonateTrigger, RunAutoDetonateTriggerHotkey, action)
    ApplyHotkeyAction(hotkeyAnnouncement, RunAnnouncementHotkey, action)
    ApplyHotkeyAction(hotkeySetAutoflask, RunSetAutoflaskHotkey, action)
    ApplyHotkeyAction(hotkeyActivateAutoflask, RunActivateAutoflaskHotkey, action)
    ApplyHotkeyAction(hotkeyLootAll, RunLootAllHotkey, action)
    ApplyHotkeyAction(quickFlasksHotkey0, QuickFlaskLabel0, action)
    ApplyHotkeyAction(quickFlasksHotkey1, QuickFlaskLabel1, action)
}

ApplyHotkeyAction(key, handler, action) {
    key := Trim(key)
    if !key
        return
    try Hotkey(key, handler, action)
}


;===============================================================================
;廢棄功能
;===============================================================================
	
;~F10::QuickGuadmoving()                    ; F10:Quick moving item from Guad tab 1~5 level to bag,F12 to end. 快速從倉庫1至5層移動物品至背包。F12為停止鍵。 (因熱鍵不足，暫時停用)
;~^F10::Quick2ndGuadmoving()                ; Ctrl+F10:Quick moving item from Guad tab 6~10 level to bag,F12 to end. 快速從倉庫6至10層移動物品至背包。F12為停止鍵。(因熱鍵不足，暫時停用)
/*
~a::                                ; a : Loot one item. a，單下撿拾。需搭配指定顏色的物品篩選器。因自己手撿也沒花多少時間，且會干擾打字，暫時停用。
    if !LootSmallRegion(){
        LootBigRegion()
    }
    return
*/
