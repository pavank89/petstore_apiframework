def addPet():
    body = {
            "id": 10,
            "category": {
                "id": 10,
                "name": "lucy"
            },
            "name": "cat",
            "photoUrls": [
                "https://petstore.swagger.io/v2/pet/9843217/uploadImage"
            ],
            "tags": [
                {
                    "id": 10,
                    "name": "lucy"
                }
            ],
            "status": "available"
        }
    return body

def updatePet():
    body = {
            "id": 10,
            "category": {
                "id": 10,
                "name": "lucy"
            },
            "name": "doggie",
            "photoUrls": [
                "string"
            ],
            "tags": [
                {
                    "id": 10,
                    "name": "doggie"
                }
            ],
            "status": "available"
        }
    return body