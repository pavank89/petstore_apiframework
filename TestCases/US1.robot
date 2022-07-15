*** Settings ***
Library    RequestsLibrary
Library       Collections

*** Variables ***
${url_userlogin}        https://petstore.swagger.io/v2/user/login?username=jdsn&password=jdsn123
${url_userlogout}       https://petstore.swagger.io/v2/user/logout
*** Test Cases ***

Create User
    &{data}=    Create dictionary    id=1    username=jdsn    firstname=janardan    lastname=dev    email=janardandev@gmail.com    password=jdsn123    phone=0456455455    userStatus=0
    ${resp}=    POST    https://petstore.swagger.io/v2/user   json=${data}
    Status Should Be                 200        ${resp}
    Should Be Equal As Strings    1         ${resp.json()}[message]

Get User Details
    ${response}=    GET    https://petstore.swagger.io/v2/user/jdsn
    Status Should Be                 200    ${response}
    log    ${response}
    Should Be Equal As Strings    jdsn    ${response.json()}[username]

Delete User
    ${response}=    DELETE    https://petstore.swagger.io/v2/user/jdsn
    Status Should Be                 200    ${response}
    log    ${response}
    Should Be Equal As Strings    jdsn      ${response.json()}[message]

Modify User
    &{data}=    Create dictionary    id=1    username=jdsnM    firstname=janardanM    lastname=devM    email=janardandevm@gmail.com    password=jdsn@123    phone=0456455455    userStatus=0
    ${resp}=    PUT    https://petstore.swagger.io/v2/user/jdsn   json=${data}
    Status Should Be                 200    ${resp}
    Should Be Equal As Strings    1     ${resp.json()}[message]

    ${response}=    GET    https://petstore.swagger.io/v2/user/jdsnM
    Should Be Equal As Strings    jdsnM    ${response.json()}[username]

Create Multiple Users

    &{data1}=    Create dictionary    id=11     username=jd11     firstName=janardan1     lastName=dev1     email=jdev1@gmail.com       password=jd@1231      phone=4564554551       userStatus=0
    &{data2}=    Create dictionary    id=21      username=jd21     firstName=janardan2     lastName=dev2     email=jdev2@gmail.com       password=jd@1232      phone=4564554552       userStatus=0
    &{data3}=    Create dictionary    id=31      username=jd31     firstName=janardan3     lastName=dev3     email=jdev3@gmail.com       password=jd@1233      phone=4564554553       userStatus=0
    @{req_body}=    create list     ${data1}    ${data2}    ${data3}

    ${response}=    POST    https://petstore.swagger.io/v2/user/createWithList      json=${req_body}        expected_status=200
    log     ${req_body}
    log     ${response.json()}
    Status Should Be                 200  ${response}
   Should Be Equal As Strings    ok    ${response.json()}[message]

Get User Login

    ${response}=    GET       ${url_userlogin}
    Status Should Be                 200    ${response}



Get User Logout

    ${response}=    GET       ${url_userlogout}
    Status Should Be                 200    ${response}

