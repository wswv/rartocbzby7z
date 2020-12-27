
@ECHO OFF
REM rar_to_zip.bat - find alland .rar files in the current directory, recompress them into zip files - but don't delete the originals.

ECHO Searching for RAR and ZIP files to recompress into zip archives.
for %%F in (*.rar) do (
ECHO Found %%F to recompress...
REM Extract...
"C:\Program Files\7-Zip\7z" x "%%F" -o"%%F contents"
REM Does the directory exist? has zip created it correctly?
IF EXIST "%%F contents" (
REM Change directory, create zip of contents of directory...
CD "%%F contents"
"C:\Program Files\7-Zip\7z" a -tzip "../%%~nF.cbz" * -mx=1
CD ..
REM Delete the temporary extraction folder
RMDIR "%%F contents" /S /Q
ECHO Recompressed %%F to %%~nF.cbz
)
)
ECHO Search ended.

pause
