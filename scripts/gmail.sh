#!/bin/bash
# Open Google Gmail as an app

# Firefox Quantum broke this so I have to switch to chrome
#firefox -P Gmail --new-instance https://mail.google.com/mail/u/1/#inbox

chromium --app=https://mail.google.com/mail/u/1/#inbox
