*** Settings ***
Library		SeleniumLibrary
Resource	../test_1/resource.robot

*** Test Cases ***
Open Login Page
	Open Browser To Registration Page
	Login Page Should Be Open 

Admin Login
	Input User Name		${ADMIN USER}
	Sleep	            1
	Input Password		${ADMIN PASSWORD}
	Click Singin Button

Valid Import Theme
	Click System Menu Topbar and Setup
	Click Logo and Themes items
	Click Action Button
	Import New Logo and Themes Label 1
	Click Save Button
	Sleep	2
	Succes Theme Import Alert
	Click User Open Edit Theme Setting
	Click Choose Theme
	Click Save Button
    Logout

Valid User Login
	Input User Name		${USER USERNAME}
	Sleep	1
	Input Password		${USER PASSWORD}
	Click Singin Button

User Theme Color
    sleep   2
    Check Background Color
	Check Second button background
	Check Content box background
	Check Second button background
	Check Highlight color
	Check Background body
	Check Main text color
	Check Menu text color
	Change page to Advanced
	Check Second text color
	Check Drop down menu text

User Cloud Not See Logo and Themes Function
    Go to Home page
    Click System Menu Topbar and Setup
    Check User theme
    sleep   2
    Logout

#Reset theme to Default
Reset theme to Default
	Input User Name		${ADMIN USER}
	Sleep	            1
	Input Password		${ADMIN PASSWORD}
	Click Singin Button
    
Delete Theme
	Delete Theme
	Sleep	2
	Delete Succes Theme Import Alert

Close Web Browser
	Close Web Browser
	
	