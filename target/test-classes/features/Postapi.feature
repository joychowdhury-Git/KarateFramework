Feature: Post Api feature details

Background: 
* url 'https://gorest.co.in'
* def requestpayloads =
"""

{
    "name": "Joy",
    "email": "Joy@gmail.com",
    "gender": "Male",
    "status": "active"
}

"""

Scenario: Create a user with the given data

Given path '/public/v1/users'
And request requestpayloads
And header Authorization = 'Bearer '+tokenId
When method POST
Then status 201
And match $.data.id == '#present'
And match $.data.name == '#present'
And match $.data.name == 'Joy'
And match $.data.email == 'Joy@gmail.com'



