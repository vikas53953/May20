*** Settings ***
Documentation          This example demonstrates executing a command on a remote machine
...                    and getting its output.
...
...                    Notice how connections are handled as part of the suite setup and
...                    teardown. This saves some time when executing several test cases.

Library                SSHLibrary
Suite Setup            Open Connection And Log In
Suite Teardown         Close All Connections

*** Variables ***
${HOST}                ios-xe-mgmt.cisco.com
${USERNAME}            developer
${PASSWORD}            C1sco12345

*** Test Cases ***
Hello John
    ${stdout}=	Execute Command	echo 'Hello John!'
    Should Contain	${stdout}	Hello John!


*** Keywords ***
Open Connection And Log In
   Open Connection     ${HOST}    por=8181
   Login               ${USERNAME}        ${PASSWORD}
