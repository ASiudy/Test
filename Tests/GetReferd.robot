*** Settings ***
Documentation  GetReferd critical flow test
Library  Selenium2Library

*** Variables ***
${browser}  chrome
${remote_url}  http://AdamArabella:0a636cd2-ef5c-441d-a277-3b51c44a229a@ondemand.saucelabs.com:80/wd/hub
${desired_capabilities}  name:Win8 + Chrome 57.0,platform:Windows 8.1,browserName:chrome,version:57.0
${signup_page}  https://gr-qa.arabel.la/practice/sign-up/account
${login_page}  https://gr-qa.arabel.la/doctor/form?step=1    #DELETE 'doctor/form?step=1' (it cause pop up with add doctor)
${mail_login_page}  https://accounts.google.com/ServiceLogin?continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&service=mail&sacu=1&rip=1#identifier
${admin_panel_page}  http://gr-api-qa.arabel.la/admin
${begin_web_text}  Welcome.
@{gmail_login}  automation@arabel.la
${office_admin_mail}  automation+gro182@ydtech.co
${account_admin_gra}  automation+gra182@ydtech.co
${doctor_mail}  automation+grd182@ydtech.co
${doctor_biography}  Biography
${doctor_education}  Education
${doctor_network}  Network 1
${patient_email}  automation+grp182@ydtech.co
${practice_name}  AutoTest182
${account_page_signup_button}  sign up
${medical_spec}  Psychiatry
${password}  poqwlkas0912
${practice_first_name}  Auto
${practice_last_name}  Test
${billing_first_name}  AutoFirstName
${billing_last_name}  AutoLastName
${billing_address1}  New York
${billing_address2}  292 Brooklyn Ave
${billing_city}  New York
${billing_zipcode}  11213
${billing_cardNo}  4012 8888 8888 1881
${billing_cardCvc}  111
${details_phone}  (646)-350-0442
${practice_admin_first_name}   AutoAdminFirstName
${practice_admin_last_name}  AutoAdminLastName
${patient_insurance}  1199SEIU Home Care
${patient_last_name}  Auto-patient last name
${patient_first_name}  Auto-patient first name
${patient_home_address}  292 Brooklyn Ave
${doctor_first_name}  AutomationDocctorekFirst
${doctor_last_name}  AutomationDoctorekLast
${appointment_date}  2017-04-01

*** Test Cases ***

Creating_Practice_and_adding_a_doctor
    [Documentation]  This test contains flow related to creating new practice and adding doctor flow during creating practice.
    [Tags]  Creating Practice and add a doctor
    Begin Web test
    Filling sign-up account page
    Filling sign-up billing page
    Filling sign-up-details page
    Sign-up details page add Practice admin
    Go next page
    Add a doctor
    End Web test

Log_in_into_e-mail_and_confirm_doctors_account
    [Documentation]  This test contains confirmation of doctor’s account and set new password.
    [Tags]  Log in into e-mail and confirm doctors account.
    begin web test
    Login to gmail
    Find email and click link
    Set doctor password
    End Web test

Open_Admin_Panel_and_turn_on_creating_referrals_for_Practice
    [Documentation]  This test contains enable possibility to creating referrals for practices.
    [Tags]  Open Admin Panel and turn on creating referrals for Practice.
    begin web test
    Open admin panel
    Turn on referrals
    End web test

Log_in_into_Practice_and_create_Referral
    [Documentation]  This test contains log in as office admin and creating referral.
    [Tags]  Log in into Practice and create Referral.
    Begin Web test
    Open login page
    login as office admin
    Open referral form
    Fillin referral form
    Issue referral
    end web test

Log_in_into_email_and_set_3_dates_as_a_Patient
    [Documentation]  This test contains log in into mailbox as a Patient and set 3 dates for appointment on patient’s page.
    [Tags]  Log in into email and set 3 appointment dates as a Patient.
    begin web test
    Login to gmail
    find referral email and click link
    set appointment dates
    end web test

#Book_new_appointment
#    [Documentation]  User login to practice and book new appointment
#    [Tags]  Login to practice and book new appointment
#    begin web test
#    open login page
#    login as office admin
#    book new appointment
#    end web test


*** Keywords ***

Begin Web test
    open browser  ${signup_page}  ${BROWSER}  remote_url=${remote_url}  desired_capabilities=${desired_capabilities}
    wait until page contains  ${begin_web_text}

Filling sign-up account page
    input text  id=practicesignupform-practice-name  ${practice_name}
    input text  id=practicesignupform-practice-admin-first-name  ${practice_first_name}
    input text  id=practicesignupform-practice-admin-last-name  ${practice_last_name}
    input text  id=practicesignupform-email  ${office_admin_mail}
    input password  id=practicesignupform-password  ${password}
    input password  id=practicesignupform-confirm_password  ${password}
    click button  ${account_page_signup_button}

