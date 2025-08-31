@echo off

:first
title �L�������^�C�s���O
set acount=0
set mcount=0
set ascore=0
set mscore=0
set thround=0
set round=10
set folderpath=%~dp0
set version=0.7
set checkversion=0

:fupcheck
for /f "usebackq" %%t in (`"powershell (invoke-webrequest -uri https://fuyumiki1232.github.io/syumi/kiosuu/version.txt).content"`) do set checkversion=%%t
goto fupselect

:fupselect
if %version%==%checkversion% (
    goto title
) else (
    echo ���̃Q�[���̍ŐV�ł�����܂��B
    set /p upcheck=�_�E�����[�h���܂���?(y/n)
    if %upcheck%==y (
        goto update
    )
    if %upcheck%==n (
        goto title
    )
    goto fupselect
)

:title
title �L�������^�C�s���O - �^�C�g��
cls
echo �L�������^�C�s���O Ver.0.7
echo ����:start:�Q�[�����X�^�[�g����
echo      settings:�ݒ���J��
echo      info:���̃Q�[���̐���
echo      release:���̃o�[�W�����̃����[�X�m�[�g������
echo      score:���݂̍��v���𐔁A�s���𐔂�\��
echo      save:���݂̐i�s�󋵂��Z�[�u����
echo      load:�t�@�C������ݒ�����[�h����
echo      reset:���݂̃X�R�A�A�ݒ�����ׂă��Z�b�g���܂��B
echo      exit:�Q�[�����I������
echo ���݂̃��E���h�ݒ萔��%round%�ł�
set select=���͂���Ă��܂���
set /p select=�������͂��Ă�:
if %select%==start (
goto start
) else if %select%==exit (
goto fin
) else if %select%==settings (
goto settings
) else if %select%==info (
goto info
) else if %select%==score (
goto score
) else if %select%==save (
goto save
) else if %select%==load (
goto load
) else if %select%==reset (
goto reset
) else if %select%==release (
    goto release
) else (
echo �\�����ꂽ����̂ǂꂩ����͂��Ă��������B
echo 3�b��Ɏ����I�Ƀ^�C�g����ʂɖ߂�܂��c
timeout /t 3 /nobreak >nul
goto title
)

:release
cls
powershell (invoke-webrequest -uri https://fuyumiki1232.github.io/syumi/kiosuu/release.txt).content
echo �^�C�g���ɖ߂�ɂ͉����L�[�������Ă��������c
pause >nul
goto title

:reset
cls
echo �x��:�Z�[�u���Ă��Ȃ����e�͎����܂��B
echo �{���ɃX�R�A�����Z�b�g���܂���(yes/no)?
set scorese=���͂���Ă��܂���
set /p scorese=
if %scorese%==yes (
goto first
) else if %scorese%==no (
goto title
) else (
echo �\�����ꂽ����̂ǂꂩ����͂��Ă��������B
echo 3�b��Ɏ����I�Ƀ��Z�b�g��ʂɖ߂�܂��c
timeout /t 3 /nobreak >nul
goto reset
)

:save
title �L�������^�C�s���O - �Z�[�u
cls
cd %folderpath%
if not exist %folderpath%kiosuusada\ (
md kiosuusada
)
cd kiosuusada
if exist save.txt (
del save.txt
)
powershell add-content -path %folderpath%kiosuusada\save.txt -value "%ascore%,%mscore%,%round%"
echo �Z�[�u���������܂����B
echo �^�C�g����ʂɖ߂�ɂ͉����L�[�������Ă��������B
pause >nul
goto title

:load
title �L�������^�C�s���O - ���[�h
cls
if exist "%folderpath%kiosuusada\save.txt" (
cd %folderpath%kiosuusada\
for /f "usebackq" %%t in (`"powershell (get-content "%folderpath%kiosuusada\save.txt")[0]"`) do set ascore=%%t
for /f "usebackq" %%t in (`"powershell (get-content "%folderpath%kiosuusada\save.txt")[1]"`) do set mscore=%%t
for /f "usebackq" %%t in (`"powershell (get-content "%folderpath%kiosuusada\save.txt")[2]"`) do set round=%%t
echo ���[�h���������܂����B
echo �^�C�g����ʂɖ߂�ɂ͉����L�[�������Ă��������B
pause >nul
goto title
) else (
echo �Z�[�u�t�@�C�������݂��܂���B
echo �^�C�g����ʂɖ߂�ɂ͉����L�[�������Ă��������B
pause >nul
goto title
)

:score
cls
title �L�������^�C�s���O - ���݂̍��v���𐔁A�s����
echo ���݂̍��v����:%ascore%
echo ���݂̍��v�s����:%mscore%
echo;
echo �^�C�g����ʂɖ߂�ɂ͉����L�[�������Ă��������B
pause >nul
goto title

:info
cls
title �L�������^�C�s���O - ����
echo ���̃Q�[���ɂ���:
echo ��u�����o�Ă��鐔�����o���đłS�~�^�C�s���O�Q�[���ł��B
echo;
echo �ݒ�ɂ���:
echo ���̃Q�[���̐ݒ�̓Q�[������邽�тɃ��Z�b�g����܂��B
echo;
echo ���E���h�ɂ���:
echo ���������烊�U���g�Œ��f���邩�̐ݒ�ł��B
echo ���E���h��10�̏ꍇ�A10�����
echo;
echo ����:next:������
echo      exit:�^�C�g����ʂɖ߂�
echo �������͂��Ă�������:
echo;
echo ���̂悤�ȉ�ʂ��o�Ă��܂��B
echo;
echo �Z�[�u/���[�h�ɂ���:
echo ���݂̃X�R�A�A�ݒ���Z�[�u/���[�h�ł��܂��B
echo �ۑ��ꏊ�͂��̃t�@�C��������ꏊ��"kiosuudata"�t�H���_�ɕۑ�����܂��B
echo;
echo ���Z�b�g�ɂ���:
echo ���݂̃X�R�A�A�ݒ�����ׂď�����Ԃɖ߂��܂��B
echo;
echo �^�C�g����ʂɖ߂�ɂ͉����L�[�������Ă��������B
pause >nul
goto title

:settings
cls
title �L�������^�C�s���O - �ݒ�
echo �ݒ�
echo ����:round:1���E���h�����邩�B�f�t�H���g��10�B
echo      update:���̃Q�[���̃A�b�v�f�[�g���m�F���܂��B
echo      exit:�^�C�g����ʂɖ߂�
set sselect=���͂���Ă��܂���
set /p sselect=��������:
if %sselect%==round (
goto roundsettings
) else if %sselect%==update (
    goto supdate
) else if %sselect%==exit (
goto title
) else (
echo �\�����ꂽ����̂ǂꂩ����͂��Ă��������B
echo 3�b��Ɏ����I�ɐݒ��ʂɖ߂�܂��c
timeout /t 3 /nobreak >nul
goto settings
)

:roundsettings
cls
title �L�������^�C�s���O - �ݒ� - ���E���h���ݒ�
echo ���݂̃��E���h�ݒ萔��%round%�ł�
echo ����:���p�����ȊO����͂���ƁA�����ɃQ�[���������܂��B
set /p round=���E���h���𐔎��œ��͂��Ă�:
goto settings

:supdate
cls
title �L�������^�C�s���O - �A�b�v�f�[�g
for /f "usebackq" %%t in (`"powershell (invoke-webrequest -uri https://fuyumiki1232.github.io/syumi/kiosuu/version.txt).content"`) do set checkversion=%%t
goto upselect

:upselect
if %version%==%checkversion% (
    echo ���̃o�[�W�����͍ŐV�ł��B
    echo �ݒ��ʂɖ߂�ɂ͉����L�[�������Ă��������B
    pause >nul
    goto settings
) else (
    echo ���̃Q�[���̍ŐV�ł�����܂��B
    set /p upcheck=�_�E�����[�h���܂���?(y/n)
    if %upcheck%==y (
        goto update
    ) if %upcheck%==n (
        goto settings
    )
        goto upselect
)

:update
powershell invoke-webrequest -uri https://fuyumiki1232.github.io/syumi/share/�L�������^�C�s���O.bat -outfile %folderpath%�L�������^�C�s���O%checkversion%.bat
echo �A�b�v�f�[�g���������܂����B
echo �I������ɂ͉����L�[�������Ă��������c
pause >nul
goto fin

:start
title �L�������^�C�s���O - �����͂���?
cls
echo 3
timeout /t 1 /nobreak >nul
cls
echo 2
timeout /t 1 /nobreak >nul
cls
echo 1
timeout /t 1 /nobreak >nul
cls
echo �X�^�[�g!
timeout /t 1 /nobreak >nul
cls
goto set

:set
set acount=0
set mcount=0
set thround=0
goto game

:game
cls
set /a thround+=1
title �L�������^�C�s���O - ���� -���E���h%thround%
set suuti=%random%
echo %suuti%
timeout /t 1 /nobreak >nul
cls
set inpu=���͂���Ă��܂���
set /p inpu=���͂��Ă�:
if %inpu%==%suuti% (
set /a acount+=1
set /a ascore+=1
goto core
) else (
set /a mcount+=1
set /a mscore+=1
goto miss
)

:core
title �L�������^�C�s���O - ���U���g
cls
set ache=core
echo ����!
echo ���Ȃ��̓���(����):%inpu%
echo ���݂̐���:%acount% ���݂̕s����:%mcount%
if %thround%==%round% (
goto che
) else (
echo 3�b��ɍĊJ���܂��c
timeout /t 3 /nobreak >nul
goto game
)

:miss
title �L�������^�C�s���O - ���U���g
cls
set ache=miss
echo �s����!
echo ������%suuti%�ł�
echo ���Ȃ��̓���:%inpu%
echo ���݂̐���:%acount% ���݂̕s����:%mcount%
if %thround%==%round% (
goto che
) else (
echo 3�b��ɍĊJ���܂��c
timeout /t 3 /nobreak >nul
goto game
)

:che
echo ����:next:������
echo      exit:�^�C�g����ʂɖ߂�
set nexche=���͂���Ă��܂���
set /p nexche=�������͂��Ă�������:
goto ncheck

:ncheck
if %nexche%==next (
set thround=0
echo 3�b��ɍĊJ���܂��c
timeout /t 3 /nobreak >nul
goto set
) else if %nexche%==exit (
goto title
) else (
echo �\�����ꂽ����̂ǂꂩ����͂��Ă��������B
echo 3�b��Ɏ����I�Ƀ��U���g��ʂɖ߂�܂��c
timeout /t 3 /nobreak >nul
if %ache%==core (
goto core
) else if %ache%==miss (
goto miss
)
)

:fin