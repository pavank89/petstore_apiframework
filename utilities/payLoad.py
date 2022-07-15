def addSingleUser():
    body = {
        "id": 111222,
        "username": "jdsn1",
        "firstName": "janardan1",
        "lastName": "dev1",
        "email": "jdsn1@gmail.com",
        "password": "janardandev1",
        "phone": "04564554551",
        "userStatus": 1
    }
    return body

def addMultipleUsers():
    body = [
    {
        "id": 2,
        "username": "jdsn2",
        "firstName": "janardan2",
        "lastName": "dev2",
        "email": "jdsn2@gmail.com",
        "password": "janardandev2",
        "phone": "04564554552",
        "userStatus": 1
    },
    {
        "id": 3,
        "username": "jdsn3",
        "firstName": "janardan3",
        "lastName": "dev3",
        "email": "jdsn3@gmail.com",
        "password": "janardandev3",
        "phone": "04564554553",
        "userStatus": 1
    },
    {
        "id": 3,
        "username": "jdsn3",
        "firstName": "janardan3",
        "lastName": "dev3",
        "email": "jdsn3@gmail.com",
        "password": "janardandev3",
        "phone": "04564554553",
        "userStatus": 1
    }
]
    return body


def addmodifiedUser():
    body = {
  "id": 2,
  "username": "jdsn2",
  "firstName": "janardan2updated",
  "lastName": "dev2updated",
  "email": "jdsn2@gmail.com",
  "password": "janardandev2",
  "phone": "04564554552",
  "userStatus": 1}
    return body