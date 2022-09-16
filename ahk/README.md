# I did to install [AutoHotkey_H](https://hotkeyit.github.io/v2/) 

>       Download and open .\x64w\AutoHotkey.exe 

* if doesn't work:

Install [Microsoft Visual C++ 2015 Redistributable Update 3 RC](https://www.microsoft.com/en-us/download/confirmation.aspx?id=52685)

>       Try again, if doesn't work:

* Copy missing dll from: 
```
C:\Windows\System32\DriverStore\FileRepository\iclsclient.inf_amd64_183917c66152901d\lib
```
> My case is: vcruntime140_1.dll


>       Paste copied dlls to:

```
C:\Windows\System32
```
