*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${ADMIN USER}                   admin
${ADMIN PASSWORD}               JnWdBx6BSs
${USER USERNAME}                user_test
${USER PASSWORD}                Test@123
${THEME NAME_1}                 test_import_theames_1
${THEME NAME_2}                 test_import_theames_2
${DELAY}                        0
${LOGOLINK}		                https://i.imgur.com/MRSWq6d.png
${font}		                    Courier New
${BROWSER}                      Chrome
${LOGIN LINK}                   http://localhost:8000/authentication/login/
${FILE LOCATION_1}		        D://SoftEN/test_3/test_1/test.css
${FILE LOCATION_2}              D://SoftEN/test_3/pink_style.css

${INVALID_FILE}                 D://SoftEN/user_test.txt
${INVALID_FILE_JPG}             D://SoftEN/hqdefault.jpg

${ALERT SUCCES}                 Theme created successfully.
${ALERT DELETE}                 Theme deleted successfully.

${bg_color}                     rgb(37, 142, 199)
${bg_main_menu}                 rgb(213, 34, 255)
${Content_box_bg}               rgb(255, 34, 161)
${Second_button_bg}             rgb(255, 218, 103)
${Highlight_color}              rgb(141, 75, 255)
${bg_body}                      rgb(255, 255, 255)
${Main_text_color}              rgb(255, 90, 0)
${Menu_text_color}              rgb(0, 255, 109)
${Second_text_color}            rgb(255, 75, 75)
${Drop_down_menu_text}          rgb(139, 255, 0)

#Please select a file           
${Invalid_TEX_BOX_FILE}         Please select a file.
#Please fill out this field         
${Invalid_TEX_BOX_LABEL}        Please fill out this field.



*** Keywords ***
Open Browser To Registration Page
    Open Browser          ${LOGIN LINK}   ${BROWSER}
    Set Selenium Speed    ${DELAY}

Login Page Should Be Open 
    Title Should Be       Login

Input User Name
    [Arguments]     ${username}
    Input Text      name=username   ${username}

Input Password
    [Arguments]     ${password}
    Input Text      name=password   ${password}

Click Singin Button
	Click Element   name=submit

Click System Menu Topbar and Setup
    Wait until Page Contains Element	Xpath=//*[@title="Home"]
	Click Element	                    Xpath=//li[@class="dropdown"]
	Click Element	                    Xpath=//a[@href="/setup/"]

Click Logo and Themes items
	Wait until Page Contains Element	Xpath=//*[@title="Setup items"]
	Click Element	                    Xpath=//a[contains(text(),'Logo & Themes')]

Click Action Button
    Wait until Page Contains Element	Xpath=//h3[@title="Logo and Themes"]
	Click Element	                    Xpath=//div[@id='menu-actions']
    Click Element	                    Xpath=//a[contains(text(),'Import new logo and theme')]

Import New Logo and Themes Label 1
    Wait until Page Contains Element	xpath=//h3[@title="Import new logo and themes"]
	Input Text	                        xpath=//input[@id='id_label']	 ${THEME NAME_1}
	sleep	                            1
	Choose File		                    xpath=//input[@id='id_import_file'] 	${FILE LOCATION_1}

Import New Logo and Themes Label 2
    Wait until Page Contains Element	xpath=//h3[@title="Import new logo and themes"]
	Input Text	                        xpath=//input[@id='id_label']	 ${THEME NAME_2}
	sleep	                            1
	Choose File		                    xpath=//input[@id='id_import_file'] 	${FILE LOCATION_2}

Succes Theme Import Alert
    Element Text Should Be      //*[@id="toast-container"]/div/div      ${ALERT SUCCES}

Delete Succes Theme Import Alert
    Element Text Should Be      //*[@id="toast-container"]/div/div      ${ALERT DELETE}   

Click User Open Edit Theme Setting
	sleep	6
	Wait Until Element Is Visible    xpath://*[@id="navbar"]/ul/li[2]/a
    Click Element                    xpath://*[@id="navbar"]/ul/li[2]/a
    Wait Until Element Is Visible    xpath://*[@id="navbar"]/ul/li[2]/ul/li[11]/a
	Click Element                    xpath://*[@id="navbar"]/ul/li[2]/ul/li[11]/a

