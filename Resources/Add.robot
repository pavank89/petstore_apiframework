*** Settings ***

Library       Collections
Library       RequestsLibrary

*** Variables ***

${photoUrl}             https://petstore.swagger.io/v2/pet/9843217/uploadImage

*** Keywords ***

Uploading image of pet
        [Documentation]             Here we are uploading image
        [Tags]      API
        create session     mysession     ${base_url}
        ${file}=    GET FILE FOR STREAMING UPLOAD    ${CURDIR}/dog.jpg
        ${files}=    CREATE DICTIONARY    file    ${file}
        ${Header}     create dictionary     accept=application/json
        ${resp}    POST ON SESSION    mysession    /9843217/uploadImage    headers=${Header}    files=${files}

Add a new pet to the store
    [Documentation]        Here we are adding a new pet
    [Tags]      API
    &{category}     create dictionary      id=101     name=tuffy
    @{tags}         create List   ${category}
    @{photoUrls}    create list    ${photoUrl}
    ${Header}       create dictionary     accept=application/json     Content-Type=application/json
    &{req_body}     create dictionary   id=101      category=&{category}    name=doggie     photoUrls=@{photoUrls}      tags=@{tags}    status=available    headers=${Header}
    ${response}     post    ${base_url}     json=${req_body}        expected_status=200
    log     ${req_body}
    log     ${response.json()}