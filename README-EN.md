[中文版說明](https://github.com/bamd5alifes7/POE_UtilityBundles/blob/master/README.md)


First, thanks to the original creator, heyfey's POE_Utility. PoE_UtilityBundles is a branch based on this work.


## Overview

**PoE_UtilityBundles** provides shortcuts for PoE such as: **quick-loot**, **quick-flasks**, **auto-flasks**, and **switch channel**, etc. These shorcuts can significantly improve one's gaming experience

Though I simply implement some features I need, any suggestion is welcome.

## *WARNING* 

*User must understand that many features of this script definitely violate PoE user rules.*

---

* [Usage](#Usage)
* [How to Close](#How to Close)
* [Interface Example](#Interface Example)
* [Features](#Features)
* [Advanced Settings](#Advanced Settings)

---

## Usage

Direct Use：

1. Download。
   
   (1)Click the 'Clone' button at the top of this page, then select 'Download ZIP'.
   
   (2)Click the release link on the middle-right of this page, then select POE_UtilityBundles.exe or Source code (zip).

2. Double-click POE_UtilityBundles.exe to start. You may skip the introduction screen.

P.S. If Windows Defender SmartScreen blocks it, click "More info" > "Run anyway" to proceed.

Or, run from source code：

1. Download and install [AutoHotKey](https://www.autohotkey.com/) 。 If it crashes, try version AutoHotkey_1.1.34.02.

2. Download。
   
   (1) Click the 'Clone' button at the top of this page, then select 'Download ZIP'.
   
   (2)點選此頁面右中Releases下的超連結。再點選Source code(zip)。

3. Open the source code in an editor like Notepad++ to review.
   
4. Double-click POE_UtilityBundles.ahk to start. You may skip the introduction screen.


## How to Close


1.In the GUI interface, click the X symbol in the upper right corner to close POE_UtilityBundles.

2.Alternatively, you can find the POE_Utilitybundles AHK icon in the system tray and close it manually.

## Interface Example


![image](https://github.com/bamd5alifes7/POE_UtilityBundles/blob/master/demo/%E4%BB%8B%E9%9D%A2.png)


## Features

Open the program and click OK to start using it.

Press and hold F12 to stop all running functions. If it is still stuck after holding it down for a few seconds, please use Ctrl+Alt+Del to call out the work administrator, and then stop the work manually.

The default button settings are all for the 2560x1080 window size. If your window does not have this setting, please use SHIFT+D to query the coordinate positions and set the coordinate settings in the function.

The GUI interface can be minimized but cannot be closed during use.

[XButton2] Front mouse side button: Click the button once to use the medicine in the medicine list.

[Ctrl+L] Turns on or off the one-click drinking mode that activates the hotkey. When enabled, the action of pressing a hotkey is changed to a keystroke in the output list.

[XButton1] After pressing the side button of the mouse, hold down the right button and cast the skills in the list regularly.

[MButton] Mouse wheel: After pressing, start the timed action. Including continuous attack, timed drinking and timed attack. The default is four seconds per cycle.

[F3] Quick input, the default is Korean world frequency 168.

[Ctrl+F3] Quick input, the default is Korean trading frequency 615.

[Ctrl+F4] Quick input, the default is English world frequency 666.

[F5] Quick input, the default is to enter the hideout.

[F6] Quick input, the default is world frequency 5587.

[Ctrl+F6] Quick input, default is None.

[Ctrl+~] Return to the casting interface.

[Shift+D] Get the color and coordinate position of the item.

[F2] With the backpack open, select the items in the backpack one by one, for example, throw them into the warehouse.

[Shift+F2] Quickly count transaction columns

After pressing [F4], use the Recast Stone and Philosopher's Stone for the item coordinates. The default is the item in the currency warehouse page.

[F9] For the currency that has been picked up by right-clicking, such as link stones, continuously click the item on the cursor coordinates, and F12 is the stop key.

[F10] Single click to start quickly moving objects from the first column to the fifth column on the left side of the warehouse. The default is a warehouse page without folders.

[Ctrl+F10] Click once to start quickly moving objects in the sixth to tenth columns on the left side of the warehouse. The default is a warehouse page without folders.

[F11] Hold down the button and move the mouse cursor to quickly move the object the cursor passes. .

[Ctrl+D] Turn on/off automatic detonation of mines

[F10] Right-click the RButton, and when the automatic detonation of mines is turned on, use the right-click skill and detonate the mines.

[Shift+V] is broadcast in multiple trading channels. When using it, the input method needs to be cut into uppercase English. But it is of little use in international servers.

[Ctrl+PageUp] Check prices with one click. But Awakened PoE Trade (international server) or rchin-poe-trade (hotcool) are more useful and have been abandoned.

[Ctrl+Shift+F] Based on the mouse cursor position, set the blood volume coordinates and color required to automatically drink water.

[Ctrl+Shift+L] Turn on/off automatic drinking water. Detect the color of the specified coordinates. If it is not the specified color, use potion. But there will be errors when the light is different. So it's not very useful.

[Ctrl+a] Continue to press to automatically pick up the item. It needs to be matched with the item filter of the specified color. However, since the pickup speed cannot be too fast, it is of little use.


### advanced settings

Advanced AHK users can make more detailed adjustments in functions_int.ahk, or add their favorite functions depending on the situation.

