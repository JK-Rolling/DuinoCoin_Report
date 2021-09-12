import sys
import datetime, time
import gspread
from oauth2client.service_account import ServiceAccountCredentials

scope = ['https://spreadsheets.google.com/feeds','https://www.googleapis.com/auth/drive']
creds = ServiceAccountCredentials.from_json_keyfile_name('YOUR_PRIVATE_FILE.json', scope)
client = gspread.authorize(creds)
sheet = client.open("YOUR_SHEET_NAME_HERE").sheet1

time = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
data = sys.argv[1]
values = [time,data]
sheet.append_row(values)
