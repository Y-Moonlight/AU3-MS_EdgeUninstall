
; 停止Edge浏览器进程
ProcessClose("msedge.exe")
ProcessClose("msedge.exe")

; 删除Edge浏览器相关注册表项
RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge")
RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Edge")
RegDelete("HKEY_CURRENT_USER\Software\Policies\Microsoft\Edge")
RegDelete("HKEY_CURRENT_USER\Software\Microsoft\Edge")

; 手动选择Edge浏览器安装目录
$edgeInstallDir = ""
While $edgeInstallDir = ""
    $edgeInstallDir = FileSelectFolder("选择Edge浏览器安装目录", "", 3)
    If @error Then
        $retry = MsgBox(17, "错误", "未选择Edge浏览器安装目录。是否重新选择？")
        If $retry = 2 Then
            Exit
        EndIf
    EndIf
WEnd

; 删除Edge浏览器的安装目录
DirRemove($edgeInstallDir, 1)

; 删除Edge浏览器的用户数据目录（慎用！将删除所有Edge浏览器用户数据）
DirRemove(@AppDataDir & "\Microsoft\Edge", 1)

MsgBox(64, "提示", "已强制卸载Edge浏览器。请重新启动计算机以生效。")