import requests
import unittest
from utilities.payLoadUnitTest import *


class TestCaseUnit(unittest.TestCase):

    def test_upload_image(self):
        url = "https://petstore.swagger.io/v2/pet/9843217/uploadImage"
        files = {'file':open('dog.jpg','rb')}
        r = requests.post(url, files=files)
        print(r.status_code)
        print(r.text)
        assert r.status_code == 200

    def test_add_pet(self):
        addPet_response = requests.post("https://petstore.swagger.io/v2/pet", json=addPet(), headers={"Accept": "application/json", "Content-Type": "application/json"}, )
        print(addPet_response.status_code)
        assert addPet_response.status_code == 200

    def test_update_pet(self):
        updatePet_response = requests.put("https://petstore.swagger.io/v2/pet", json=updatePet(), headers={"Accept": "application/json", "Content-Type": "application/json"})
        print(updatePet_response.status_code)
        assert updatePet_response.status_code == 200

    def test_delete_pet(self):
        deletePet_response = requests.delete("https://petstore.swagger.io/v2/pet/10",
                                             headers={"Accept": "application/json"})
        print(deletePet_response.status_code)
        assert deletePet_response.status_code == 200


if __name__ == '__main__':
    unittest.main()
