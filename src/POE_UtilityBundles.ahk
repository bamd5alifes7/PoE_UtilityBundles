;將執行方式改為系統管理員
RunAsAdmin()
;中文簡介
MsgBox,English user can skip this Chinese introduction, it is not necessary.`r`n`r`n中文按鍵簡介`r`n`r`n按下確定後即開始使用。`r`n按住F12來停止所有運作中的功能。若按住數秒後仍卡死，請使用Ctrl+Alt+Del叫出工作管理員，再手動停止工作。`r`n以下按鍵設置皆為2560x1080視窗大小下的情況。若你的視窗並非此設定，請使用SHIFT+D查詢，並設定功能中的座標設定值。`r`n使用中可最小化但不可關閉GUI介面`r`n`r`n[XButton2]前滑鼠側鍵:單下按鍵，使用藥劑列表中的藥劑。`r`n[Ctrl+L]開啟或關閉會啟用熱鍵的一鍵喝水模式。當開啟時，會將按下熱鍵的動作改為輸出列表中的按鍵。`r`n[XButton1]後滑鼠側鍵，會按住右鍵並定時施放列表中的技能。`r`n[MButton]滑鼠滾輪:按下後，開啟定時動作。包含持續攻擊、定時喝水及定時攻擊。預設為四秒一輪。`r`n[F3]快速輸入，預設為韓國世界頻168。`r`n[Ctrl+F3]快速輸入，預設為韓國交易頻615。`r`n[Ctrl+F4]快速輸入，預設為英文世界頻666。`r`n[F5]快速輸入，預設為進入藏身處。`r`n[F6]快速輸入，預設為世界頻5587。`r`n[Ctrl+F6]快速輸入，預設為無。`r`n[Ctrl+~]回到選角介面。`r`n[Shift+D]得到物品顏色及座標位置。`r`n[F2]在開啟背包的情況下，將背包裡的東西一一點選，例如丟進倉庫。`r`n[Shift+F2]迅速清點交易欄`r`n[F4]按下後，針對物品座標使用重鑄石及點金石，預設為通貨倉庫頁中的物品。`r`n[F9]針對右鍵已拾取的通貨例如鏈結石，連續點擊游標座標上的物品，F12為停止鍵。`r`n[F10]單下點擊開始快速移動倉庫左邊第一直欄到第五直欄的物件。預設是無資料夾的倉庫頁。`r`n[Ctrl+F10]單下點擊開始快速移動倉庫左邊第六直欄到第十直欄的物件。預設是無資料夾的倉庫頁。`r`n[F11]按住按鈕後移動滑鼠游標，來快速移動游標經過的物件。。`r`n[Ctrl+D]開啟/關閉自動引爆地雷`r`n[F10]RButton滑鼠右鍵，在開啟自動引爆地雷的情況下，使用右鍵技能及引爆地雷`r`n[Shift+V]在多個交易頻道中廣播，使用時輸入法需切成大寫英文。但在國際服的用處不大。`r`n[Ctrl+PageUp]一鍵查價。但Awakened PoE Trade(國際服)或rchin-poe-trade(hotcool)更好用，已荒廢`r`n[Ctrl+Shift+F]根據滑鼠游標位置，設置自動喝水所需要的血量座標與顏色。`r`n[Ctrl+Shift+L]開啟/關閉自動喝水。偵測指定座標的顏色，若非指定色使用藥劑。但當光線不同時會有誤差。所以用處不大。`r`n[Ctrl+a]持續按壓時時自動撿拾，需搭配指定顏色的物品篩選器。但因拾取速度無法太快，用處不大。`r`n`r`n原作者：heyfey`r`n修訂者：bamd5alifes7

#Include functions_int.ahk
#include SearchItem.ahk
#Include gui.ahk
#Include rw_settings.ahk

;兼容二代 拔掉只能在poe視窗運行的規則
;#IfWinActive, Path of Exile
#SingleInstance force
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Persistent ; Stay open in background
#MaxThreadsPerHotkey 2

SetDefaultMouseSpeed, 0

;===============================================================================
; Settings:
;數值設定由rw_settings設定於settings.ini文件中，也可手動修改
;===============================================================================

;用以辨識兩種不同類型的定時喝水設定
global quickFlasksHotkey0
global quickFlasksHotkey1


; 設定要用於自動撿拾功能的篩選器顏色。該功能配合篩選器使用，自動點選畫面中此處設定的色號。(可用Shift + D查詢色號) (單下撿拾自動撿拾很OK。但全自動撿拾速度過慢，頗雞肋)
global lootColor ; for SetBorderColor 100 0 122 255

; 拾取功能的動作間延遲
global loot_dalay

