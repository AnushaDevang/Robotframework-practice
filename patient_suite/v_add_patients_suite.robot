*** Settings ***
Documentation   This suite file verifies all test cases related to valid credentials
Library     SeleniumLibrary
Library     OperatingSystem
Resource    ../base/common_functionality.resource

Test Setup      Launch Browser
#Test Teardown   End Browser

Test Template       Verify add patients Template

*** Test Cases ***
TC1     admin   pass    English (Indian)

*** Keywords ***
Verify add patients Template
    [Arguments]     ${username}     ${password}     ${language}
     Input Text    id=authUser   ${username}
     Input Password    id=clearPass    ${password}
     Select From List By Label    name=languageChoice     ${language}
     Click Element    xpath=//button[@type='submit']

     Click Element    xpath=//div[text()='Patient/Client']
     Click Element    xpath=//div[text()='Patients']
     Click Element    xpath=//button[text()='Add New Patient']
     Input Text    xpath=//input[@id='form_fname']    Anusha
     Input Text    xpath=//input[@id='form_lname']    p
     Click Element    xpath=//input[@id='form_DOB']
     Click Element    xpath=//div[text()='11']

     #Mouse Down    id=form_sex
     Select From List By Label    id=form_sex      Female
     Click Element    id=create
     Sleep    5s
     ${alert_text}  Handle Alert   action=ACCEPT   timeout=10s