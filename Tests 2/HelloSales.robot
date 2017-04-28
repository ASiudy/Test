*** Settings ***
Documentation  This is some basic info about the whole suite
Library  Selenium2Library

*** Variables ***

*** Test Cases ***
User go to admin panel and turn on referals
    open browser  http://gr-api-qa.arabel.la/admin  chrome
    input text  id=id_username  team@arabel.la
    input password  id=id_password  poqwlkas0912
    click button  Log in
    wait until page contains  Site administration
    click element  css=#model-practice > a > strong
    wait until page contains  Practices
    click link  ${practice_name}
    click element  id=id_is_test
    select checkbox  id=id_can_create_referral
    sleep  2s
    click button  Save


*** Keywords ***


