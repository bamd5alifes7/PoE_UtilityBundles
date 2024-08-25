ReadSettings(){


    IniRead, quickFlasksHotkey0,  settings.ini, settings, quickFlasksHotkey0,  2
    IniRead, quickFlasksHotkey1,  settings.ini, settings, quickFlasksHotkey1,  3
    IniRead, quick_flask_list,    settings.ini, settings, quick_flask_list,    1-2-3-4-5
    IniRead, quick_flask_list_1,  settings.ini, settings, quick_flask_list_1,  3-w	
	IniRead, AutoTime_flask_list, settings.ini, settings, AutoTime_flask_list,  1
	IniRead, AutoTime_attack_list, settings.ini, settings, AutoTime_attack_list,  w
	IniRead, keep_attack_list,    settings.ini, settings, keep_attack_list,  RButton
	IniRead, AutoInterval,        settings.ini, settings, AutoInterval,  4000
    IniRead, lootColor,           settings.ini, settings, lootColor,           0x790062
    IniRead, loot_dalay,          settings.ini, settings, loot_dalay,          400
    IniRead, portalX,             settings.ini, settings, portalX,             2500
    IniRead, portalY,             settings.ini, settings, portalY,             1100
    IniRead, low_life_X,          settings.ini, settings, low_life_X,          169
    IniRead, low_life_Y,          settings.ini, settings, low_life_Y,          923
    IniRead, life_color,          settings.ini, settings, life_color,          0x180B8F    
    IniRead, low_life_flask_list, settings.ini, settings, low_life_flask_list, 1
    IniRead, quickEnterText0,     settings.ini, settings, quickEnterText0,     /global 168 한국어
    IniRead, quickEnterText1,     settings.ini, settings, quickEnterText1,     /trade 615 한국어
    IniRead, quickEnterText2,     settings.ini, settings, quickEnterText2,     /global 666 english
    IniRead, quickEnterText3,     settings.ini, settings, quickEnterText3,     /hideout
    IniRead, quickEnterText4,     settings.ini, settings, quickEnterText4,     /global 5587
    IniRead, quickEnterText5,     settings.ini, settings, quickEnterText5,     %A_Space%
    IniRead, quickEnterText6,     settings.ini, settings, quickEnterText6,     %A_Space%
    IniRead, quickEnterText7,     settings.ini, settings, quickEnterText7,     /exit
    IniRead, mine_laying_time,    settings.ini, settings, mine_laying_time,    300
    ; IniRead, url,                 settings.ini, settings, url, http://www.pathofexile.com/trade/search/Betrayal
    IniRead, url,                 settings.ini, settings, url, https://www.pathofexile.com/trade/search/Settlers
    IniRead, BagFirstX,           settings.ini, settings, BagFirstX, 		   1694
    IniRead, BagFirstY,           settings.ini, settings, BagFirstY, 		   781
    IniRead, BagLastX,            settings.ini, settings, BagLastX, 		   2539
    IniRead, BagLastY,            settings.ini, settings, BagLastY, 		   1137
    IniRead, tradeFirstX,         settings.ini, settings, tradeFirstX, 		   412
    IniRead, tradeFirstY,         settings.ini, settings, tradeFirstY, 		   269
    IniRead, tradeLastX,          settings.ini, settings, tradeLastX, 		   1261
    IniRead, tradeLastY,          settings.ini, settings, tradeLastY, 		   612
    IniRead, ScouringX,           settings.ini, settings, ScouringX, 		   583
    IniRead, ScouringY,           settings.ini, settings, ScouringY, 		   690
    IniRead, ItemX,         	  settings.ini, settings, ItemX, 		       441
    IniRead, ItemY,               settings.ini, settings, ItemY, 		       608
    IniRead, AlchemyX,            settings.ini, settings, AlchemyX, 		   663
    IniRead, AlchemyY,            settings.ini, settings, AlchemyY, 		   375
    IniRead, TabFirstX,           settings.ini, settings, TabFirstX, 		   23
    IniRead, TabFirstY,           settings.ini, settings, TabFirstY, 		   185
    IniRead, TabLastX,            settings.ini, settings, TabLastX, 		   373
    IniRead, TabLastY,            settings.ini, settings, TabLastY, 		   1022
    IniRead, Tab2ndFirstX,        settings.ini, settings, Tab2ndFirstX, 	   374
    IniRead, Tab2ndFirstY,        settings.ini, settings, Tab2ndFirstY, 	   178
    IniRead, Tab2ndLastX,         settings.ini, settings, Tab2ndLastX, 		   724
    IniRead, Tab2ndLastY,         settings.ini, settings, Tab2ndLastY, 		   1023
    IniRead, Announce,            settings.ini, settings, Announce, 		   五軍 5場35D 怪量均萬 最高11053 84物免 88三大抗 可借混抗經驗裝 -3
    return
}

