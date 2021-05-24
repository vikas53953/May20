*** Settings ***
Documentation      Robot Framework test script
Library            SSHLibrary

*** Variables ***
${host}            sbx-nxos-mgmt.cisco.com
${username}        admin
${password}        Admin_1234!
${port}            8181
${timeout}         10s

*** Test Cases ***
Test SSH Connection
    Open Connection     ${host}        ${port}
    Login               ${username}    ${password}
    Execute Command     show version
    Close All Connections
