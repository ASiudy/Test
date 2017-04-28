*** Settings ***
Documentation  Fillin Practice Form
Library  Selenium2Library

*** Keywords ***

Create new practice
    input text  id=practicesignupform-practice-name  ${practice_name}
    input text  id=practicesignupform-practice-admin-first-name  ${practice_first_name}
    input text  id=practicesignupform-practice-admin-last-name  ${practice_last_name}
    input text  id=practicesignupform-email  ${cyc}
    input password  id=practicesignupform-password  ${cyc+pass}
    input password  id=practicesignupform-confirm_password  ${cyc+pass}
    click button  sign up
