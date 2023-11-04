#NoTrayIcon      
#RequireAdmin 

#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=D:\Users\Desktop\AU3脚本开发\Edge卸载工具\Form1.kxf

If WinExists("Microsoft_Edge浏览器专用卸载工具") Then
	MsgBox(0+16+262144,"错误","程序已在运行，请不要重复打开！")
	WinActivate("Microsoft_Edge浏览器专用卸载工具")
	Exit
	EndIf

DirCreate("C:\Windows\Temp\msedge_uninstall")
FileInstall("D:\Users\Desktop\AU3脚本开发\Edge卸载工具\msedge_uninstall\ico.ico","C:\Windows\Temp\msedge_uninstall\")
FileInstall("D:\Users\Desktop\AU3脚本开发\Edge卸载工具\Wait.exe","C:\Windows\Temp\msedge_uninstall\")

$Form1 = GUICreate("Microsoft_Edge浏览器专用卸载工具", 451, 201, -1, -1,$WS_CAPTION)
GUISetBkColor(0xA6CAF0)
$Icon1 = GUICtrlCreateIcon("C:\Windows\Temp\msedge_uninstall\ico.ico", -1, 26, 20, 64, 64)
$Label1 = GUICtrlCreateLabel("Microsoft Edge浏览器专用卸载工具", 131, 16, 272, 26)
GUICtrlSetFont(-1, 12, 800, 0, "微软雅黑")
$Label2 = GUICtrlCreateLabel("此工具专门用来卸载Chromium内核的Edge浏览器，目前", 120, 40, 298, 21)
GUICtrlSetFont(-1, 9, 800, 0, "微软雅黑")
$Label3 = GUICtrlCreateLabel("Edge浏览器不支持直接从控制面板里进行卸载的，于", 120, 55, 298, 21)
GUICtrlSetFont(-1, 9, 800, 0, "微软雅黑")
$Label4 = GUICtrlCreateLabel("是我专门写工具来卸载Chromium内核的Edge浏览器", 120, 70, 298, 21)
GUICtrlSetFont(-1, 9, 800, 0, "微软雅黑")
$Label5 = GUICtrlCreateLabel("当我们的Edge浏览器出现问题时，我们就可以用此工具", 120, 85, 298, 21)
GUICtrlSetFont(-1, 9, 800, 0, "微软雅黑")
$Label6 = GUICtrlCreateLabel("来卸载Edge浏览器", 120, 100, 106, 21)
GUICtrlSetFont(-1, 9, 800, 0, "微软雅黑")
$Button1 = GUICtrlCreateButton("卸载", 65, 130, 80, 35)
GUICtrlSetFont(-1, 10, 800, 0, "微软雅黑")
$Button2 = GUICtrlCreateButton("更新", 185, 130, 80, 35)
GUICtrlSetFont(-1, 10, 800, 0, "微软雅黑")
$Button3 = GUICtrlCreateButton("退出", 305, 130, 80, 35)
GUICtrlSetFont(-1, 10, 800, 0, "微软雅黑")
$Label7 = GUICtrlCreateLabel("作者:@飘白     QQ:3391680446", 24, 172, 219, 23)
GUICtrlSetFont(-1, 10, 800, 0, "微软雅黑")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			DirRemove("C:\Windows\Temp\msedge_uninstall",1)
			Exit
		Case $Button3
			DirRemove("C:\Windows\Temp\msedge_uninstall",1)
			Exit
		Case $Button2
			ShellExecute("https://www.runningcheese.com/edge")
		Case $Button1
			
			GUISetState(@SW_HIDE)
			
			Sleep(500)
			Run("C:\Windows\Temp\msedge_uninstall\Wait.exe")
			Sleep(1000)
			$PID=WinGetProcess ("执行进度")
			Sleep(1000)
			
			ProcessClose("msedge.exe")
			ProcessClose("msedge.exe")
			ProcessClose("MicrosoftEdgeUpdate.exe")
			ProcessClose("MicrosoftEdgeUpdate.exe")
			
			RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge")
            RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Edge")
            RegDelete("HKEY_CURRENT_USER\Software\Policies\Microsoft\Edge")
            RegDelete("HKEY_CURRENT_USER\Software\Microsoft\Edge")
			
			Sleep(1000)
			ProcessClose ($PID)
			Sleep(500)
			
			
			
			$edgeInstallDir = ""
While $edgeInstallDir = ""
    $edgeInstallDir = FileSelectFolder("请选择Edge浏览器安装目录，一般为“C:\Program Files (x86)\Microsoft\Edge”", "", 3)
    If @error Then
        $retry = MsgBox(17, "错误", "当前未选择Edge浏览器安装目录，是否重新选择？")
        If $retry = 2 Then
			MsgBox(0+16, "错误", "脚本终止，点击确定后退出！")
			DirRemove("C:\Windows\Temp\msedge_uninstall",1)
            Exit
        EndIf
    EndIf
WEnd
			Sleep(500)
			Run("C:\Windows\Temp\msedge_uninstall\Wait.exe")
			Sleep(1000)
			$PID=WinGetProcess ("执行进度")
			Sleep(1000)
			
			DirRemove($edgeInstallDir, 1)
			
			$edgeParentDir = StringRegExpReplace($edgeInstallDir, "(.*\\).*", "$1")
			DirRemove(StringTrimRight($edgeParentDir, 1) & "\EdgeCore", 1)
            DirRemove(StringTrimRight($edgeParentDir, 1) & "\EdgeUpdate", 1)
            DirRemove(StringTrimRight($edgeParentDir, 1) & "\Temp", 1)
			
			DirRemove(@LocalAppDataDir & "\Microsoft\Edge", 1)
			
			RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge增强版")
            RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge")
            RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge Update")
			
			Sleep(1000)
			ProcessClose ($PID)
			Sleep(500)
			
			
			MsgBox(0+64+262144, "提示", "Edge浏览器卸载成功，重新启动计算机以生效!")
			
			GUISetState(@SW_SHOW)

		Case $Label7
			MsgBox(0+64,"关于","软件作者:@飘白     QQ:3391680446")
	EndSwitch
WEnd
