*** Settings ***
Library		SeleniumLibrary
Resource	resource.robot

*** Test Cases ***
Open Login Page
	Open Browser To Registration Page
	Login Page Should Be Open 

Valid Login
	Input User Name		${ADMIN USER}
	Sleep				1
	Input Password		${ADMIN PASSWORD}
	Click Singin Button

Valid Import Theme
	Click System Menu Topbar and Setup
	Click Logo and Themes items
	Click Action Button

	#Theme_1
	Import New Logo and Themes Label 1
	Click Save Button
	Sleep	2
	Succes Theme Import Alert
	#Theme_2
	Click Action Button
	Import New Logo and Themes Label 2
	Click Save Button
	Sleep	2
	Succes Theme Import Alert
	

	Click User Open Edit Theme Setting
	Click Choose Theme
	Click Save Button

Valid Import Theme Color
	Go to Home page
	Check Background Color
	Check Second button background
	Check Content box background
	Check Second button background
	Check Highlight color
	Check Background body
	Check Main text color
	Check Menu text color
	Check Change page to create cabinets
	Check Second text color
	Check Drop down menu text

Delete Theme
	#Delete Theme_1
	Delete Theme
	Sleep	2
	Delete Succes Theme Import Alert
	#Delete Theme_2
	Delete Theme
	Sleep	2
	Delete Succes Theme Import Alert

Close Web Browser
	Close Web Browser
	




