Feature: Get Api with Query parameter

Scenario: Get All active users using query parameter

* def query = {status:'active', gender: 'male'}

Given url  baseUrl+'/public/v1/users'
And params query
When method GET
Then status 200
* print response
* def usercount = response.data.length
* print usercount