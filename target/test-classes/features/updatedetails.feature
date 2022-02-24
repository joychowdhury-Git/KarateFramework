Feature: post details and then update the details by taking id

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
    "name": "Joy",
    "gender": "Male",
    "status": "active"
}
"""
* set requestpayloads.email = emailrandom + "@gmail.com"
* print requestpayloads

Scenario: create the user details by post call and then use put call to update the user
#create user using post call
Given path '/public/v1/users'
And request requestpayloads
And header Authorization = 'Bearer '+tokenId
When method POST
Then status 201
And match $.data.id == '#present'

# fetch the user id 
* def userID = $.data.id
* print userID

# update the user using put call

* def requestpayloadsput = 

"""
{
    "gender": "female",
    "status": "inactive"
}
"""
Given path '/public/v1/users/'+userID
And request requestpayloadsput
And header Authorization = 'Bearer '+ tokenId
When method PUT
Then status 200
And match $.data.id == userID
And match $.data.gender == 'female'
And match $.data.status == 'inactive'












