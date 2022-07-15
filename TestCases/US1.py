

from utilities.configurations import *
from utilities.payLoad import *
from utilities.resources import *

import requests



headers={"Accept":"application/json"}
#url = getConfig()['API']['baseURL']
url="https://petstore.swagger.io/v2/user"

hed=requests.session()
hed.headers.update({"Content-Type":"application/json"})


#Add single user
addSingleUser_response=hed.post(url,json=addSingleUser(),headers=headers)
print(addSingleUser_response.json())
assert addSingleUser_response.json()['code']==200

#Add multiple users
addMultipleUser_response=hed.post(url+ ApiResources.createWithList,json=addMultipleUsers(),headers=headers)
print(addMultipleUser_response.json())
assert addMultipleUser_response.json()['code']==200

#Get Logs user into the system
response_logsUser=requests.get(url+"/login",params={"username":"jdsn1","password":"janardandev1"},headers=headers,)
assert response_logsUser.status_code==200
print(response_logsUser.json())

#Get Logs user into the system(Authentication)
se=requests.session()
se.auth=auth=('jdsn',getPassword())
response_logsUser=se.get(url+"/login",headers=headers,)
assert response_logsUser.status_code==200
print(response_logsUser.json())

#Get Logs out current logged in user session
response_logsoutUser=requests.get(url+"/logout",headers=headers,)
assert response_logsoutUser.status_code==200
print(response_logsoutUser.json())

#Get user detail
response_get=requests.get(url+"/jdsn1",)
assert response_get.status_code==200
print(response_get.json())

#Delete user
response_delete=requests.delete(url+"/jdsn1",headers=headers,)
assert response_delete.status_code==200
print(response_delete.json())

#modify user
response_modify=hed.put(url+"/jdsn2",json=addmodifiedUser(),headers=headers)
assert response_modify.status_code==200
print(response_modify.json())


