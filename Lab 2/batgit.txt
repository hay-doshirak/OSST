@ECHO OFF
ECHO Setting up Git configuration

REM установка имени пользователЯ
git config --global user.name "%1"

REM установка email
git config --global user.email "%2"

ECHO Git configuration completed!
ECHO User name: "%1"
ECHO User email: "%2"

PAUSE
