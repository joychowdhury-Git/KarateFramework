Feature: Get Api Feature details

Scenario: Get Api test

Given url  baseUrl+'/public/v1/users'
And path '30'
When method GET
Then status 200
* print response
* def jsonResponse = response
* print jsonResponse
* def actName = jsonResponse.data.name
* def actID = jsonResponse.data.id
* def actEmail = jsonResponse.data.email
#* print actName
* match actName == 'Mukul Guha V'
* match actID == 30
* match actEmail == 'v_guha_mukul@willms.biz'

Scenario: Get Api test - User not found

Given url baseUrl+'/public/v1/users'
And path '2889'
When method GET
Then status 404