@echo off
title Minecraft Forge ���S�����Z�b�g�A�b�v

echo �����ł�����G���^�[������
pause >nul

:: �X�e�b�v1: Java ZIP ��W�J
if not exist "java\zulu17" (
    echo Java ��W�J��...
    powershell -Command "Expand-Archive -Force 'java\zulu17.zip' 'java\zulu17'"
)

:: �X�e�b�v2: Forge �N���C�A���g���C���X�g�[��
if not exist "%APPDATA%\.minecraft\versions\1.20.1-forge-47.4.0" (
    echo Forge ���C���X�g�[����...
    "java\zulu17\zulu17\bin\java.exe" -jar forge-1.20.1-47.4.0-installer.jar --installClient
)

:: �X�e�b�v3: mods �R�s�[
echo MOD ���R�s�[��...
xcopy /Y /Q /I "mods\*" "%APPDATA%\.minecraft\mods\"

:: �X�e�b�v4: shaderpacks �R�s�[
echo �V�F�[�_�[���R�s�[��...
xcopy /Y /Q /I "shaderpacks\*" "%APPDATA%\.minecraft\shaderpacks\"

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