Click Choose Theme
    Wait Until Element Is Visible  	xpath://*[@id="select2-id_theme-container"]
	Click Element                   xpath://*[@id="select2-id_theme-container"]
	Click Element	                Xpath=//input[contains(@class,'select2-search__field')]
	Sleep	                        2
	Input Text		                Xpath=//input[contains(@class,'select2-search__field')]	${THEME NAME_1}
	Sleep	                        2
	Press Keys    	                Xpath=//input[contains(@class,'select2-search__field')]    ENTER

Click Save Button
	Click Element   name=submit

Delete Theme
    sleep	                                    6
	Click Element	                            Xpath=//li[@class="dropdown"]
	Click Element	                            Xpath=//a[@href="/setup/"]

	Wait until Page Contains Element	        Xpath=//*[@title="Setup items"]
	Click Element	                            Xpath=//a[contains(text(),'Logo & Themes')]

	Wait until Page Contains Element	        Xpath=//h3[@title="Logo and Themes"]
	Click Element	                            Xpath=//a[contains(text(),'Delete')]
	Wait until Page Contains Element	        Xpath=//h3[contains(text(),'Are you sure?')]
	Click Element	                            Xpath=//button[@class='btn btn-danger']
	
	Sleep	3
    
Close Web Browser
    Close Browser

Check Background Color
    ${test_background_color} =  Execute Javascript  return window.getComputedStyle(document.getElementById("menu-main"), null).getPropertyValue('background-color');
    Should Be Equal As Strings    ${bg_color}    ${test_background_color}

Check Second color background main menu
    ${test_bg_menu} =   Execute Javascript  return window.getComputedStyle(document.querySelector(".input-group-btn a.btn-primary"), null).getPropertyValue('background-color');
    Should Be Equal As Strings    ${bg_main_menu}    ${test_bg_menu}

Check Content box background
    ${test_Content_box_bg} =   Execute Javascript  return window.getComputedStyle(document.querySelector(".well"), null).getPropertyValue('background-color');
    Should Be Equal As Strings    ${Content_box_bg}    ${test_Content_box_bg}

Check Second button background
    ${test_Second_button_bg} =   Execute Javascript  return window.getComputedStyle(document.querySelector(".btn-default:not(.btn-danger)"), null).getPropertyValue('background-color');
    Should Be Equal As Strings    ${Second_button_bg}    ${test_Second_button_bg}

Check Highlight color
    ${test_Highlight_color} =   Execute Javascript  return window.getComputedStyle(document.querySelector(".well a:not(.btn)"), null).getPropertyValue('color');
    Should Be Equal As Strings    ${Highlight_color}    ${test_Highlight_color}

Check Background body
    ${test_bg_body} =   Execute Javascript  return window.getComputedStyle(document.querySelector("body"), null).getPropertyValue('background-color');
    Should Be Equal As Strings    ${bg_body}    ${test_bg_body}

Check Main text color
    ${test_Main_text_color} =   Execute Javascript  return window.getComputedStyle(document.querySelector("h3#content-title"), null).getPropertyValue('color');
    Should Be Equal As Strings    ${Main_text_color}    ${test_Main_text_color}

Check Menu text color
    ${test_Menu_text_color} =   Execute Javascript  return window.getComputedStyle(document.querySelector(".navbar.navbar-default.navbar-fixed-top #navbar > ul > li > a"), null).getPropertyValue('color');
    Should Be Equal As Strings    ${Menu_text_color}    ${test_Menu_text_color}

Check Change page to create cabinets
    Click Element    xpath=//*[@id="heading-cabinets"]/h4/a/div[1]
    sleep            1
    Click Element    xpath=//*[@id="accordion-body-2"]/div/ul/li/a
    sleep            1

Check Second text color
    ${test_Second_text_color} =   Execute Javascript  return window.getComputedStyle(document.querySelector(".well p.help-block"), null).getPropertyValue('color');
    Should Be Equal As Strings    ${Second_text_color}    ${test_Second_text_color}

