<p align="center">
  <img src="https://raw.githubusercontent.com/coffinsyrup/google-voice-keepalive-macos/refs/heads/main/badges/AppleScript%20Inside%20Button.png" alt="Made on Macintosh" width="88" height="31" hspace="2">
  <img src="https://raw.githubusercontent.com/coffinsyrup/google-voice-keepalive-macos/refs/heads/main/badges/Google%20Voice%20Beta%20Button%20v2.png" alt="AppleScript Inside" width="88" height="31" hspace="2">
  <img src="https://raw.githubusercontent.com/coffinsyrup/google-voice-keepalive-macos/refs/heads/main/badges/macmade2.gif" alt="Google Voice" width="88" height="31" hspace="2">
</p>


# Google Voice Keepalive for macOS

This project keeps your Google Voice numbers active on macOS. It sends one outgoing text message from each Google Voice account on a schedule. Google requires some activity every 90 days. Sending one text is enough to keep a number active.

Everything runs locally on your Mac. No cloud services. No external automation tools.

---

### How It Works

1. You create one Google Chrome profile per Google Voice account.
2. You get the direct URL for a conversation in Google Voice.
3. You fill out the AppleScript template with your profile name and URL.
4. You export the script as a Mac app.
5. You schedule the app to run automatically using the Apple Calendar.

When the scheduled time arrives, the app opens Chrome, loads the Google Voice conversation, types a keepalive message with a random word, sends it, and closes the tab.

---

### Requirements

* macOS
* Google Chrome
* Script Editor (included in macOS)
* Apple Calendar (included in macOS)
* One Chrome profile for each Google Voice account you want to maintain

---




## Step 1: Create Chrome Profiles

1. Open Google Chrome.
2. Click your profile icon in the top right.
3. Create one profile for each Google Voice account.
4. Log in to each account in its own profile.

Find the internal Chrome profile name:

1. Open each Chrome profile.
2. Visit:
   `chrome://version`
3. Look for the line called Profile Path.
4. At the end of the path, you will see something like:

   * Default
   * Profile 1
   * Profile 2
     Write down the exact folder name for each profile.




## Step 2: Get the Google Voice Conversation URL

1. Open Chrome with the Google Voice profile you want to automate.
2. Go to:
   [https://voice.google.com/messages](https://voice.google.com/messages)
3. Start a conversation with your own number or another number you control.
4. Send at least one message manually.
5. Open that conversation.
6. Copy the full URL from the address bar. It contains an itemId value.
   This URL will be used in the script.




## Step 3: Use the Template Script

Your repository contains this file:

```
src/gv_keepalive_template.applescript
```

Open it in Script Editor.
Edit the values in the CONFIGURATION section:

* profileDirectory
* conversationURL
* accountTag (optional label so you can see which account sent the message)

Save the file after making changes.




## Step 4: Export the Script as an Application

1. In Script Editor, click File.
2. Click Export.
3. File Format: Application
4. Save the file as something like:

   * Home-GV-keepalive.app
   * Work-GV-keepalive.app
5. Uncheck Stay open after run handler.
6. Leave Run Only unchecked.
7. Save the file.

Run the app once manually.
macOS will ask for Accessibility and Automation permissions. Approve them.




## Step 5: Schedule It in Apple Calendar

1. Open Calendar on macOS.
2. Create a new event.
3. Set the event to repeat monthly.
4. Click Alert.
5. Select Custom.
6. Choose Open File.
7. Select your keepalive .app file.
8. Set it to run at the time of the event.
9. Pick a time when your Mac is awake or plugged in.

Repeat the process for each Google Voice account.

---

### Security

Everything runs on your Mac only.
Nothing is uploaded or shared with third parties.
Your Google login stays inside Chrome profiles.
The script only performs simple actions inside Google Voice.

---

### Troubleshooting

If Chrome loads slowly, increase the delay values in the script.

If typing fails, make sure the exported app has permission in:
System Settings → Privacy and Security → Accessibility
and
System Settings → Privacy and Security → Automation

If your conversation URL changes, update the script.

If your Chrome profile name changes, update the profileDirectory value.

---