; 傳送卷軸的座標(可用Shift + D查詢), 預設是在2560x1080視窗大小下背包的最右下角。
; 備註:需要數字個位數字是0，若座標為1549 會導致設置失效，
; 備註2:3.24以後遊戲中已經內建自動開啟傳送卷軸功能，已廢棄。
global portalX
global portalY

;設定一鍵快速喝水的按鍵。可包含技能，但盡量選立即施放的，不然忽然原地站樁會有點蠢。
; This is a sequence of keys to send in QuickFlask, use '-' as a delimiter.
global quick_flask_list

;設定一鍵快速喝水的按鍵。可切換的第二組。
global quick_flask_list_1


;設定定時循環喝水的按鍵。可包含技能，但盡量選立即施放的，不然忽然原地站樁會有點蠢。
global AutoTime_flask_list
; This is a sequence of keys to send in AutoTimeFlask, use '-' as a delimiter.
; In case: "2-3-4-5-q-r"
;     [2, 3, 4, 5]: Utility Flasks 功能藥劑
;     [q]: Phase Run 暗影迷蹤
;     [r]: Blood Rage 鮮血狂怒

global AutoTime_attack_list
; This is a sequence of keys to send in AutoTimeFlask, use '-' as a delimiter.
; In my case: "2-3-4-5-q-r"
;     [2, 3, 4, 5]: Utility Flasks 功能藥劑
;     [q]: Phase Run 暗影迷蹤
;     [r]: Blood Rage 鮮血狂怒

global keep_attack_list
; This is a sequence of keys to send in AutoTimeFlask, use '-' as a delimiter.
; In my case: "2-3-4-5-q-r"
;     [2, 3, 4, 5]: Utility Flasks 功能藥劑
;     [q]: Phase Run 暗影迷蹤
;     [r]: Blood Rage 鮮血狂怒


global AutoInterval

; Auto flask when low life. 
; 低血量時自動喝水。判斷特定位置的顏色，若非指定色則喝水。當地形光線不同時，判讀會有落差。所以用處不大
global low_life_X
global low_life_Y
global life_color
global low_life_flask_list ; Keys to send when low life, use '-' as a delimiter.

;判斷是否開啟循環喝水的設定值，預設為否
global auto_flask_active = False
global quick_flask_active = False

; Keep detonating mine when holding right button. 
; 定時引爆地雷
; Put your arc mine on right button.
; And also put arc mine on another button, in case 
; that you don't want to detonate immediately.
;判斷是否開啟循環喝水的設定值，預設為否
global auto_detonate_active = False

;定時引爆地雷的延遲設定
global mine_laying_time

; Search item url 
;一鍵查價的網址設定，但Awakened PoE Trade(國際服)或rchin-poe-trade(hotcool)更好用，已荒廢
global url

;自動多頻道廣播的內容設定
global AnnounceChannel := []
;設置想要廣播的交易頻道 
AnnounceChannel.Push(["3","4","5","6","7","8","9","10","820","821","822","823","1127","7721","2","1"])
;設置廣播內容，使用時遊戲內輸入法需切成英文大寫
global Announce

;設置廣播內容，以下是定型文，用來複製的。
;global Announce = "賣 托菈技能2億經驗兩台1D 已跑請進"
;global Announce = "五軍 4場16D 怪量均萬 最高10786 86%物免/89%三大抗/可借混抗經驗裝/ C% -3"
;global Announce = "賣 挑戰 毒茸傳說 第四條 五詞已汙染凋落蔓延 1D 秒解請進"

;單下按鍵自動廣播的設定值
global quickEnterText0
global quickEnterText1
global quickEnterText2
global quickEnterText3
global quickEnterText4
global quickEnterText5
global quickEnterText6
global quickEnterText7

;用於QuickBagmoving的背包座標
;BagFirst是指背包欄最左上邊緣的尖角
;The sharp corner of the upper left edge of your inventory 
global BagFirstX
global BagFirstY
;BagLast是指背包欄最右下邊緣的尖角
;The sharp corner of the lower right edge of your inventory
global BagLastX
global BagLastY

;用於Quicktradescanning的背包座標
;tradeFirst是指交易欄最左上邊緣的尖角
;The sharp corner of the upper left edge of trade
global tradeFirstX
global tradeFirstY
;tradeLast是指交易欄最右下邊緣的尖角
;The sharp corner of the lower right edge of trade
global tradeLastX
global tradeLastY

;用於QuickScouringAndAlchemy的座標
global ScouringX
global ScouringY
global ItemX
global ItemY
global AlchemyX
global AlchemyY

