[English guide](https://github.com/bamd5alifes7/PoE_UtilityBundles/blob/master/README-EN.md)

# PoE_UtilityBundles

首先感謝原作者 [heyfey 的 POE_Utility](https://github.com/heyfey/POE_Utility/)。  
PoE_UtilityBundles 是基於原作延伸整理的 AutoHotkey 工具，主要整合 PoE 常用的快捷輸入、藥劑、搬倉、座標輔助與部分自動化操作。

## 警告

本專案中的許多功能明顯涉及遊戲自動化。  
請自行判斷風險，並自行承擔使用後果。

## 使用方式

### 直接執行

1. 到 Releases 下載 `PoE_UtilityBundles.exe`。
2. 直接雙擊執行。

如果 Windows Defender SmartScreen 擋下執行，請選擇「更多資訊」後再按「仍要執行」。

### 從原始碼執行

1. 安裝 [AutoHotkey v2](https://www.autohotkey.com/)。
2. 下載專案原始碼。
3. 進入 [`src`]，使用 Notepad++ 之類的文字編輯器閱讀程式碼，讀到你覺得可安心使用。(恐懼是來自於未知)
4. 執行 [`PoE_UtilityBundles.ahk`]。

## 關閉與儲存行為

- 按 `Apply change`：立即套用 GUI 內容、重新註冊熱鍵並寫入 `settings.ini`。
- 按右上角 `X`：
  - 若沒有未儲存變更，直接關閉。
  - 若有未儲存變更，會跳出確認視窗：
    - `Yes`：儲存後關閉
    - `No`：不儲存直接關閉
    - `Cancel`：回到 GUI 繼續編輯
- 也可以從系統匣的 AHK 圖示手動關閉程式。

## 介面範例

![介面](https://github.com/bamd5alifes7/PoE_UtilityBundles/blob/master/demo/%E4%BB%8B%E9%9D%A2.png)

## 使用前建議

- 預設座標以 `2560x1080` 視窗大小為基準。
- 若你的視窗大小不同，請先用 `Shift + D` 查看顏色與座標，再到 GUI 中調整。
- 建議先完成這幾組設定：
  - 背包左上 / 右下
  - 交易欄左上 / 右下
  - 倉庫欄位範圍
  - 常用通貨與目標物座標

## 主要功能

- `XButton2`：快速喝藥
- `Ctrl+L`：切換一鍵喝藥模式
- `XButton1`：按住右鍵並定時施放技能
- `MButton`：定時循環動作
- `F3` / `Ctrl+F3` / `Ctrl+F4` / `F5` / `F6` / `Ctrl+F6`：快速輸入
- `Ctrl+\`：回到選角
- `Shift+D`：查看游標位置與像素顏色
- `F7`：將目前游標座標存到指定欄位
- `F2`：快速搬背包
- `Shift+F2`：快速掃描交易欄
- `F4`：重鑄石 + 點金石
- `F9`：對游標位置連點
- `F10` / `Ctrl+F10` / `Shift+F10`：快速搬倉欄位
- `F11`：滑鼠經過即快速搬移
- `Ctrl+F7`：機會石洗傳奇
- `Ctrl+F8`：開命運卡
- `Ctrl+Shift+F8`：投入交易欄
- `Ctrl+D`：切換自動引爆地雷
- `Shift+V`：多頻道廣播
- `Ctrl+Shift+F`：設定自動喝水偵測座標與顏色
- `Ctrl+Shift+L`：切換自動喝水
- `Ctrl+A`：自動撿拾

## 已廢止或低優先功能

- `Ctrl+PageUp`：舊版 SearchItem，已移除
- 傳送卷軸相關舊功能：PoE 後續版本已有內建替代機制
- 部分像素判色功能會受地圖光線、UI 狀態與解析度影響，請自行評估是否保留

## 進階調整

- 熱鍵、座標、廣播內容與多數設定可直接在 GUI 中調整。
- 更細的行為可修改：
  - [`src/functions_int.ahk`]
  - [`src/gui.ahk`]
  - [`src/rw_settings.ahk`]
