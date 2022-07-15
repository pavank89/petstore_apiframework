*** Settings ***
Documentation     This is swagger documentation of this API
...               As the API user I would like to Add, Update and Remove pets.
Resource        ../Resources/Add.robot
Resource        ../Resources/Update.robot
Resource        ../Resources/Remove.robot
Library       Collections
Library       RequestsLibrary

*** Variables ***
${base_url}             https://petstore.swagger.io/v2/pet

*** Test Cases ***
Upload Adding Updating and Removing pet
    [Documentation]     Working on pet
    [Tags]      API
    Add.Uploading image of pet
    Add.Add a new pet to the store
    Update.Update an existing pet
    Remove.Remove an existing pet








