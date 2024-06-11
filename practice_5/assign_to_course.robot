*** Settings ***
Documentation    Assign to course
Library          SeleniumLibrary
Suite Setup       Open Browser To Login Page

*** Variables ***
${BROWSER}          Chrome
${URL}              https://neon.nexign.com/education/lists/courses/view/318da3ae-987f-4bda-99bb-eda518e182cf
${USERNAME}         Login
${PASSWORD}         Password
${LOGIN BUTTON}     xpath=//n-button/button[contains(@class, 'p-element n-button n-button--type-accent n-button--prevention- n-button--size-large')]
${ASSIGN BUTTON}    xpath=//n-button/button[contains(@class, 'p-element n-button n-button--type-accent n-button--prevention- n-button--size-large n-button--stretch-width')]
${FIRST MATERIAL BUTTON}   xpath=//div/div[contains(@class, 'n-education-course-material-view__card w-100 n-education-course-material-view__card-hover ng-star-inserted')]
${LEARNING PAGE}   xpath=//div/a[contains(@class, 'bread-crumbs-item ng-star-inserted')][2]
${FINISH FIRST MATERIAL BUTTON}   xpath=//n-button/button[contains(@class, 'p-element n-button n-button--type-accent n-button--prevention- n-button--size-large')]
${POSTMAN COURSE}   xpath=//div/n-tmp-education-personal-list-item[contains(@class, 'n-education-list__item ng-star-inserted')][3]
${USERNAME FIELD}   xpath=//div/input[contains(@class, 'p-inputtext p-component p-element n-input ng-untouched ng-pristine ng-valid')]
${PASSWORD FIELD}   xpath=//div/input[contains(@class, 'p-inputtext p-component p-element n-input ng-untouched ng-pristine ng-valid')]
${WAIT TIME}        10

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Go To Login Page
    Go To           ${URL}

Wait For Page To Load Completely
    Wait Until Page Contains Element    ${USERNAME FIELD}    timeout=${WAIT TIME}
    Wait Until Page Contains Element    ${PASSWORD FIELD}    timeout=${WAIT TIME}

Input Username
    Wait Until Element Is Visible    ${USERNAME FIELD}    ${WAIT TIME}
    Input Text                       ${USERNAME FIELD}    ${USERNAME}

Input Password
    Wait Until Element Is Visible    ${PASSWORD FIELD}    ${WAIT TIME}
    Input Text                       ${PASSWORD FIELD}    ${PASSWORD}

Submit Credentials
    Wait until element is visible    ${LOGIN BUTTON}    ${WAIT TIME}
    Click Element                    ${LOGIN BUTTON}

Assign to course
    Wait until element is visible    ${ASSIGN BUTTON}    ${WAIT TIME}
    Click Element                    ${ASSIGN BUTTON}

Open first material
    Wait until element is visible    ${FIRST MATERIAL BUTTON}    ${WAIT TIME}
    Click Element                    ${FIRST MATERIAL BUTTON}

Open Learning page
    Wait until element is visible    ${LEARNING PAGE}    ${WAIT TIME}
    Click Element                    ${LEARNING PAGE}

Finish first material
    Wait until element is visible    ${FINISH FIRST MATERIAL BUTTON}    ${WAIT TIME}
    Click Element                    ${FINISH FIRST MATERIAL BUTTON}

Open POSTMAN course
    Wait until element is visible    ${POSTMAN COURSE}    ${WAIT TIME}
    Click Element                    ${POSTMAN COURSE}


*** Test Cases ***
Assign to course
    Wait For Page To Load Completely
    Input Username
    Input Password
    Submit Credentials
    ${error}=    Run keyword and ignore error    Assign to course
    Log    ${error}
    Open Learning page
    Open POSTMAN course
    Open first material
    Finish first material

    Sleep    5 sec


