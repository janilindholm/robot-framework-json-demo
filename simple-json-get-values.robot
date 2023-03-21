*** Settings ***
Documentation     Robot Framework JSON demo
Suite Setup       Suite Setup
Library           String
Library           OperatingSystem
Library           RPA.JSON
Library           DateTime

# Define variables here

*** Variables ***
${suiteTearDownText}    This is the end!
${suiteSetupText}       This is the beginning!


#########################################
## Start extending your variables here ##
#########################################

*** Test Cases ***
JSON Print
	[Documentation]	Loads test.json, converts it to string and prints the values
    Load JSON and print values


Value Print
	[Documentation]	Prints the 2nd value of the json
    Get 2nd value

##########################################
## Start extending your test cases here ##
##########################################	
	
*** Keywords ***
Suite Setup       Run Keyword    This is the beginning!
Suite Teardown    Run Keyword    This is the end!


Load JSON and print values
    ${json}=    Load JSON from file    tests.json
    ${all_ids}=    Get values from JSON    ${json}    $..id
    ${json_string}=    Convert JSON to String  ${all_ids}
    Log To Console    ${json}
    Log To Console    ${json_string}

Get 2nd value
    ${json}=    Load JSON from file    tests.json
    ${2ndValue}=   Get value from JSON    ${json}    $.testers[1].id
    Log To Console    ${2ndValue}

This is the beginning!
    Log To Console    ${suiteSetupText}
This is the end!
    Log To Console    ${suiteTearDownText}
	
########################################
## Start extending your keywords here ##
########################################