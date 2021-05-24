*** Settings ***
Library        ats.robot.pyATSRobot
Library        genie.libs.robot.GenieRobot
Library        unicon.robot.UniconRobot
Suite setup    Setup

*** Variables ***
${testbed}    yaml/testbed.yml

*** Test Cases ***
Fail Send show version test
    ${output}=    execute "show version" on device "sbx-n9kv-ao"
    Should not Contain  ${output}    version 7.3(0)D1(1)

Show version test
    ${output}=    execute "show version" on device "sbx-n9kv-ao"
    Should Contain  ${output}    version 9.3(3)

NTP config test
    ${output}=    execute "show ntp peers" on device "sbx-n9kv-ao"
    Should Contain  ${output}    Peer IP Address    172.16.0.1    172.16.1.11

Interface up test
    ${output}=    execute "show interface brief" on device "sbx-n9kv-ao"
    Should Contain  ${output}    up    10  

*** Keywords ***
Setup
    use genie testbed "${testbed}"
    connect to devices "sbx-n9kv-ao"
