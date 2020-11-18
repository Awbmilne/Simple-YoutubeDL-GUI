#NoEnv
#Warn
SendMode Input
SetKeyDelay, 20
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 2
#SingleInstance force
SetNumLockState, AlwaysOn


;Startup Tray Tip
TrayTip, AutoHotkey, Script Started,,17
Sleep 2000
TrayTip

;; Kill Script
!#esc::
	TrayTip, AutoHotkey, Script Stopped,,17
	ExitApp


; ─────── Youtube Video Downloader GUI ─────── 
!#y::
	GoSub, DownloadYoutubeVideoGUI
return

; DYV = Download Youtube Video
DownloadYoutubeVideoGUI:
  Choice = No choice was made
  Gui, DYV:New, , AHK Video Downloader Tool
  Gui, DYV:add, text, center, Insert Link and set Quality
  Gui, DYV:add, edit, vDYVvideoLink w300, Link
  Gui, DYV:add, dropdownlist, vDYVquality, 2160p(4k)|1440p|1080p|720p||480p|360p|240p|144p
  Gui, DYV:add, button, y+10 gDYVgodownload, Submit
  Gui, DYV:add, button, x+10 gDYVGuiClose, Quit
  Gui, DYV:show
  Gui, DYV:+lastfound  
  WinWaitClose
  return
 
  DYVGuiClose:
	Gui, DYV:Destroy
	return
	
  DYVgodownload:
	DYVdownload()
	return
	
  DYVdownload(){
	Gui, DYV:Submit
	GuiControlGet, DYVquality, DYV:
	GuiControlGet, DYVvideoLink, DYV:
	
	If (DYVquality = "2160p(4k)"){
		DYVheight := 2160
	}
	else If (DYVquality = "1440p"){
		DYVheight := 1440
	}
	else If (DYVquality = "1080p"){
		DYVheight := 1080
	}
	else If (DYVquality = "720p"){
		DYVheight := 720
	}
	else If (DYVquality = "480p"){
		DYVheight := 480
	}
	else If (DYVquality = "360p"){
		DYVheight := 360
	}
	else If (DYVquality = "240p"){
		DYVheight := 240
	}
	else If (DYVquality = "144p"){
		DYVheight := 144
	}
	else{
		DYVheight := 720
	}
	
	LinksArray := StrSplit(DYVvideoLink, ",")
	for LinkIndex, Link in LinksArray{
	
		Progress, B M T X100 Y10 CW000000 W80
		Progress, 75

        ;; Get Download Path
        FileReadLine, Download_Path, ./Download_Path.cfg, 1
		;Download_Path = ./Downloaded_Videos
        ;msgbox, %Download_Path%

        ;; Run YoutubeDL
		commandStr := "youtube-dl --no-mtime -o """ Download_Path "\`%(title)s.`%(ext)s"" --no-mtime -f ""bestvideo[height<=" DYVheight "]+bestaudio/best[height<=" DYVheight "]""  " Link " && exit || exit"
        ;msgbox, %commandStr%
		RunWait, %comspec% /c %commandStr% ,,Hide
		if (ErrorLevel == 0){
			TrayTip Video Downloaded ✔️, The video has been downloaded from:`n%Link%`nat %DYVquality% ,,33
		}
		else {
			TrayTip Video Failed ❌, The video failed to download from:`n%Link% ,,33
		}
		Progress, Off
	}
	
	
	Gui, DYV:Destroy
	return
  }
	

#If WinActive("AHK Video Downloader Tool")
 Enter::
	DYVdownload()
    return
 Esc::
	Gui, DYV:Destroy
	return
#If