SaveSettings(){
    IniWrite, %quickFlasksHotkey0%,  settings.ini, settings, quickFlasksHotkey0
    IniWrite, %quickFlasksHotkey1%,  settings.ini, settings, quickFlasksHotkey1
    IniWrite, %quick_flask_list%,    settings.ini, settings, quick_flask_list
    IniWrite, %quick_flask_list_1%,  settings.ini, settings, quick_flask_list_1
	IniWrite, %AutoTime_flask_list%, settings.ini, settings, AutoTime_flask_list
	IniWrite, %AutoTime_attack_list%, settings.ini, settings, AutoTime_attack_list
	IniWrite, %keep_attack_list%,    settings.ini, settings, keep_attack_list
	IniWrite, %AutoInterval%,        settings.ini, settings, AutoInterval
    IniWrite, %lootColor%,           settings.ini, settings, lootColor
    IniWrite, %loot_dalay%,          settings.ini, settings, loot_dalay
    IniWrite, %portalX%,             settings.ini, settings, portalX
    IniWrite, %portalY%,             settings.ini, settings, portalY
    IniWrite, %low_life_X%,          settings.ini, settings, low_life_X
    IniWrite, %low_life_Y%,          settings.ini, settings, low_life_Y
    IniWrite, %life_color%,          settings.ini, settings, life_color
    IniWrite, %low_life_flask_list%, settings.ini, settings, low_life_flask_list
    IniWrite, %quickEnterText0%,     settings.ini, settings, quickEnterText0
    IniWrite, %quickEnterText1%,     settings.ini, settings, quickEnterText1
    IniWrite, %quickEnterText2%,     settings.ini, settings, quickEnterText2
    IniWrite, %quickEnterText3%,     settings.ini, settings, quickEnterText3
    IniWrite, %quickEnterText4%,     settings.ini, settings, quickEnterText4
    IniWrite, %quickEnterText5%,     settings.ini, settings, quickEnterText5
    IniWrite, %quickEnterText6%,     settings.ini, settings, quickEnterText6
    IniWrite, %quickEnterText7%,     settings.ini, settings, quickEnterText7
    IniWrite, %mine_laying_time%,    settings.ini, settings, mine_laying_time
    IniWrite, %url%,                 settings.ini, settings, url
	IniWrite, %BagFirstX%,           settings.ini, settings, BagFirstX
	IniWrite, %BagFirstY%,           settings.ini, settings, BagFirstY
	IniWrite, %BagLastX%,            settings.ini, settings, BagLastX
	IniWrite, %BagLastY%,            settings.ini, settings, BagLastY
    IniWrite, %tradeFirstX%,         settings.ini, settings, tradeFirstX
	IniWrite, %tradeFirstY%,         settings.ini, settings, tradeFirstY
	IniWrite, %tradeLastX%,          settings.ini, settings, tradeLastX
	IniWrite, %tradeLastY%,          settings.ini, settings, tradeLastY
	IniWrite, %ScouringX%,      	 settings.ini, settings, ScouringX
	IniWrite, %ScouringY%,           settings.ini, settings, ScouringY
	IniWrite, %ItemX%,        		 settings.ini, settings, ItemX
	IniWrite, %ItemY%,         		 settings.ini, settings, ItemY
	IniWrite, %AlchemyX%,        	 settings.ini, settings, AlchemyX
	IniWrite, %AlchemyY%,         	 settings.ini, settings, AlchemyY
	IniWrite, %TabFirstX%,         	 settings.ini, settings, TabFirstX
	IniWrite, %TabFirstY%,         	 settings.ini, settings, TabFirstY
	IniWrite, %TabLastX%,         	 settings.ini, settings, TabLastX
	IniWrite, %TabLastY%,         	 settings.ini, settings, TabLastY
	IniWrite, %Tab2ndFirstX%,        settings.ini, settings, Tab2ndFirstX
	IniWrite, %Tab2ndFirstY%,        settings.ini, settings, Tab2ndFirstY
	IniWrite, %Tab2ndLastX%,         settings.ini, settings, Tab2ndLastX
	IniWrite, %Tab2ndLastY%,         settings.ini, settings, Tab2ndLastY
	IniWrite, %Announce%,            settings.ini, settings, Announce	
	return
}