;用於QuickFastGuadmoving的倉庫頁座標
;TabFirst是指倉庫頁最左上邊緣的尖角
;The sharp corner of the upper left edge of tab
global TabFirstX
global TabFirstY
;TabLast是指倉庫頁第五欄最右下邊緣的尖角
;The sharp corner at the bottom right edge of the fifth column of the tab
global TabLastX
global TabLastY

;用於QuickFast2ndGuadmoving的倉庫頁座標
;Tab2ndFirst是指倉庫頁第六欄最左上邊緣的尖角
;The sharp corner of the upper left edge of the sixth column of the tab
global Tab2ndFirstX
global Tab2ndFirstY
;Tab2ndFirst是指倉庫頁第十欄最右下邊緣的尖角
;The sharp corner at the bottom right edge of the tenth column of the warehouse tab
global Tab2ndLastX
global Tab2ndLastY


;===============================================================================


ReadSettings()

;此段落須放置在RunGUI()之前，因TurnOffHotkey會用到
;當按下按鍵quickFlasksHotkey0時，改成執行QuickFlaskLabel0動作，該動作檢查quick_flask_active是否開啟。
;若開啟則執行QuickFlask函數，也就是快速使用quick_flask_list的藥水
;提供兩種不同版本
Hotkey, %quickFlasksHotkey0%, QuickFlaskLabel0
Hotkey, %quickFlasksHotkey1%, QuickFlaskLabel1 

RunGUI()

;===============================================================================

;注意，以下按鍵設置皆為2560x1080視窗大小下的情況。若你的視窗並非此設定，請使用SHIFT+D查詢，並設定功能中的座標設定值。
;The following button settings are all based on the 2560x1080 window size. If your window does not have this setting, please use SHIFT+D to query and set the coordinate settings in the function.

;按住F12來停止所有運作中的功能。若按住數秒後仍卡死，請使用Ctrl+Alt+Del叫出工作管理員，再手動停止工作。
;Press and hold F12 to stop all running functions. If it is still stuck after holding it down for a few seconds, please use Ctrl+Alt+Del to call out the Task Manager, and then stop the work manually.

;同一行如果要有程式又想要有註解，分號後需要有空格鍵，不然會算是文法錯誤。


~XButton2::QuickFlask(quick_flask_list)    
; Mouse front side button: Click to use the flask in the flask list. 
; 前滑鼠側鍵:單下按鍵，使用藥劑列表中的藥劑。

~^l::Activate_QuickFlask()  
; Ctrl+L: When enabled`, changes hotkey actions to keys in the output list.               
; Ctrl+L: 開啟或關閉會啟用熱鍵的一鍵喝水模式。當開啟時，會將按下熱鍵的動作改為輸出列表中的按鍵。

~XButton1::Autoattack(AutoTime_attack_list) 
; Mouse back side button: Click, Will hold down the right mouse button and press the keys in the list periodically.
; 後滑鼠側鍵，會按住右鍵並定時施放列表中的技能。


~MButton::AutoTimeFlask(AutoTime_flask_list, AutoTime_attack_list, keep_attack_list, AutoInterval)  
; MButton:Click, Will Hold down keep_attack_list and press the keys in the AutoTime_flask_list and AutoTime_attack_list periodically.
; 滑鼠滾輪:按下後，開啟定時動作。包含持續攻擊、定時喝水及定時攻擊。預設為四秒一輪。


~F3::QuickEnter(quickEnterText0)           ; F3: 快速輸入，預設為韓國世界頻168。
~^F3::QuickEnter(quickEnterText1)          ; Ctrl+F3: 快速輸入，預設為韓國交易頻615。
~^F4::QuickEnter(quickEnterText2)          ; Ctrl+F4: 快速輸入，預設為英文世界頻666。
~F5::QuickEnter(quickEnterText3)           ; F5: 快速輸入，預設為進入藏身處。
~F6::QuickEnter(quickEnterText4)           ; F6: 快速輸入，預設為世界頻5587。
~^F6::QuickEnter(quickEnterText5)          ; Ctrl+F6: 快速輸入，預設為無。
;F8                                        ; F8: 被系統預設為遊戲截圖。
~^`::QuickEnter(quickEnterText7)           ; Ctrl+~: Exit to char selection. 回到選角介面。

~+d::CheckMousePos()                       ; Shift+D: Get mouse position and color. 得到物品顏色及座標位置。


~F2::QuickBagmoving(BagFirstX,BagFirstY,BagLastX,BagLastY)     
; F2:Quick moving item from Quick moving item from inventory
; F2:在開啟背包的情況下，將背包裡的東西一一點選，例如丟進倉庫。

~+F2::Quicktradescanning(tradeFirstX,tradeFirstY,tradeLastX,tradeLastY)                 
; Shift+F2:Quick scanning item from trade, F12 to end. 
; 迅速清點交易，F12為停止鍵。


