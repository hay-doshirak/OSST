@ECHO OFF
ECHO Setting up Git configuration

REM óñòàíîâêà èìåíè ïîëüçîâàòåëß
git config --global user.name "%1"

REM óñòàíîâêà email
git config --global user.email "%2"

ECHO Git configuration completed!
ECHO User name: "%1"
ECHO User email: "%2"
ECHO Press any button to remove git configuration
PAUSE
git config --global --unset user.name
git config --global --unset user.email

ECHO Git configuration removed!
PAUSE

