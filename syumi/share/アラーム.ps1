# �A�Z���v���̓ǂݍ���
Add-Type -AssemblyName System.Windows.Forms
[void][System.Reflection.Assembly]::Load("Microsoft.VisualBasic, Version=8.0.0.0, Culture=Neutral, PublicKeyToken=b03f5f7f11d50a3a")
$user = (Get-ChildItem Env:\USERNAME).Value
$player = New-Object Media.SoundPlayer "c:\users\$user\documents\alerm.wav"

#����?
$input = [Microsoft.VisualBasic.Interaction]::InputBox(@"
�����ɋN����?
(���͕��@:HH:mm:ss)
"@, "�A���[��")

# ���Ԃɉ����Ď��s
while($true){
$date = get-date -format "HH:mm:ss"
If($date -eq $input){
	$player.Playlooping()
	$box = [System.Windows.Forms.MessageBox]::Show("���͂悤�I�N���āI���Ԃ���I","�A���[��","ok","information","Button1")
	exit
}else{
}
}