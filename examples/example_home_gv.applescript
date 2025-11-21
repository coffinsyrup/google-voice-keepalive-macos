(*
 Example: Home Google Voice account keepalive
 This is a sample filled-out script based on the template.
 Values here are FAKE and must be replaced by the user.
*)

--------------------
-- CONFIGURATION  --
--------------------

-- Chrome profile directory name (from chrome://version → Profile Path)
-- Example: "Default" is usually the first profile created
property profileDirectory : "Default"

-- Example Google Voice conversation URL (FAKE EXAMPLE)
-- Users should replace this with their own conversation URL
property conversationURL : "https://voice.google.com/u/0/messages?itemId=t.EXAMPLE_HOME_THREAD"

-- Tag so you know which account sent it
property accountTag : "[HOME GV] "

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
