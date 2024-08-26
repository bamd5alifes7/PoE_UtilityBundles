
[English guide](https://github.com/bamd5alifes7/POE_UtilityBundles/blob/master/README-EN.md)

首先，感謝原作者。[heyfey的原作POE_Utility](https://github.com/heyfey/POE_Utility/)

POE_UtilityBundles是基於此之上的分支。


**POE_UtilityBundles**
是一份AHK腳本，提供POE的快捷鍵包括：**一鍵喝水、定時喝水、切換頻道、移動物品、點鏈結石、自動引爆地雷、自動喝水、自動撿裝**，等等

並且根據實際需求，持續擴充當中


## 免責聲明 

此腳本的許多功能**絕對違反**遊戲規章，使用此程式者請自行承擔所有可能後果和風險>>>[可以參考這裡](https://www.ptt.cc/bbs/PathofExile/M.1536799446.A.BB1.html)

> (原作者說他還沒被封，而我也未曾因這個理由被封。) (原因是本腳本不會讀取/修改記憶體內容。僅模擬鍵鼠動作的話，一是官方願意容許。二是較難偵測。)

---

* [Demo](#Demo)
* [如何使用](#如何使用)
* [介面](#介面)
* [設定](#設定)

---

## Demo 

(請點進去看展示，以及如何設定。)
(此處使用原作者的展示，實際使用大致相同。)

### [自動撿裝](https://i.imgur.com/2PIWJTh.gifv)

### [偵測血線(或魔力)自動喝水](https://i.imgur.com/8lDp650.gifv)

### [一鍵喝水](https://i.imgur.com/GDZHEh4.gifv)

## 如何使用

直接使用：

1. 下載。
   (1)點選此頁面上方的'Clone`按鈕再點選'Download ZIP'。
   (2)點選此頁面右中Releases下的超連結。再點選POE_UtilityBundles.exe或Source code(zip)。

2. 右鍵點選`POE_UtilityBundles.exe`並以系統管理員身分執行，閱讀或跳過簡介後就可開始使用，無須關閉Gui畫面。

P.S.如果你是第一次使用，而跳出Windows Defender SmartScreen無法辨識的通知，請點選「其他資訊」後，「仍要執行」來運行此程式。


或者以原始碼方式執行：

1. 下載並安裝[AutoHotKey](https://www.autohotkey.com/)。如果會閃退或沒反應，試試看版本號 `AutoHotkey_1.1.34.02`

2. 下載。
   (1)點選此頁面上方的'Clone`按鈕再點選'Download ZIP'。
   (2)點選此頁面右中Releases下的超連結。再點選Source code(zip)。

~~3. 用Notepad++之類的開發工具打開源代碼，讀到爽。~~
   
4. 右鍵點選 `POE_UtilityBundles.ahk`並以系統管理員身分執行，


## 如何關閉


1.在Gui介面中，點選右上角的X符號。就關閉了POE_UtilityBundles。

2.或可在右下狀態列中找到POE_UtilityBundles的綠底白字的H字圖樣，手動關閉。

## 介面 
![image](https://github.com/bamd5alifes7/POE_UtilityBundles/blob/master/demo/%E4%BB%8B%E9%9D%A2.png)


## 簡介

打開程式，按下確定後即開始使用。

按住F12來停止所有運作中的功能。若按住數秒後仍卡死，請使用Ctrl+Alt+Del叫出工作管理員，再手動停止工作。

預設按鍵設置皆為2560x1080視窗大小下的情況。若你的視窗並非此設定，請使用SHIFT+D查詢，並設定功能中的座標設定值。

使用中可最小化但不可關閉GUI介面。

[XButton2]前滑鼠側鍵:單下按鍵，使用藥劑列表中的藥劑。

[Ctrl+L]開啟或關閉會啟用熱鍵的一鍵喝水模式。當開啟時，會將按下熱鍵的動作改為輸出列表中的按鍵。

[XButton1]後滑鼠側鍵，會按住右鍵並定時施放列表中的技能。

[MButton]滑鼠滾輪:按下後，開啟定時動作。包含持續攻擊、定時喝水及定時攻擊。預設為四秒一輪。

[F3]快速輸入，預設為韓國世界頻168。

[Ctrl+F3]快速輸入，預設為韓國交易頻615。

[Ctrl+F4]快速輸入，預設為英文世界頻666。

[F5]快速輸入，預設為進入藏身處。

[F6]快速輸入，預設為世界頻5587。

[Ctrl+F6]快速輸入，預設為無。

[Ctrl+~]回到選角介面。

[Shift+D]得到物品顏色及座標位置。

[F2]在開啟背包的情況下，將背包裡的東西一一點選，例如丟進倉庫。

[Shift+F2]迅速清點交易欄

[F4]按下後，針對物品座標使用重鑄石及點金石，預設為通貨倉庫頁中的物品。

[F9]針對右鍵已拾取的通貨例如鏈結石，連續點擊游標座標上的物品，F12為停止鍵。

[F10]單下點擊開始快速移動倉庫左邊第一直欄到第五直欄的物件。預設是無資料夾的倉庫頁。

[Ctrl+F10]單下點擊開始快速移動倉庫左邊第六直欄到第十直欄的物件。預設是無資料夾的倉庫頁。

[F11]按住按鈕後移動滑鼠游標，來快速移動游標經過的物件。。

[Ctrl+D]開啟/關閉自動引爆地雷

[F10]RButton滑鼠右鍵，在開啟自動引爆地雷的情況下，使用右鍵技能及引爆地雷

[Shift+V]在多個交易頻道中廣播，使用時輸入法需切成大寫英文。但在國際服的用處不大。

[Ctrl+PageUp]一鍵查價。但Awakened PoE Trade(國際服)或rchin-poe-trade(hotcool)更好用，已荒廢

[Ctrl+Shift+F]根據滑鼠游標位置，設置自動喝水所需要的血量座標與顏色。

[Ctrl+Shift+L]開啟/關閉自動喝水。偵測指定座標的顏色，若非指定色使用藥劑。但當光線不同時會有誤差。所以用處不大。

[Ctrl+a]持續按壓時時自動撿拾，需搭配指定顏色的物品篩選器。但因拾取速度無法太快，用處不大。



## 設定

###  自動撿裝 quick loot

[demo](https://i.imgur.com/2PIWJTh.gifv)

+ 原理：AHK會在畫面中搜尋並點選指**顏色**的pixel，搭配過濾器來顯示指定的顏色

+ 打開你的過濾器，在想要撿取的物品加上`SetBorderColor 100 0 122 255`就行了

+ 也可以直接使用[我們提供的過濾器](https://github.com/heyfey/POE_Utility/tree/master/itemfilter)(修改自[NeverSink](https://github.com/NeverSinkDev/NeverSink-Filter))，自動撿取：通貨、六洞裝、地圖、預言、化石、鑄新儀、有價命運卡、培育器、高T精隨、油瓶


### 一鍵喝水 quick flask

[demo](https://i.imgur.com/GDZHEh4.gifv) (請點進去看如何設定)

+ 一鍵喝水和自動喝水兩個功能，在不同的角色配置應該要有不同的設定。

+ `list`是想要快速發送的按鍵序列，用`-`做分隔

+ 按鍵可以是藥水也可以是技能。比如`2-3-4-5-q-w-e`：`2345`是功能藥水，`q`是鋼筋鐵骨，`w`是鮮血狂怒，`e`是暗影迷蹤。建議在此功能中只使用**瞬發**的技能，不然可能有點蠢。

+ 在遊戲裡`Ctrl + L`開啟/關閉一鍵喝水


### 自動喝水 auto flask

[demo](https://i.imgur.com/8lDp650.gifv) (請點進去看如何設定)

1.  在`list`設定自動使用的藥水和技能

2. 滑鼠指著想要自動喝水的血線，`Ctrl + Shift + F`確認；建議指著血條時盡量靠右，避免礦坑的特效影響到系統判斷

3. 在遊戲裡`Ctrl + F`開啟/關閉自動喝水


### 進階設定 

進階的AHK使用者，可以在`functions.ahk`中做更細節的調整，也可以看情況增加自己喜歡的功能。


