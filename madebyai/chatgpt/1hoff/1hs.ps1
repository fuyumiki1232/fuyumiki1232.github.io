# �ڕW���ԁi�b�j: 1���� = 3600�b
$targetSeconds = 3600
$countedSeconds = 0

# �}�E�X���W�擾�̏���
Add-Type -AssemblyName System.Windows.Forms
$lastX = [System.Windows.Forms.Cursor]::Position.X
$lastY = [System.Windows.Forms.Cursor]::Position.Y

Write-Host "�}�E�X�������Ă���Ԃ����J�E���g���܂��B1���Ԃ�PC���V���b�g�_�E�����܂��B"

while ($countedSeconds -lt $targetSeconds) {
    Start-Sleep -Seconds 1

    $pos = [System.Windows.Forms.Cursor]::Position
    if ($pos.X -ne $lastX -or $pos.Y -ne $lastY) {
        $countedSeconds++
        Write-Host "�J�E���g��: $countedSeconds / $targetSeconds �b"
    }

    $lastX = $pos.X
    $lastY = $pos.Y
}

Write-Host "1���ԂɒB���܂����BPC���V���b�g�_�E�����܂��B"
shutdown /s /t 60 /c "1���Ԃ��o�߂��܂����B60�b��ɂ���PC�̓V���b�g�_�E������܂��c"