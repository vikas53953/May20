*** Settings ***
Library                SSHLibrary
Library                OperatingSystem
Suite setup            Setup

*** Variables ***
${HOST}                sbx-nxos-mgmt.cisco.com
${USERNAME}            admin
${PASSWORD}            Admin_1234!

*** Test Cases ***
Verify Eth1/1 is up
    ${output}=         Execute Command    show run interface ethernet 1/1
    Should Contain  ${output}  switchport mode trunk  switchport trunk allowed vlan 100-110

Show version test fail
    ${output}=         Execute Command    show version
    Should not Contain  ${output}    Version 7.3(0)D1(1)

*** Keywords ***
Setup
    Open Connection  ${host}  port=8181
    Login               ${USERNAME}        ${PASSWORD}    delay=1

    Enable Ssh Logging  ssh.log