~F4::QuickScouringAndAlchemy(ScouringX,ScouringY,ItemX,ItemY,AlchemyX,AlchemyY)
; F4: After pressing, use Orb of Scouring and Orb of Alchemy for the item coordinates. The default is item in currency tab. 
; 按下後，針對物品座標使用重鑄石及點金石，預設為通貨倉庫頁中的物品。

~F9::QuickJewellerandFusing()              
; F9: For the currency that has been picked up by right-clicking, such as Orb of Fusing, continuously click on the item at the cursor coordinates. 
; 針對右鍵已拾取的通貨例如鏈結石，連續點擊游標座標上的物品，F12為停止鍵。

~F10::QuickFastGuadmoving(TabFirstX,TabFirstY,TabLastX,TabLastY)                
; F10: Click to move objects in the first to fifth columns on the left side of the tab. The default is tab without folders. 
; 單下點擊開始快速移動倉庫左邊第一直欄到第五直欄的物件。預設是無資料夾的倉庫頁。


~^F10::QuickFast2ndGuadmoving(Tab2ndFirstX,Tab2ndFirstY,Tab2ndLastX,Tab2ndLastY)            
; Ctrl+F10: Click to move objects in the sixth to tenth columns on the left side of the tab. The default is tab without folders. 
; 單下點擊開始快速移動倉庫左邊第六直欄到第十直欄的物件。預設是無資料夾的倉庫頁。

~F11::Quickmoving()                        
; F11: Hold the button and move the mouse cursor to quickly move the object the cursor passes. 
; 按住按鈕後移動滑鼠游標，來快速移動游標經過的物件。。

~^d::Activate_AutoDetonate()               
; Ctrl+D: Turn on/off automation detonate mines.
; 開啟/關閉自動引爆地雷

~RButton::AutoDetonate()                   
; RButton (mouse Right-click): When automation detonate mines is turned on, use right-click skills and detonate mines.
; 滑鼠右鍵，在開啟自動引爆地雷的情況下，使用右鍵技能及引爆地雷

~+v::Announcement()                        
; Shift+V: Broadcast in multiple trading channels in turn. When using it, the input method needs to be in uppercase English. But it is of little use in international servers.
; 在多個交易頻道中廣播，使用時輸入法需切成大寫英文。但在國際服的用處不大。
; 若用其他使用者身分執行PoE，注意需使用預設輸入法(系統開機時自然顯示的輸入法)，此時若中英文之間無法透過shift來切換，可用ctrl+空白鍵達到切換效果。

~^PgUp::QuickSearchItem()                  
; Ctrl+PageUp: Click to check the price on the official website. But Awakened PoE Trade (international server) or rchin-poe-trade (hotcool) are more useful, so this one has been abandoned. 
;一鍵查價。但Awakened PoE Trade(國際服)或rchin-poe-trade(hotcool)更好用，已荒廢


~^+F::Set_Autoflask()					   
; Ctrl+Shift+F: According to the mouse cursor position, set the blood volume coordinates and color required to Autoflask.
; Ctrl+Shift+F: 根據滑鼠游標位置，設置自動喝水所需要的血量座標與顏色。


~^+l::Activate_AutoFlask()                 
; Ctrl+Shift+L: Switch to use flask automatically.Detect the color of the specified coordinates. If it is not the specified color, use potion. But there will be errors when the light is different. So it's not very useful.
; 開啟/關閉自動喝水。偵測指定座標的顏色，若非指定色使用藥劑。但當光線不同時會有誤差。所以用處不大。

~^a::LootAll()                             
; Ctrl+a: Hold to keep looting. Requires an item filter of specified color. But the pickup speed cannot be too fast, so it is not very useful.
; 持續按壓時時自動撿拾，需搭配指定顏色的物品篩選器。但因拾取速度無法太快，用處不大。




;以下段落不能放在RunGUI()之前，會導致GUI無法顯示
QuickFlaskLabel0:
    if quick_flask_active{
        QuickFlask(quick_flask_list)
    }
    else{
        Send, %quickFlasksHotkey0%
    }
    return

QuickFlaskLabel1:
    if quick_flask_active{
        QuickFlask(quick_flask_list_1)
    }
    else{
        Send, %quickFlasksHotkey1%
    }
    return


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

/*

; 傳送卷軸的座標(可用Shift + D查詢), 預設是在2560x1080視窗大小下背包的最右下角。
; 備註:需要數字個位數字是0，若座標為1549 會導致設置失效，
; 備註2:3.24以後遊戲中已經內建自動開啟傳送卷軸功能，已廢棄。
~^F::OpenPortal()                          ; Ctrl+F: Open bag and use portal scroll. 開啟背包並使用傳送卷軸。

*/