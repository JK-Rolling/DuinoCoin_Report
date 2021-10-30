# DuinoCoin_Report
Utilize Google spreadsheet to record Duino-Coin earning

### Youtube Tutorial Video
- https://youtu.be/hKi_yTh-Fpw

### Google Spreadsheet:
- https://sheets.google.com

### Google API Console:
- https://console.developers.google.com

Change in the duco_report.py script, the json filename and spreadsheet name.

```
YOUR_PRIVATE_FILE.json
YOUR_SHEET_NAME_HERE
```

### Install package
`sudo apt-get update`

`sudo apt-get upgrade`

`sudo pip3 install gspread oauth2client`

`sudo pip3 install -–upgrade google-auth-oauthlib`

### Assign execution permissions
`chmod +x duinocoin.sh`
`chmod +x duco_report.py`


### Launch script

uncomment and update `duco_report.py` file path in `duinocoin.sh`
`# cd /home/pi/duco_report`

`./duinocoin.sh`


donate DUCO's: JK_TQVM :coffee:
