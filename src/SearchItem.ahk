GetItemName(){
    Key := ""
    if GetbyClipboard(){
        Key := ItemAnalysis()
    }
    else{
        Key := GetbyInput()
    }
    Sleep 300
    return Key
}

GetbyClipboard(){
    A_Clipboard := ""
    Send "^c"
    Sleep 100
    if A_Clipboard == ""
        return False
    else
        return True
}

GetbyInput(){
    result := InputBox("What are you searching for?", "SearchItem")
    if result.Result != "OK"
        return ""
    return result.Value
}

ItemAnalysis(){
    i := 0
    Key := ""

    for line in StrSplit(A_Clipboard, "`n", "`r") {
        if InStr(line, "-----")
            break

        if i == 1 {
            Key := line
        } else if i == 2 {
            Key := Key " " line
        }
        i += 1
    }

    Key := StrReplace(Key, "<<set:MS>><<set:M>><<set:S>>")
    return Key
}

SearchItem(url){
    aa := ""
    ie := ComObject("InternetExplorer.Application")
    ie.Visible := true  ; This is known to work incorrectly on IE7.
    ie.Navigate(url)
    Sleep 100
    
    ;判斷網頁是否載入完畢,30秒內
    Loop 300
    {
        try
        {
            aa := ie.document.getElementsbyClassName("multiselect__input")[0].placeholder
            ;MsgBox % aa
        }
        catch
        {
        }
 
        if InStr(aa, "...") || InStr(aa, "Search") ; check if aa == 搜尋道具... or Search
        {
            break
        }
        Sleep 100
    }
    Sleep 100

    ;ie.document.getElementsbyClassName("multiselect__input")[0].value := "Search key word" ;測試用
    ;Send  % getAscStr(KeyWord)
    Send("^v")
    Sleep 100
    Send("{ENTER}")
    Sleep 100
    ie.document.getElementsbyClassName("btn search-btn")[0].click()
    Sleep 100
    
    ;sURL := GetActiveBrowserURL()
    ;MsgBox %sURL%
    return
}

