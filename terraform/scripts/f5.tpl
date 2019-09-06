#!/bin/bash

#wait for big-ip
sleep 240

#admin config
tmsh modify auth user admin { password F5sTe$tS3cuR! }
tmsh modify auth user admin shell bash
tmsh modify sys global-settings gui-setup disabled
tmsh modify sys provision gtm avr level nominal
sleep 60

tmsh save sys config
