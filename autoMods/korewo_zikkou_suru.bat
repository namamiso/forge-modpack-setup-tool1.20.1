@echo off
title Minecraft MOD�X�V�c�[��

echo �����ł�����G���^�[������
pause >nul

setlocal enabledelayedexpansion

set MC_DIR=%APPDATA%\.minecraft
set MOD_DIR=%MC_DIR%\mods

echo Minecraft��MOD�t�H���_: %MOD_DIR%

:: MOD�t�H���_�����݂��Ȃ��ꍇ�͍쐬
if not exist "%MOD_DIR%" (
    echo MOD�t�H���_�����݂��܂���B�쐬���܂��B
    mkdir "%MOD_DIR%"
) else (
    echo MOD�t�H���_�̒��g���X�V
    del /Q "%MOD_DIR%\*"
)

:: �V����MOD���R�s�[
echo �V����MOD���R�s�[��...
xcopy /Y /S ".\mods\*.jar" "%MOD_DIR%\" >nul

echo.
echo MOD�X�V�����[
echo.
echo �I���������͂�G���^�[����
pause >nul

:: �����Đ��i�񓯊��j
start /min "" powershell -c (New-Object Media.SoundPlayer "sound\success.wav").PlaySync()

:: �摜�\���i1.5�b��Ɏ����ŕ���j
start "" /wait powershell -WindowStyle Hidden -Command ^
"$img = 'img\success.png'; ^
 Add-Type -AssemblyName System.Windows.Forms; ^
 Add-Type -AssemblyName System.Drawing; ^
 $form = New-Object Windows.Forms.Form; ^
 $form.Text = '������ˁI'; ^
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