Login as office admin
    wait until page contains  Email adress
    input text  css=#loginform-email  ${office_admin_mail}
    input password  css=#loginform-password  ${password}
    click button  css=body > ui-view > ui-view > div > div.splash-main > div > div > form > div.text-center > button

Filling sign-up billing page
    wait until page contains  BILLING ADDRESS AND CARD INFO
    input text  id=practicesignupbillingform-billing_first_name  ${billing_first_name}
    input text  id=practicesignupbillingform-billing_last_name  ${billing_last_name}
    input text  id=practicesignupbillingform-billing_address1  ${billing_address1}
    input text  id=practicesignupbillingform-billing_address2  ${billing_address2}
    input text  id=practicesignupbillingform-billing_city  ${billing_city}
    click element  css=#practicesignupbillingform-billing_state > a
    click element  css=#ui-select-choices-row-0-37 > div
    input text  id=practicesignupbillingform-billing_zipcode  ${billing_zipcode}
    input text  id=practicesignupbillingform-stripe_card  ${billing_cardno}
    sleep  1s
    input text  id=practicesignupbillingform-stripe_cvc  ${billing_cardcvc}
    click element  css=#practicesignupbillingform-stripe_month > a
    click element  css=#ui-select-choices-row-1-4 > div
    click element  css=#practicesignupbillingform-stripe_year > a
    click element  css=#ui-select-choices-row-2-1 > div
    click button  css=body > ui-view > div > ui-view:nth-child(2) > form > div.form-bottom_bar > div > button

Filling sign-up-details page
    wait until page contains  Great your account is created.
    click element  css=body > ui-view > div > ui-view:nth-child(2) > form > div.form-section.form-section--billing > div.page-billing-form > div > div:nth-child(4) > div > label
    input text  id=practicesignupdetailsform-email  ${office_admin_mail}
    input text  id=practicesignupdetailsform-phone  ${details_phone}

Sign-up details page add Practice admin
    click element  css=body > ui-view > div > ui-view:nth-child(2) > form > div.form-section.form-section--billing > div.page-billing-form > div > div:nth-child(4) > div > a
    input text  id=practiceAdminsForm-first_name  ${practice_first_name}
    input text  id=practiceAdminsForm-last_name  ${practice_last_name}
    input text  id=practiceAdminsForm-email  ${account_admin_gra}
    click element  css=body > ui-view > div > ui-view:nth-child(2) > form > div.form-section.form-section--billing > div.page-billing-form > div > div:nth-child(4) > div > practice-admins-form > ng-form > div > a:nth-child(2)

Go next page
    wait until page contains  EMAIL NOTIFICATIONS
    click button  next

Open login page
    go to  ${login_page}

Check confirmation account info
    wait until page contains  Great your account is created.
    click element  css=div.span_6.col > label
    input text  id=practicesignupdetailsform-email  ${office_admin_mail}
    input text  id=practicesignupdetailsform-phone  ${details_phone}
    click button  next


