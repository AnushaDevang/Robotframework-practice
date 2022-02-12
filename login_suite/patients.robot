*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
TC1
  Open Browser   browser=chrome   executable_path=${EXECDIR}${/}drivers${/}chromedriver
  Maximize Browser Window
  Set Selenium Implicit Wait    30s
  Go To    url=https://demo.openemr.io/b/openemr/interface/login/login.php?site=default
  Input Text    id=authUser    admin
  Input Password    id=clearPass   pass
  Click Element    xpath=//*[@id="login_form"]/div[1]/div[1]/div[4]/button
  Click Element    link=Patient/Client