*** Setting ***
Documentation    This suit file handles all the test case related to the
...      invalid credentials
Library    SeleniumLibrary
Resource    ../base/common_functionalites.resource


Test Setup  Launch Browser
Test Teardown  End Browser


Test Template      Verify InValid Credentials Template

*** Test Cases ***
TC1    john   john123   Dutch
Tc2      peter  peter123   Danish
TC3       Mark     Mark123    Greek


*** Keywords ***
Verify InValid Credentials Template
  [Arguments]    ${username}     ${password}    ${language}    ${expected_title}
  Input Text    id=authUser    ${username}
  Input Text    id=clearPass    ${password}
  Select From List By Label    name=languageChoice      ${language}
  Click Element    xpath=//button[@type='submit']
  Element Should Contain    //div[contains(text(),'Invalid')]    ${expected_output}