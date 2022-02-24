Feature: Put Api feature file testing

Background: 
* url 'https://gorest.co.in'
* def requestpayloads =
"""

{
    "status": "active",
    "email": "joy@gmail.com"
}

"""

Scenario: Put Api feature testing

Given path '/public/v1/users/101'
And request requestpayloads
And header Authorization = 'Bearer '+ tokenId
When method PUT
Then status 200
And match $.data.id == 101
And match $.data.name == 'Laal Iyer Jr.'
And match $.data.status == 'active'
And match $.data.email == "joy@gmail.com"

