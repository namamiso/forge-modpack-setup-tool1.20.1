@echo off
title Minecraft Forge 完全自動セットアップ

echo 準備できたらエンター押しな
pause >nul

:: ステップ1: Java ZIP を展開
if not exist "java\zulu17" (
    echo Java を展開中...
    powershell -Command "Expand-Archive -Force 'java\zulu17.zip' 'java\zulu17'"
)

:: ステップ2: Forge クライアントをインストール
if not exist "%APPDATA%\.minecraft\versions\1.20.1-forge-47.4.0" (
    echo Forge をインストール中...
    "java\zulu17\zulu17\bin\java.exe" -jar forge-1.20.1-47.4.0-installer.jar --installClient
)

:: ステップ3: mods コピー
echo MOD をコピー中...
xcopy /Y /Q /I "mods\*" "%APPDATA%\.minecraft\mods\"

:: ステップ4: shaderpacks コピー
echo シェーダーをコピー中...
xcopy /Y /Q /I "shaderpacks\*" "%APPDATA%\.minecraft\shaderpacks\"

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