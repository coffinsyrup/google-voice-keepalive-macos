<p align="center">
  <img src="https://raw.githubusercontent.com/coffinsyrup/google-voice-keepalive-macos/refs/heads/main/badges/AppleScript%20Inside%20Button.png" alt="Made on Macintosh" width="88" height="31" hspace="2">
  <img src="https://raw.githubusercontent.com/coffinsyrup/google-voice-keepalive-macos/refs/heads/main/badges/Google%20Voice%20Beta%20Button%20v2.png" alt="AppleScript Inside" width="88" height="31" hspace="2">
  <img src="https://raw.githubusercontent.com/coffinsyrup/google-voice-keepalive-macos/refs/heads/main/badges/macmade2.gif" alt="Google Voice" width="88" height="31" hspace="2">
  <img src="https://raw.githubusercontent.com/coffinsyrup/google-voice-keepalive-macos/refs/heads/main/badges/Meatwad%20Button%20v2.png" alt="Google Voice" width="88" height="31" hspace="2">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/macOS-compatible-brightgreen" />
  <img src="https://img.shields.io/badge/AppleScript-supported-blue" />
  <img src="https://img.shields.io/badge/Google%20Voice-keepalive-yellow" />
  <img src="https://img.shields.io/badge/license-MIT-lightgrey" />
  <img src="https://img.shields.io/github/v/release/coffinsyrup/google-voice-keepalive-macos" />
</p>


# Google Voice Keepalive for macOS

This tool keeps your Google Voice numbers active by sending a small automated message on a schedule. The system uses AppleScript, Google Chrome, and Apple Calendar on macOS.

Google requires active use for each Google Voice number. If you do not call, text, or answer calls for about 90 days, the number can be reclaimed. This tool prevents that by sending automated keepalive messages.

This project supports multiple accounts. You can generate individual keepalive apps for each Google Voice number you own.

---

### How It Works

1. You create one Google Chrome profile per Google Voice account.
2. You get the direct URL for a conversation in Google Voice.
3. You fill out the AppleScript template with your profile name and URL.
4. You export the script as a Mac app.
5. You schedule the app to run automatically using the Apple Calendar.

When the scheduled time arrives, the app opens Chrome, loads the Google Voice conversation, types a keepalive message with a random word, sends it, and closes the tab.

---

### Features

* Automatic keepalive messages for Google Voice
* Works with multiple Google accounts
* Uses Chrome profiles
* Simple Setup Wizard with dialogs
* Calendar based scheduling
* No server or cloud needed
* Everything runs locally
* Open source and free

---

### Requirements

* macOS
* Google Chrome
* Apple Calendar
* One Chrome profile for each Google Voice account you want to maintain

---

## Setup Wizard (Recommended)

The easiest way to create your keepalive apps is to use the Setup Wizard.

1. Open `GV-Setup-Wizard.app`
2. Choose how many accounts you want to configure
3. Enter a short name for each account (for example HOME, WORK, SPARE)
4. Enter the Chrome profile directory for each account

   * Open Chrome
   * Go to `chrome://version`
   * Look for “Profile Path”
   * Use only the last part (Default, Profile 1, Profile 2, etc)
   
5. Paste the Google Voice conversation URL for each number
6. The wizard generates a custom AppleScript file for each account
7. Open each generated file in Script Editor
8. Export each script as an Application
9. Add each app to Apple Calendar with a repeating schedule

---

## First Run Permissions (Important)

The first time you run each exported keepalive app, macOS will ask for the following permissions:

### Accessibility

Needed so the app can type the message and press Return inside Google Chrome.

### Automation

Needed so the app can tell Chrome to open Google Voice and load the correct conversation.

### Input Monitoring (sometimes)

May appear on certain versions of macOS. This is also related to keyboard automation.

These permissions are required for the automation to work. The keepalive apps do not read your personal files and do not send data anywhere. Everything happens locally on your Mac inside your own Chrome window.

---

## Creating the Calendar Automation

1. Open Calendar
2. Create a new event
3. Set it to repeat every 60 days (or any interval under 90 days)
4. Add an alert
5. Choose “Open file”
6. Select the exported keepalive app
7. Save the event

Repeat this step for each Google Voice account.

---

## Notes

* Each account needs its own exported keepalive app
* Each app needs its own Calendar event
* Do not close Chrome too quickly while the script runs
* Make sure each account’s Chrome profile stays signed in

---
