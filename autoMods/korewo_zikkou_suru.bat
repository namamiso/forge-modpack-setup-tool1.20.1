@echo off
title Minecraft MOD更新ツール

echo 準備できたらエンター押しな
pause >nul

setlocal enabledelayedexpansion

set MC_DIR=%APPDATA%\.minecraft
set MOD_DIR=%MC_DIR%\mods

echo MinecraftのMODフォルダ: %MOD_DIR%

:: MODフォルダが存在しない場合は作成
if not exist "%MOD_DIR%" (
    echo MODフォルダが存在しません。作成します。
    mkdir "%MOD_DIR%"
) else (
    echo MODフォルダの中身を更新
    del /Q "%MOD_DIR%\*"
)

:: 新しいMODをコピー
echo 新しいMODをコピー中...
xcopy /Y /S ".\mods\*.jar" "%MOD_DIR%\" >nul

echo.
echo MOD更新完了ー
echo.
echo 終わったからはよエンターおせ
pause >nul

:: 音声再生（非同期）
start /min "" powershell -c (New-Object Media.SoundPlayer "sound\success.wav").PlaySync()

:: 画像表示（1.5秒後に自動で閉じる）
start "" /wait powershell -WindowStyle Hidden -Command ^
"$img = 'img\success.png'; ^
 Add-Type -AssemblyName System.Windows.Forms; ^
 Add-Type -AssemblyName System.Drawing; ^
 $form = New-Object Windows.Forms.Form; ^
 $form.Text = 'やったね！'; ^
 $form.StartPosition = 'CenterScreen'; ^
 $form.FormBorderStyle = 'FixedDialog'; ^
 $form.TopMost = $true; ^
 $form.Width = 1000; $form.Height = 760; ^
 $pictureBox = New-Object Windows.Forms.PictureBox; ^
 $pictureBox.Image = [Drawing.Image]::FromFile($img); ^
 $pictureBox.SizeMode = 'StretchImage'; ^
 $pictureBox.Dock = 'Fill'; ^
 $form.Controls.Add($pictureBox); ^
 $timer = New-Object Windows.Forms.Timer; ^
 $timer.Interval = 2000; ^
 $timer.Add_Tick({$form.Close()}); ^
 $timer.Start(); ^
 [void]$form.ShowDialog()"

exit