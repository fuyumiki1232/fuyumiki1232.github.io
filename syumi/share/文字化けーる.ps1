# ���������[�� v1.0
# ���͂��������𕶎������������܂��B���͂��������ɂ���Ă͕��������ł��Ȃ��\��������܂��B

#�@�A�Z���u���̓ǂݍ���
[void][System.Reflection.Assembly]::Load("Microsoft.VisualBasic, Version=8.0.0.0, Culture=Neutral, PublicKeyToken=b03f5f7f11d50a3a")

#�@�������������������������
$input = [Microsoft.VisualBasic.Interaction]::InputBox(@"
����������������������S�p�œ��͂��Ă�

�����p�̏ꍇ�A�����������ł��܂���B
�t�Ɍ����ΑS�p�ł���Ήp������������ł��܂��B
"@, "���������[��")

# �ϐ��̎w��
$user = (Get-ChildItem Env:\USERNAME).Value
$temppath = "c:\users\$user\desktop\temp.txt"
$batcore = "$input"

# ������������
"$batcore" | % { [Text.Encoding]::UTF8.GetBytes($_) } | Set-Content -Path "c:\users\$user\desktop\temp.txt" -Encoding Byte
$output = get-content $temppath
del $temppath

# �e�L�X�g�t�@�C�����N���b�v�{�[�h��
$result = [System.Windows.Forms.MessageBox]::Show(@"
�N���b�v�{�[�h���e�L�X�g�t�@�C���A�܂��͗����ɏo�͂��邩��I�����Ă��������B
�N���b�v�{�[�h:�͂�
�e�L�X�g�t�@�C��:������
����:�L�����Z��

���e�L�X�g�t�@�C���̏ꍇ�A�t�@�C���̓f�X�N�g�b�v�ɐ�������܂��B
"@,"���������[��","YesNocancel","Question")

#�����̕���
If($result -eq "Yes"){
	Set-clipboard "$output"
}Elseif($result -eq "No"){
	$date = get-date -format "yyyyMMdd_hh_mm_ss"
	"$output" | % { [Text.Encoding]::UTF8.GetBytes($_) } | Set-Content -Path "c:\users\$user\desktop\��������_$date.txt" -Encoding Byte
}Elseif($result -eq "Cancel"){
	$date = get-date -format "yyyyMMdd_hh_mm_ss"
	"$output" | % { [Text.Encoding]::UTF8.GetBytes($_) } | Set-Content -Path "c:\users\$user\desktop\��������_$date.txt" -Encoding Byte
	Set-clipboard "$output"
}elseif($result -eq "None"){
exit
}

# �I�����b�Z�[�W
Add-Type -AssemblyName System.Windows.Forms
$result = [System.Windows.Forms.MessageBox]::Show("�������܂����B","���������[��","ok","information","Button1")