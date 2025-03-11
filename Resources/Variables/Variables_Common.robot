*** Variables ***
# Test Data --------------------------------
${ExcelFile}                   ${CURDIR}\\..\\..\\TestData\\InputData.xlsx
&{WEB}                         IOT=https://10.138.40.47:3443/login
...                            E2E=https://10.138.40.47:4443/login
${BROWSER}                     chromium
${VIEWPORT}                    {'width': 1366, 'height': 768}
${wait_state_timeout}          5s
