*** Settings ***

Library       Collections
Library       RequestsLibrary

*** Variables ***




*** Keywords ***
Update an existing pet
        [Documentation]     Here we are updating the details of pet
        [Tags]      API
         &{category}    Create Dictionary      id=101     name=tuffy
        @{tags}         create List   ${category}
        ${Header}       create dictionary     accept=application/json     Content-Type=application/json
        &{req_body}=    Create Dictionary   id=101      category=&{category}    name=doggie     tags=@{tags}    status=available        headers=${Header}
        ${response}=    POST        ${base_url}     json=${req_body}        expected_status=200
        log     ${req_body}
        log     ${response.json()}
