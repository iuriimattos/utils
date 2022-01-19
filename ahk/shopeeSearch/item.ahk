; Credits: https://www.autohotkey.com/boards/viewtopic.php?f=76&t=84825#p372134
; headset


str := "Programmable timer"
keyword := EncodeDecodeURI(str)

Run, chrome.exe https://shopee.sg/search?keyword=%keyword%&page=0&sortBy=sales
Run, chrome.exe https://shopee.ph/search?keyword=%keyword%&page=0&sortBy=sales
Run, chrome.exe https://shopee.co.th/search?keyword=%keyword%&page=0&sortBy=sales
Run, chrome.exe https://shopee.com.my/search?keyword=%keyword%&page=0&sortBy=sales
Run, chrome.exe https://shopee.tw/search?keyword=%keyword%&page=0&sortBy=sales


EncodeDecodeURI(str, encode := true, component := true) {
   static Doc, JS
   if !Doc {
      Doc := ComObjCreate("htmlfile")
      Doc.write("<meta http-equiv=""X-UA-Compatible"" content=""IE=9"">")
      JS := Doc.parentWindow
      ( Doc.documentMode < 9 && JS.execScript() )
   }
   Return JS[ (encode ? "en" : "de") . "codeURI" . (component ? "Component" : "") ](str)
}
return
;samples
MsgBox, % decoded := EncodeDecodeURI(str, false)
MsgBox, % EncodeDecodeURI(decoded)
