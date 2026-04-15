[English guide](https://github.com/bamd5alifes7/PoE_UtilityBundles/blob/master/README-EN.md)

# PoE_UtilityBundles

特別感謝原作者 [POE_Utility](https://github.com/heyfey/POE_Utility)。

PoE_UtilityBundles 是一套以 AutoHotkey v2 撰寫、給 Path of Exile 使用的工具集合，主打可自訂熱鍵、座標式搬運、快速聊天輸入、倉庫搬移、工藝輔助，以及一些便利型自動化功能。

## 警告

本專案包含多項自動化功能，可能違反 Path of Exile 的遊戲規範。
請自行評估風險並自負使用責任。

## 使用方式

### 直接執行執行檔

1. 到 Releases 下載 `PoE_UtilityBundles.exe`
2. 直接雙擊執行

若 Windows Defender SmartScreen 擋下執行檔，請點選「其他資訊」後再選擇「仍要執行」。

### 以原始碼執行

1. 安裝 [AutoHotkey v2](https://www.autohotkey.com/)
2. 下載本專案原始碼
3. 開啟 `src` 資料夾
4. 執行 `PoE_UtilityBundles.ahk`

程式啟動時會自動要求系統管理員權限。

## 首次設定建議

- 預設座標以 `2560x1080` 遊戲視窗為基準
- 若你的解析度或 UI 配置不同，請用 `F7` 開啟座標儲存工具，把目前游標位置存到指定欄位
- 或者使用 `Shift + D` 讀取游標座標與顏色，再於 UI 中設定
- 建議優先設定：
  - 背包左上 / 右下
  - 交易窗左上 / 右下
  - 倉庫 1-5 左上 / 右下
  - 倉庫 6-10 左上 / 右下
  - 倉庫 11-12 左上 / 右下
  - Stacked Deck、各種通貨、工藝目標物座標

## 操作與安全說明

- 大部分功能都可以用 `F12` 立即中止
- 使用中可以最小化 GUI，但關閉 GUI 就會結束程式
- `Apply change` 會立即套用 GUI 內容、重綁熱鍵並寫回 `settings.ini`
- 熱鍵欄位留白就代表停用該功能
- 關閉 GUI 時若有未儲存內容，會跳出儲存 / 不儲存 / 取消的確認視窗
- 也可以從系統匣圖示結束程式

## 主要功能

### 藥劑 / 戰鬥

- `XButton2`：一鍵快速喝水
- `Ctrl+L`：切換快速喝水重映射模式
- 預設 `Ctrl+2` / `Ctrl+3`：在重映射模式開啟時，觸發額外的喝水組合
- `XButton1`：按住右鍵並定時施放設定好的技能序列
- `MButton`：啟動定時藥劑 / 攻擊循環
- `Ctrl+Shift+F`：重新取樣自動喝水要用的血量座標與顏色
- `Ctrl+Shift+L`：開啟 / 關閉自動喝水
- `Ctrl+D`：開啟 / 關閉自動引爆地雷
- `RButton`：自動引爆地雷啟用時使用的觸發鍵

### 快速輸入 / 移動

- `F3` / `Ctrl+F3` / `Ctrl+F4` / `F5` / `F6` / `Ctrl+F6`：送出可自訂的聊天文字
- `Ctrl+\``：快速送出 `/exit` 或其他自訂移動指令
- `Shift+V`：依序切換多個交易頻道並廣播設定文字

### 座標 / 偵測

- `Shift+D`：讀取目前游標的座標與 RGB 顏色
- `F7`：開啟座標儲存視窗，將目前游標位置存進指定功能欄位

### 背包 / 交易 / 工藝

- `F2`：對整個背包格子做 Ctrl+點擊搬運
- `Shift+F2`：依序掃過交易窗格子，方便快速清點
- `F4`：對指定目標做重鑄石 + 點金石
- `F9`：對目前游標目標連續點擊，直到按下 `F12`
- `Ctrl+F7`：對指定背包格重複使用重鑄石 + 機會石，直到變成傳奇
- `Ctrl+F8`：開啟 Stacked Deck，丟到背包第一格後再 Ctrl 點回去
- `Ctrl+Shift+F8`：把背包中的命運卡依序投入交易窗
- `Ctrl+A`：依顏色搜尋並自動撿拾，建議搭配 `itemfilter/` 內的濾鏡使用

### 倉庫 / 搬運

- `F10`：搬移倉庫第 1-5 欄
- `Ctrl+F10`：搬移倉庫第 6-10 欄
- `Shift+F10`：搬移倉庫第 11-12 欄
- `F11`：按住時沿著滑鼠路徑持續 Ctrl+點擊搬物

## 已廢止或低優先功能

- `Ctrl+PageUp`：舊版 SearchItem，已移除
- 傳送卷軸相關舊功能：PoE 後續版本已有內建替代機制
- 自動喝水功能目前不實用而停止維護：因其使用的像素判色機制，會受地圖光線、UI 狀態與解析度影響

## GUI 分頁說明

目前 GUI 主要分成以下幾頁：

- `Home`：熱鍵總覽與快速調整
- `Flask / Timer`：喝水列表、攻擊序列與定時器設定
- `Quick Enter`：聊天 / 移動指令文字內容
- `Coords / Core`：背包、交易、工藝目標與自動喝水座標
- `Coords / Stash`：倉庫範圍與搬運延遲設定
- `More`：廣播內容、自動喝水列表、地雷延遲與撿拾顏色

## Item Filter 補充

(目前停止維護)
`itemfilter/` 內附多種 quick-loot 用 NeverSink 濾鏡版本，並附有 `convert_filter.py`。
這些檔案主要是給 `Ctrl+A` 的快速撿拾功能搭配特定顏色使用。

## 進階調整

若你想直接改邏輯而不只透過 GUI，可以從這幾個檔案開始看：

- `src/functions_int.ahk`：功能主邏輯與迴圈動作
- `src/gui.ahk`：GUI 配置與套用 / 儲存流程
- `src/rw_settings.ahk`：預設值與 `settings.ini` 的讀寫行為

## 介面示意

![介面](https://github.com/bamd5alifes7/PoE_UtilityBundles/blob/master/demo/%E4%BB%8B%E9%9D%A2.png)