Check Drop down menu text
    ${test_Drop_down_menu_text} =   Execute Javascript  return window.getComputedStyle(document.querySelector(".navbar.navbar-default.navbar-fixed-top .dropdown-menu li a"), null).getPropertyValue('color');
    Should Be Equal As Strings    ${Drop_down_menu_text}    ${test_Drop_down_menu_text}

Change page to Advanced
    Click Element   xpath=//*[@id="btnSearchAdvanced"]
    sleep   1
    
Go to Home page
    Click Element   xpath=//a[@class='navbar-brand']
    sleep   1

Logout
    Click Element   xpath=//*[@id="navbar"]/ul/li[2]/a
    Click Element   xpath=//*[@id="navbar"]/ul/li[2]/ul/li[15]/a

Check User theme
    Page Should Not Contain Element    Xpath=//a[contains(text(),'Logo & Themes')]

#Empty Upload
Invalid Import Theme 1
    Wait until Page Contains Element	xpath=//h3[@title="Import new logo and themes"]
	Input Text	                        xpath=//input[@id='id_label']	 Empty_File_Test
	sleep                               1
    Click Element                       name=submit
    sleep                               1
	Page Should Contain Element         xpath=//*[@id="viewport"]/div[3]/form/div[1]

#Empty Label
Invalid Import Theme 2
    Wait until Page Contains Element	xpath=//h3[@title="Import new logo and themes"]
    sleep   1
    Choose File		                    xpath=//input[@id='id_import_file'] 	${FILE LOCATION_1}
    sleep   1                                        
    Page Should Contain Element         xpath=//*[@id="viewport"]/div[3]/form/div[1] 

#Empty Label and Upload 
Invalid Import Theme 3
    Wait until Page Contains Element	xpath=//h3[@title="Import new logo and themes"]
	sleep                               1
    Click Element                       name=submit
    sleep                               1
	Page Should Contain Element         xpath=//*[@id="viewport"]/div[3]/form/div[1]

#Empty Label and Wrong File Type 
Invalid Import Theme 4
    Wait until Page Contains Element	xpath=//h3[@title="Import new logo and themes"]
    sleep                               1
    Choose File		                    xpath=//input[@id='id_import_file'] 	${INVALID_FILE_JPG}
    sleep                               1
    Click Element                       name=submit
    Page Should Contain Element         xpath=//*[@id="viewport"]/div[3]/form/div[1]
    Page Should Contain Element         xpath=//*[@id="viewport"]/div[3]/form/div[2]

#Wrong File Type 
Invalid Import Theme 5
    Wait until Page Contains Element	xpath=//h3[@title="Import new logo and themes"]
    sleep                               1
    Input Text	                        xpath=//input[@id='id_label']	 Invalid_File_Test
    sleep                               1
    Choose File		                    xpath=//input[@id='id_import_file'] 	${INVALID_FILE_JPG}
    sleep                               1
    Click Element                       name=submit
    Page Should Contain Element         xpath=//*[@id="viewport"]/div[3]/form/div[1]

#Theme Label Already Exists
Invalid Import Theme 6
    # Invalid Import theme
    Wait until Page Contains Element	xpath=//h3[@title="Import new logo and themes"]
	Input Text	                        xpath=//input[@id='id_label']	 ${THEME NAME_1}
	sleep	                            1
	Choose File		                    xpath=//input[@id='id_import_file'] 	${FILE LOCATION_1}
    Click Element                       name=submit
    Page Should Contain Element         xpath=//*[@id="viewport"]/div[3]/form/div[1]

#Duplicates Label and Wrong File Type
Invalid Import Theme 7
    Wait until Page Contains Element	xpath=//h3[@title="Import new logo and themes"]
	Input Text	                        xpath=//input[@id='id_label']	 ${THEME NAME_1}
	sleep	                            1
	Choose File		                    xpath=//input[@id='id_import_file'] 	${INVALID_FILE_JPG}
    Click Element                       name=submit
    Page Should Contain Element         xpath=//*[@id="viewport"]/div[3]/form/div[1]
    Page Should Contain Element         xpath=//*[@id="viewport"]/div[3]/form/div[2]



Refresh Page
    Execute Javascript    window.location.reload(true);
