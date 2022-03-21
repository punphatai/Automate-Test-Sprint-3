*** Settings ***
Library		SeleniumLibrary
Resource	../test_1/resource.robot

*** Test Cases ***
Open Login Page
	Open Browser To Registration Page
	Login Page Should Be Open 

Admin Login
	Input User Name		${ADMIN USER}
	Sleep				1
	Input Password		${ADMIN PASSWORD}
	Click Singin Button

Go to Import Theme Page
	Click System Menu Topbar and Setup
	Click Logo and Themes items
	Click Action Button

Empty Upload
	Invalid Import Theme 1
	Refresh Page
	Sleep			1

Empty Label
	Invalid Import Theme 2
	Refresh Page
	Sleep			1

Empty Label and Upload
	Invalid Import Theme 3
	Refresh Page
	Sleep			1

Empty Label and Wrong File Type 
	Invalid Import Theme 4
	Refresh Page
	Sleep			1

Wrong File Type 
	Invalid Import Theme 5
	Refresh Page
	Sleep			1

Duplicates Label
	#Invalid Import Theme
	Import New Logo and Themes Label 1
	Click Save Button
	Sleep	2
	Succes Theme Import Alert

	#Valid Import Theme
	Click Action Button
	Invalid Import Theme 6
	Refresh Page

Duplicates Label and Wrong File Type
	Invalid Import Theme 7
	Refresh Page

Reset to default
	Delete Theme
	Sleep	2
	Delete Succes Theme Import Alert


Close Web Browser
	Close Web Browser
