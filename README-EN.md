[中文說明](https://github.com/bamd5alifes7/PoE_UtilityBundles/blob/master/README.md)

# PoE_UtilityBundles

Special thanks to the original creator of [POE_Utility](https://github.com/heyfey/POE_Utility).

PoE_UtilityBundles is an AutoHotkey v2 utility bundle for Path of Exile. It focuses on configurable hotkeys, coordinate-based item movement, quick chat commands, stash transfers, crafting helpers, and several convenience automation tools.

## Warning

Many features in this project are automation-related and may violate Path of Exile rules.
Use this project at your own risk.

## What Is Included

- Hotkeys are configurable from the built-in GUI and saved to `src/settings.ini`.
- Coordinate-driven tools for inventory, trade window, stash ranges, crafting targets, and life-color probing.
- A cursor-position save tool that writes coordinates directly into the correct settings slot.
- Quick chat / travel text presets such as `/hideout` and `/exit`.
- Item filter helpers under `itemfilter/` for the quick-loot feature.

## Usage

### Run the executable

1. Download `PoE_UtilityBundles.exe` from Releases.
2. Double-click it to start.

If Windows Defender SmartScreen blocks the executable, choose "More info" and then "Run anyway".

### Run from source

1. Install [AutoHotkey v2](https://www.autohotkey.com/).
2. Download this repository.
3. Open the `src` folder.
4. Run `PoE_UtilityBundles.ahk`.

The script requests administrator privileges automatically when launched.

## First-Time Setup

- Default coordinates assume a `2560x1080` game window.
- If your layout is different, use `F7` to open the coordinate save tool and store the current cursor position into the correct slot.
- You can also use `Shift + D` to inspect cursor coordinates and pixel colors, then enter them manually in the UI.
- Recommended setup order:
  - bag top-left / bottom-right
  - trade window top-left / bottom-right
  - stash 1-5 top-left / bottom-right
  - stash 6-10 top-left / bottom-right
  - stash 11-12 top-left / bottom-right
  - stacked deck / orb / crafting target coordinates
  - auto-flask life probe coordinate and color

## Safety / Control Notes

- Hold `F12` to stop most looping actions immediately.
- The GUI can be minimized during use, but closing it will exit the app.
- `Apply change` saves the current GUI values, rewrites `settings.ini`, and re-registers hotkeys.
- Leaving a hotkey field blank disables that action.
- Closing the GUI with unsaved changes shows a save / discard / cancel dialog.
- The tray icon can also be used to exit the app.

## Main Features

### Flask / Combat

- `XButton2`: quick flask sequence.
- `Ctrl+L`: toggle quick flask remap mode.
- `Ctrl+2` / `Ctrl+3` by default: alternate quick-flask hotkeys while remap mode is enabled.
- `XButton1`: hold right-click and cast the configured attack sequence on a timer.
- `MButton`: run a timed flask / attack cycle.
- `Ctrl+Shift+F`: sample the current cursor position and pixel color for auto-flask detection.
- `Ctrl+Shift+L`: toggle auto-flask.
- `Ctrl+D`: toggle auto mine detonation.
- `RButton`: mine trigger hook used by the detonation feature while it is enabled.

### Quick Enter / Travel

- `F3` / `Ctrl+F3` / `Ctrl+F4` / `F5` / `F6` / `Ctrl+F6`: send configurable chat text.
- `Ctrl+```: quick `/exit` or any custom escape / travel text.
- `Shift+V`: multi-channel trade broadcast using the configured message.

### Coordinates / Detection

- `Shift+D`: inspect cursor position and RGB pixel color.
- `F7`: open the coordinate save picker and store the current cursor position into a chosen slot.

### Inventory / Trade / Crafting

- `F2`: move inventory items across the full bag grid with Ctrl-click.
- `Shift+F2`: scan trade-window slots by moving the cursor over them.
- `F4`: apply scour + alchemy to the configured target item.
- `F9`: repeatedly click the current cursor target until `F12` is pressed.
- `Ctrl+F7`: spam scour + chance on configured bag slots until the item becomes unique.
- `Ctrl+F8`: open stacked decks into the first bag slot, then Ctrl-click them back.
- `Ctrl+Shift+F8`: move divination cards from the inventory grid into trade.
- `Ctrl+A`: quick loot by color search. This is intended to work with the provided filter variants.

### Stash / Movement

- `F10`: move stash columns 1-5.
- `Ctrl+F10`: move stash columns 6-10.
- `Shift+F10`: move stash columns 11-12.
- `F11`: while held, Ctrl-click items as the cursor moves across them.

## Deprecated or Low-Priority Features

- `Ctrl+PageUp`: old SearchItem flow, now removed.
- Legacy portal-scroll-related features: later PoE versions already provide built-in replacements.
- Auto-flask is not very practical and is no longer actively maintained because its pixel-color detection is sensitive to map lighting, UI state, and resolution.

## GUI Overview

The built-in GUI is split into these tabs:

- `Home`: hotkey overview and quick editing.
- `Flask / Timer`: quick flask lists and timer sequences.
- `Quick Enter`: text content for chat / travel shortcuts.
- `Coords / Core`: bag, trade, action-target, and auto-flask coordinates.
- `Coords / Stash`: stash sweep ranges and delay settings.
- `More`: broadcast text, loot color, auto-flask list, and mine delay.

## Item Filter Notes

( No longer maintained.)

The `itemfilter/` folder includes quick-loot-oriented NeverSink filter variants plus `convert_filter.py`.
These are meant to help the `Ctrl+A` loot action find items by a specific color.

## Advanced Tweaks

Most users only need the GUI, but if you want to change behavior directly:

- `src/functions_int.ahk`: feature logic and action loops.
- `src/gui.ahk`: GUI layout and apply / save flow.
- `src/rw_settings.ahk`: defaults and `settings.ini` read/write behavior.

## UI Example

![UI](https://github.com/bamd5alifes7/PoE_UtilityBundles/blob/master/demo/%E4%BB%8B%E9%9D%A2.png)
