@echo off
:: Launch internet explorer and visit a website
start "Title" /D "C:\Program Files\Internet Explorer\iexplore.exe" http://logging.website/index.html?id=winning
:: Make a Folder under the users profile and a file, then add content to the file
@mkdir "%USERPROFILE%\FOLDER"
@echo>"%USERPROFILE%\FOLDER\GUESSWHO.txt
@echo This file has some content in it "%USERPROFILE%\FOLDER\GUESSWHO.txt"

:: zip GUESSWHO.TXT
  set FILETOZIP="%USERPROFILE%\FOLDER\GUESSWHO.txt"


    set TEMPDIR=C:\temp
    rmdir %TEMPDIR%
    mkdir %TEMPDIR%
    xcopy /s %FILETOZIP% %TEMPDIR%

    echo Set objArgs = WScript.Arguments > %TEMPDIR%\_zipIt.vbs
    echo InputFolder = objArgs(0) >> %TEMPDIR%\_zipIt.vbs
    echo ZipFile = objArgs(1) >> %TEMPDIR%\_zipIt.vbs
    echo CreateObject("Scripting.FileSystemObject").CreateTextFile(ZipFile, True).Write "PK" ^& Chr(5) ^& Chr(6) ^& String(18, vbNullChar) >> %TEMPDIR%\_zipIt.vbs
    echo Set objShell = CreateObject("Shell.Application") >> %TEMPDIR%\_zipIt.vbs
    echo Set source = objShell.NameSpace(InputFolder).Items >> %TEMPDIR%\_zipIt.vbs
    echo objShell.NameSpace(ZipFile).CopyHere(source) >> %TEMPDIR%\_zipIt.vbs
    echo wScript.Sleep 2000 >> %TEMPDIR%\_zipIt.vbs

    CScript  %TEMPDIR%\_zipIt.vbs %TEMPDIR% "%USERPROFILE%\FOLDER\FILES.zip
:: Remove the contents of Temp
    del /Q %TEMPDIR%\*.*
    pause
@echo off 
