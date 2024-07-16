*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_URL}    https://internshala.com/
${BROWSER}      chrome
${EMAIL}        singlaanshi1234@gmail.com
${PASSWORD}     Gulati@1304

*** Test Cases ***
Test Login
    Set Selenium Speed    1s
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible   //*[@id="header"]/div/nav/div[3]/button[2]    10s
    Click Element   //*[@id="header"]/div/nav/div[3]/button[2]
    Wait Until Element Is Visible   id:modal_email    10s
    Input Text     id:modal_email    ${EMAIL}
    Wait Until Element Is Visible   xpath://input[@type='password' and @name='password']    10s
    Input Text     xpath://input[@type='password' and @name='password']    ${PASSWORD}
    Wait Until Element Is Visible   id:modal_login_submit    10s
    Click Button   id:modal_login_submit
    Wait Until Page Contains   Hi     20s

Navigate to Jobs Page
    Wait Until Element Is Visible   id:jobs_new_superscript    10s
    Click Element   id:jobs_new_superscript

Filter Categories
    # Select the profiles for which you want to apply
    Wait Until Element Is Visible   //*[@id="select_category_chosen"]    10s
    Click Element   //*[@id="select_category_chosen"]
    Sleep  2s

    # Select Computer Science
    Scroll Element Into View   //*[@id="select_category_chosen"]/div/ul/li[contains(., 'Computer Science')]
    Wait Until Element Is Visible   //*[@id="select_category_chosen"]/div/ul/li[contains(., 'Computer Science')]    10s
    Click Element   //*[@id="select_category_chosen"]/div/ul/li[contains(., 'Computer Science')]
    Sleep  2s

    # Select the location where you want to work
    Wait Until Element Is Visible   //*[@id="city_sidebar_chosen"]    10s
    Click Element   //*[@id="city_sidebar_chosen"]
    Sleep  2s

    Scroll Element Into View   //*[@id="city_sidebar_chosen"]/div/ul/li[contains(., 'Gurgaon')]
    Wait Until Element Is Visible   //*[@id="city_sidebar_chosen"]/div/ul/li[contains(., 'Gurgaon')]    10s
    Click Element   //*[@id="city_sidebar_chosen"]/div/ul/li[contains(., 'Gurgaon')]
    Sleep  5s

    Click Element      //*[@id="salary_values_container"]/div[5]
    Sleep  5s


    Wait Until Element Is Visible    //*[@id="select_experience_chosen"]    10s
    Click Element   //*[@id="select_experience_chosen"]
    Sleep  2s

    # Select Fresher
    Scroll Element Into View   //*[@id="select_experience_chosen"]/div/ul/li[contains(., 'Fresher')]
    Wait Until Element Is Visible   //*[@id="select_experience_chosen"]/div/ul/li[contains(., 'Fresher')]    10s
    Click Element   //*[@id="select_experience_chosen"]/div/ul/li[contains(., 'Fresher')]
    Sleep  2s

    [Teardown]    Close Browser
