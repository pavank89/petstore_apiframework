*** Settings ***

Library       Collections
Library       RequestsLibrary

*** Variables ***

${base_urldelete}       https://petstore.swagger.io/v2/pet/101


*** Keywords ***
Remove an existing pet
        [Documentation]     Here we are removing pet
        [Tags]      API
         &{category}=       Create Dictionary      id=101     name=tuffy
        @{tags}=            create List   ${category}
         ${Header}          create dictionary     accept=application/json
        &{req_body}=        Create Dictionary   id=101      category=&{category}    name=doggie     tags=@{tags}    status=available        headers=${Header}
        ${response}=        delete        ${base_urldelete}     json=${req_body}        expected_status=200
        log     ${req_body}
        log     ${response.json()}