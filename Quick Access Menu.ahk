; MIT License

; Copyright (c) 2022 AmineDev

; Permission is hereby granted, free of charge, to any person obtaining a copy
; of this software and associated documentation files (the "Software"), to deal
; in the Software without restriction, including without limitation the rights
; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
; copies of the Software, and to permit persons to whom the Software is
; furnished to do so, subject to the following conditions:

; The above copyright notice and this permission notice shall be included in all
; copies or substantial portions of the Software.

; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
; SOFTWARE.

#NoEnv
#SingleInstance Force

CoordMode, Mouse, Screen

#Include Lib\Neutron.ahk
#Include Lib\HtmlClass.ahk



global myGuiWidth  := 340  
global myGuiHeight := 250

global iconsFolder := A_ScriptDir . "\Lib\HTML\icons\" ; 


Menu, Tray, Icon, %A_ScriptDir%/Lib/logo.png ; file icon


; -------------------------------------------------------------------------- Initiate the HTML and button object "CHTML"

CHtml := new HtmlClass(iconsFolder)


;CHtml.StartList() : The start of the unordered HTML list <ul> in "Lib\HTML\index.html" file 
;CHtml.EndList()   : The end of the unordered HTML list ; </ul>

; CHtml.Add(ColorOftheIconsBackground, TitleOfTheIcon, AutohotkeyFunction, IconFileName) ; adds items to the list <li>...</li> 

; -------------------------------------------------------------------------- Add 3 Buttons to the first row, first <ul>

CHtml.StartList() 
CHtml.Add("orange",   "Google", "googleFunc", "google.png")
CHtml.Add("blue",  "Facebook", "facebookFunc", "facebook.png")
CHtml.Add("red",  "Youtube", "youtubeFunc", "youtube.png")
CHtml.EndList()


; -------------------------------------------------------------------------- Add 3 Buttons to the second row

CHtml.StartList()
CHtml.Add("blue",   "Downloads", "DownloadsFunc", "downloads.png")
CHtml.Add("blue",  "MT4", "MT4Func", "mt4.png")
CHtml.Add("aqua",     "VS Code", "vsFunc", "vscode.png")
CHtml.EndList()


; -------------------------------------------------------------------------- AutohotkeyFunction


googleFunc(neutron, event){
    Run, https://google.com/
}

facebookFunc(neutron, event){
    Run, https://facebook.com/
}

youtubeFunc(neutron, event){
    Run, https://youtube.com/
}

; -----------------

MT4Func(neutron, event){
    Run,C:\Program Files (x86)\KOT MT4 Terminal\terminal.exe
}

DownloadsFunc(neutron, event){
    Run, C:\Users\%A_UserName%\Downloads
}

vsFunc(neutron, event){

    Run, C:\Users\\%A_UserName%\AppData\Local\Programs\Microsoft VS Code\Code.exe
}




; -------------------------------------------------------------------------- Main Code



htmlFileName = %A_ScriptDir%\Lib\HTML\index.html

htmlText:= CHtml.GetHTML()                              ; Get the HTML template 

FileDelete, % htmlFileName

FileAppend, % htmlText, % htmlFileName, UTF-8           ; Create the HTML file

Sleep, 200                                              ; Pause for 200 miliseconds for the HTML file to be created without issues

FileRead, html , %A_ScriptDir%\Lib\HTML\index.html
FileRead, css ,  %A_ScriptDir%\Lib\HTML\style.css
FileRead, js ,  %A_ScriptDir%\Lib\HTML\script.js





;-------------------------------------------------------

neutron := new NeutronWindow(html, css, js, "")

if(WinExist("A")) ; if the left mouse button is clicked while the window exists then the widow will disappear
{            
    ~LButton::
        Sleep, 600
        neutron.Hide()
    return
    
}



; Click the middle mouse button to open the GUI

MButton::         
    
    if(WinExist("A")){

        toggle := true

    }else{

        toggle := false

    }

    if toggle {

        MouseGetPos, mouseX, mouseY       
        neutron.Show("x" . mouseX . " y" . mouseY . " w" . myGuiWidth . " h" . myGuiHeight)
    
    }else{
        neutron.Hide()
    }

    return







