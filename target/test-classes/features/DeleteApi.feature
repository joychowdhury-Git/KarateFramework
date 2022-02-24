Feature: Delete APi functionality

#first create the user
#Then delete the user
#then verify the user details using get

Background: 
* url 'https://gorest.co.in'
* def random_string =

"""
function(s){
	var text = "";
	var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
	for(var i=0; i<s; i++)
	 text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
	 return text;
}
"""
* def emailrandom = random_string(10)
* print emailrandom
* def requestpayloads = 

"""
{
    "name": "JoyChowdhury",
    "gender": "Male",
    "status": "active"
}
"""
* set requestpayloads.email = emailrandom + "@gmail.com"
* print requestpayloads

Scenario: Delete the user using API
#1. create user using post call
Given path '/public/v1/users'
And request requestpayloads
And header Authorization = 'Bearer '+ tokenId
When method POST
Then status 201
And match $.data.id == '#present'

#2. fetch and delete the user id 
* def userID = $.data.id
* print userID

Given path '/public/v1/users/'+userID
And header Authorization = 'Bearer '+ tokenId
When method Delete
Then status 204

#3. Verify the user is not present by Get call

Given path '/public/v1/users/'+userID
When method Get
Then status 404

