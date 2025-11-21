(*
 Google Voice Keepalive Script Template
 macOS + Google Chrome + AppleScript + Calendar

 HOW TO USE:
   - Open this file in Script Editor
   - Edit the CONFIGURATION section
   - Save as .scpt
   - Export as .app
   - Schedule in Apple Calendar (Alert → Custom → Open File)
*)

--------------------
-- CONFIGURATION  --
--------------------

-- Chrome profile directory name (from chrome://version → Profile Path)
-- Examples: "Default", "Profile 1", "Profile 2"
property profileDirectory : "Default"

-- Google Voice conversation URL (open a thread and copy full URL)
property conversationURL : "https://voice.google.com/u/0/messages?itemId=t.REPLACE_ME"

-- Optional tag so you know which account sent it when you see the SMS
property accountTag : "[GV] "

-- Random words to make each message look less automated
property randomWordsList : {"check", "ping", "yep", "ok", "here", "running", "alive", "yes", "test", "cool"}

--------------------
-- MAIN SCRIPT    --
--------------------

-- Launch Chrome with the chosen profile
do shell script "open -na 'Google Chrome' --args --profile-directory='" & profileDirectory & "'"
delay 4

-- Open the specific Google Voice conversation in a new tab
tell application "Google Chrome"
    tell front window
        make new tab with properties {URL:conversationURL}
        set active tab index to (count of tabs)
    end tell
end tell

-- Wait for the conversation to fully load
delay 6

-- Pick a random word and build the message
set chosenWord to some item of randomWordsList
set messageToSend to accountTag & "keepalive " & chosenWord

-- Type and send the message
tell application "System Events"
    tell application process "Google Chrome"
        set frontmost to true
    end tell

    keystroke messageToSend
    delay 1
    keystroke return
end tell

-- Wait a bit, then close the tab
delay 3
tell application "Google Chrome"
    tell front window
        close active tab
    end tell
end tell
