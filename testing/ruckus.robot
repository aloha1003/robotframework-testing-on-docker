*** Settings ***
Documentation     A test suite with a single test for ruckus wireless".
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Google Ruckus wireless & Snapshot the offical website
    Open Browser To Google Page
    Input Keyword   ruckus wireless
    Go to Ruckus 
    [Teardown]    Close Browser
