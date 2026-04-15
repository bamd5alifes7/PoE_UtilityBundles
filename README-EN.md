[中文說明](https://github.com/bamd5alifes7/PoE_UtilityBundles/blob/master/README.md)

# PoE_UtilityBundles

Special thanks to the original creator of [POE_Utility](https://github.com/heyfey/POE_Utility).  
PoE_UtilityBundles is an AutoHotkey-based utility collection for Path of Exile, focused on quick chat input, flask actions, stash movement, coordinate tools, and other convenience automation.

## Warning

Many features in this project are clearly automation-related and may violate Path of Exile rules.  
Use this project at your own risk.

## Usage

### Run the executable

1. Download `PoE_UtilityBundles.exe` from Releases.
2. Double-click it to start.

If Windows Defender SmartScreen blocks the executable, choose "More info" and then "Run anyway".

### Run from source

1. Install [AutoHotkey v2](https://www.autohotkey.com/).
2. Download the project source.
3. Open the [`src`] folder.
4. Run [`PoE_UtilityBundles.ahk`].

## Close and Save Behavior

- `Apply change`: immediately applies GUI values, re-registers hotkeys, and writes them to `settings.ini`.
- Clicking the `X` button:
  - closes immediately when there are no unsaved changes
  - shows a confirmation dialog when there are unsaved changes
  - `Yes` saves and exits
  - `No` exits without saving
  - `Cancel` keeps the GUI open
- You can also close the app from the tray icon.

## UI Example

![UI](https://github.com/bamd5alifes7/PoE_UtilityBundles/blob/master/demo/%E4%BB%8B%E9%9D%A2.png)

## Recommended Setup First

- Default coordinates assume a `2560x1080` window size.
- If your window size is different, use `Shift + D` first to inspect cursor coordinates and pixel colors.
- It is recommended to set these first:
  - inventory top-left / bottom-right
  - trade window top-left / bottom-right
  - stash ranges
  - crafting and target coordinates

## Main Features

- `XButton2`: quick flask
- `Ctrl+L`: toggle quick flask remap mode
- `XButton1`: hold right-click and cast skills on a timer
- `MButton`: timed cycle actions
- `F3` / `Ctrl+F3` / `Ctrl+F4` / `F5` / `F6` / `Ctrl+F6`: quick chat input
- `Ctrl+\`: return to character selection
- `Shift+D`: inspect cursor position and pixel color
- `F7`: save the current cursor coordinate into a selected slot
- `F2`: move inventory items quickly
- `Shift+F2`: scan trade window slots
- `F4`: scour + alchemy
- `F9`: repeated clicking on cursor target
- `F10` / `Ctrl+F10` / `Shift+F10`: move stash column ranges
- `F11`: move items while dragging across them
- `Ctrl+F7`: chance/scour loop for unique target items
- `Ctrl+F8`: open stacked decks
- `Ctrl+Shift+F8`: move divination cards into trade
- `Ctrl+D`: toggle auto mine detonation
- `Shift+V`: multi-channel broadcast
- `Ctrl+Shift+F`: set auto-flask probe coordinate and color
- `Ctrl+Shift+L`: toggle auto-flask
- `Ctrl+A`: auto loot

## Deprecated or Low-Priority Features

- `Ctrl+PageUp`: old SearchItem flow, now removed
- legacy portal-scroll-related automation
- some pixel-color-based features may still be sensitive to lighting, resolution, or UI state

## Advanced Tweaks

- Most hotkeys, coordinates, and broadcast text can be changed from the GUI.
- For deeper changes, see:
  - [`src/functions_int.ahk`]
  - [`src/gui.ahk`]
  - [`src/rw_settings.ahk`]
