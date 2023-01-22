*** Settings ***
Documentation  Keywords for april 2022 project
Library        SeleniumLibrary
Resource       myFirstRobotVariable.robot
Library        FakerLibrary




*** Keywords ***
Navigate to login page
  open Browser  ${URL}  ${BROWSER}
  Maximize Browser Window
  Element should be visible  ${HOMEPAGE_LOGO}
  Wait until Element is Visible  ${HOMEPAGE_SIGNIN_LINK}  10s
  Click Element  ${HOMEPAGE_SIGNIN_LINK}

Customer login
  [Arguments]  ${username}  ${password}
  Wait until Element is Visible  ${LOGIN_USERNAME_FIELD}  10s
  Input Text  ${LOGIN_USERNAME_FIELD}  ${username}
  Wait Until Element is Visible  ${LOGIN_PASSWD_FIELD}
  Input Text  ${LOGIN_PASSWD_FIELD}    ${password}
  Wait Until Element is Visible  ${LOGIN_BTN}
  Click Button  ${LOGIN_BTN}
  Wait until page contains  Sign out
  Click Element  class:logout

Customer login 2
  [Arguments]  ${username}  ${password}
  Wait until Element is Visible  ${LOGIN_USERNAME_FIELD}  10s
  Input Text  ${LOGIN_USERNAME_FIELD}  ${username}
  Wait Until Element is Visible  ${LOGIN_PASSWD_FIELD}
  Input Text  ${LOGIN_PASSWD_FIELD}  ${password}
  Wait Until Element is Visible  ${LOGIN_BTN}
  Click Button  ${LOGIN_BTN}
  Wait until page contains  Sign out


Retrieve User Password
  [Arguments]  ${user_email}
  wait and Click Element  ${FORGOT_PASSWORD_LINK}
  Wait Until Element is Visible  ${LOGIN_USERNAME_FIELD}
  Input Text  ${LOGIN_USERNAME_FIELD}   ${user_email}
  Wait Until Element is Visible  ${RETRIEVE_PASSWD_BTN}
  Click Element  ${RETRIEVE_PASSWD_BTN}
  wait Until page Contains  ${FORGOT_PASSWD_SUCCESS}
  wait and Click Element  xpath://*[@id="center_column"]/ul/li/a/span


Enter email for new account and navigate to information page
  ${email}=  FakerLibrary.email
  log  ${email}
  set Test Variable  ${email}
  Wait Until Element is Visible  ${CREATENEWUSER_EMAILFIELD}
  Input Text  ${CREATENEWUSER_EMAILFIELD}  ${email}
  wait and Click Element  ${CREATENEWUSER_CREATEACC_BTN}

Select user gender
  sleep  5
  wait and Click Element   ${CREATENEWUSER_GENDERBTN}

Enter user firstname
  ${firstname}=  FakerLibrary.firstname
  log  ${firstname}
  set Test Variable  ${firstname}
  Wait Until Element is Visible  ${CREATENEWUSER_FIRSTNAME}
  Input Text  ${CREATENEWUSER_FIRSTNAME}  ${firstname}

Enter user lastname
  ${lastname}=  FakerLibrary.lastname
  log  ${lastname}
  set Test Variable  ${lastname}
  Wait Until Element is Visible  ${CREATENEWUSER_LASTNAME}
  Input Text  ${CREATENEWUSER_LASTNAME}  ${lastname}

Enter User Password
  [Arguments]  ${password}
  wait Until Element is Visible  ${CREATENEWUSER_PASSWORD}
  Input Text  ${CREATENEWUSER_PASSWORD}   ${password}

Enter date of birth in days, months and years
  Sleep  5
  #wait until Element is visible  ${CREATENEWUSER_DOB_DAY}
  #Click Element  ${CREATENEWUSER_DOB_DAY}
  Select from List by Index  ${CREATENEWUSER_DOB_DAY}  10
  Sleep  5
  #wait until Element is visible  ${CREATENEWUSER_DOB_MONTH}
  Select from List By Index   ${CREATENEWUSER_DOB_MONTH}  9
  Sleep  5
  #wait until Element is visible  ${CREATENEWUSER_DOB_YEAR}
  Select from List by value  ${CREATENEWUSER_DOB_YEAR}  1990

Select news letter and option checkboxes
  #wait until Element is visible   ${CREATENEWUSER_NEWSLETTER}
  Select Checkbox  ${CREATENEWUSER_NEWSLETTER}
  #wait until Element is visible  ${CREATENEWUSER_SOP}
  Select Checkbox  ${CREATENEWUSER_SOP}

Enter user Address and City
  wait and Input Text  ${CREATENEWUSER_ADDRESS}  1 fake street
  wait and Input Text  ${CREATENEWUSER_CITY}  Chicago

select state and Enter Postal code
  #wait Until Element is Visible  ${CREATENEWUSER_STATE}
  Select From List By Label  ${CREATENEWUSER_STATE}  Illinois
  wait and Input Text  ${CREATENEWUSER_POSTCODE}  00000

Enter user phone number, Address Alias and click on the register button and assert account is created
  wait and Input Text  ${CREATENEWUSER_PHONE}  123456789
  wait and Input Text  ${CREATENEWUSER_ADD_ALIAS}  QA House
  wait and Click Element  ${CREATENEWUSER_REG_BTN}
  Wait Until Page Contains  Sign out

Sign out and close all Browsers
  #wait and Click Element  class:logout
  Close All Browsers

Select My Addressses
  [Arguments]  ${my_addressesbutton}
  wait and Click Element  ${my_addressesbutton}

Select Add a new address
  [Arguments]  ${new_addressesbutton}
  wait and Click Element  ${new_addressesbutton}

Enter new address and city for the user
  [Arguments]  ${user_new_address}
  wait and Input Text   ${CREATENEWUSER_ADDRESS}  ${user_new_address}
  wait and Input Text   ${CREATENEWUSER_CITY}  Chicago

Enter user phone number, Address Alias and click on save button
  wait and Input Text  ${CREATENEWUSER_PHONE}  123456789
  wait and Input Text  ${CREATENEWUSER_ADD_ALIAS}  QA House
  wait and Click Element   ${USER_INFO_SAVE_BTN}
  Page Should contain   QA House

Delete Address and Close Browser
   wait and Click Element  ${DELETE_NEW_ADDRESS_BTN}
   Handle Alert  Accept
   Wait until page Does not contain  QA House
   Close Browser

wait and Input Text
  [Documentation]  wait for element to be visible and enabled before interaction
  [Arguments]  ${selector}  ${text}  ${timeouts}=10s
  wait Until Element is enabled  ${selector}
  Input Text  ${selector}  ${text}

wait and Click Element
  [Documentation]  wait for element to be visible and enabled before interaction
  [Arguments]  ${selector}   ${timeouts}=10s
  wait Until Element is enabled  ${selector}
  Click Element  ${selector}



















