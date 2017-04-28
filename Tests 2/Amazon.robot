*** Settings ***
Suite Setup    Open Browser    https://accounts.google.com/    firefox
Suite Teardown    Close Browser
Library  selenium2Library.robot

*** Variables ***
${undefined}    https://accounts.google.com/

*** Test Cases ***
Test Case
    open    /ServiceLogin?sacu=1&scc=1&continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&hl=pl&service=mail#identifier
    type    id=Email    adam@arabel.la
    click    id=next
    type    id=Passwd    Technicsa1
    clickAndWait    id=signIn
    type    id=gbqfq    Your GetReferd Account information!
    click    id=gbqfb
    click    id=:ix
    click    css=a > img.CToWUd
    waitForPopUp    _blank    30000
