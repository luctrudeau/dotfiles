#!/bin/bash
# Open Google Calendar as an app

# Firefox Quantum broke this so I have to switch to chrome
#firefox -P Calendar --new-instance https://calendar.google.com/calendar/b/1/render#main_7

chromium --app=https://calendar.google.com/
