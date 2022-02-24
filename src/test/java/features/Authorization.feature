Feature: Headers details

Scenario: Check Authorization details

Given header Authorization = 'Bearer '+tokenId
When url  baseUrl+'/public/v1/users'
And path '30'
When method GET
Then status 200