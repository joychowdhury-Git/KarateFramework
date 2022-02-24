Feature: Post Api feature details

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
    "name": "Rriti",
    "gender": "Female",
    "status": "active"
}

"""
* requestpayloads.email = emailrandom + "@gmail.com"
* print requestpayloads

Scenario: Create a user with the given data

Given path '/public/v1/users'
And request requestpayloads
And header Authorization = 'Bearer '+tokenId
When method POST
Then status 201
And match $.data.id == '#present'
And match $.data.name == '#present'
And match $.data.name == 'Rriti'
And match $.data.email == requestpayloads.email