Add a doctor
    wait until page contains  Add a doctor.
    input text  css=body > ui-view > div > ui-view:nth-child(2) > form > div > div:nth-child(2) > div > div.tab-pane.active > div.container > div.avatar_and_form > div.avatar_and_form-form > ul > li:nth-child(1) > div > div:nth-child(1) > input  ${doctor_first_name}
    input text  css=body > ui-view > div > ui-view:nth-child(2) > form > div > div:nth-child(2) > div > div.tab-pane.active > div.container > div.avatar_and_form > div.avatar_and_form-form > ul > li:nth-child(1) > div > div:nth-child(2) > input  ${doctor_last_name}
    click element  xpath=*//li/input
    input text  xpath=html/body/div[2]/ul/li/input  ${medical_spec}
    wait until page contains  Psychiatry
    click element  css=div.select2-result-label.ui-select-choices-row-inner
    input text  css=body > ui-view > div > ui-view:nth-child(2) > form > div > div:nth-child(2) > div > div.tab-pane.active > div.container > div:nth-child(12) > div.span_3.col > input  (646)-350-0442
    input text  css=body > ui-view > div > ui-view:nth-child(2) > form > div > div:nth-child(2) > div > div.tab-pane.active > div.container > div:nth-child(12) > div.span_6.col > input  ${doctor_mail}
    click element  xpath=(//input[@type='search'])[2]
    input text  xpath=(//input[@type='search'])[3]  ${patient_insurance}
    sleep  5s
    click element  css=div.select2-result-label.ui-select-choices-row-inner > span
    click button  css=button.button.button--medium
    sleep  2s
    click element  xpath=(//input[@type='search'])[3]
    input text  xpath=(//input[@type='search'])[3]  ${doctor_network}
    sleep  3s
    click element  css=div.select2-result-label.ui-select-choices-row-inner
    input text  xpath=/html/body/ui-view/div/ui-view[2]/form/div/div[2]/div/div[2]/div[1]/div/ul[2]/li[1]/div/div/textarea  ${doctor_biography}
    input text  xpath=/html/body/ui-view/div/ui-view[2]/form/div/div[2]/div/div[2]/div[1]/div/ul[2]/li[2]/div/div/textarea  ${doctor_education}
    click button  css=div.tab-pane.active > div.form-bottom_bar > div.container > button.button.button--medium
    wait until page contains  EMAIL NOTIFICATIONS
    sleep  1s
    click button  css=div.tab-pane.active > div.form-bottom_bar > div.container > button.button.button--medium


Log out
    wait until page contains  Add a doctor.
    click link  upcoming appointments
    wait until page contains  Cancel Add a Doctor
    click button  cancel
    wait until page contains  Track your booked appointments.
    close browser


Login to gmail
    go to  ${mail_login_page}
    Input text  id=Email  @{gmail_login}
    click button  id=next
    wait until page contains  @{gmail_login}
    sleep  2s
    Input Password  Passwd  ${password}
    Click Button  Zaloguj się
    sleep  3s
    click element  id=gbqfq

Find email and click link
    input text  id=gbqfq  Your GetReferd Account information!
    sleep  2s
    click element  xpath=//div[@id='gs_atqs50_0']/table/tbody/tr/td[2]/div
    sleep  2s
    click element  id=:ir
    sleep  2s
    click element  css=a > img.CToWUd

Set doctor password
    Select Window    Title=Getreferd
    wait until page contains  Enter your password and get started.
    input text  name=new_password  ${password}
    input password  name=re_new_password  ${password}
    click button  css=button.button

Find referral email and click link
    input text  id=gbqfq  Your doctor has recommended that you see a specialist
    sleep  7s
    click element  id=gbqfb
    sleep  6s
    click element  id=:it
    click link  link=here
    sleep  3s
    Select Window    Title=Getreferd Booking Patient
    wait until page contains  ${patient_first_name}
    click link  link=get started

Set appointment dates
    sleep  2s
    input text  id=dateTime  ${appointment_date}
    sleep  1s
    click button  css=button.button.button--medium
    sleep  2s
    input text  id=dateTime  ${appointment_date}
    sleep  1s
    click button  css=button.button.button--medium
    sleep  2s
    input text  id=dateTime  ${appointment_date}
    sleep  1s
    click button  css=button.button.button--medium
    sleep  2s
    click button  css=button.button.bottom_bar-button
    sleep  3s

Open admin panel
    go to  ${admin_panel_page}
    maximize browser window
    input text  id=id_username  team@arabel.la
    input password  id=id_password  ${password}
    click button  Log in

Turn on referrals
    wait until page contains  Site administration
    click element  css=#model-practice > a > strong
    wait until page contains  Practices
    click link  ${practice_name}
    sleep  2s
    click element  id=id_is_test
    sleep  2s
    select checkbox  id=id_can_create_referral
    sleep  2s
    click button  Save

Open referral form
    sleep  3s
    click link  link=Create a referral
    wait until page contains  Cancel Add a Doctor
    click button  cancel

Fillin referral form
    sleep  3s
    click element  css=span.select2-chosen
    click element  css=#ui-select-choices-row-3-0 > div
    input text  name=patient_last_name  ${patient_last_name}
    input text  name=patient_first_name  ${patient_first_name}
    input text  name=patient_phone  ${details_phone}
    input text  name=patient_email  ${patient_email}
    sleep  1s
    click element  xpath=//div[2]/label
    input text  name=patient_home_address  ${patient_home_address}
    input text  name=zipcode  ${billing_zipcode}
    click element  xpath=//li[5]/div/div/div/a/span
    input text  xpath=(//input[@type='search'])[4]  ${patient_insurance}
    sleep  2s
    click element  css=div.select2-result-label.ui-select-choices-row-inner
    click element  xpath=//div[2]/div/a/span
    input text  xpath=(//input[@type='search'])[4]  ${medical_spec}
    sleep  3s
    click element  css=div.select2-result-label.ui-select-choices-row-inner
    click element  xpath=//li[6]/div/div/div/a/span
    #input text  xpath=(//input[@type='search'])[4]  ${practice_name}
    #sleep  2s
    #click element  css=div.select2-result-label.ui-select-choices-row-inner > span
    sleep  1s
    click button  css=button.button.button--medium

Issue referral
    sleep  5s
    click button  xpath=/html/body/ui-view/div/ui-view[2]/div[2]/div/button[2]
    wait until page contains  ${medical_spec}

Book new appointment
    sleep  1s
    click link  link=upcoming appointments
    wait until page contains  Cancel Add a Doctor
    click button  cancel
    click link  xpath=/html/body/ui-view/div/ui-view[1]/topheader/nav/ul/li[1]
    sleep  2s
    click link  link=activity + tasks
    click element  css=div.profile-name
    click element  id=time-window-1299
    sleep  2s
    click element  css=label
    click element  css=button.button
    sleep  3s

User crete referal
    open browser

End Web test
    close browser