Feature: Headers details

Scenario: Check headers details_Part 1

Given header Connection = 'keep-alive'
And header Accept-Encoding = 'gzip, deflate, br'

When url  baseUrl+'/public/v1/users'
And path '30'
When method GET
Then status 200
* print response

Scenario: Check headers details_Part 2

* def request_header = {Connection:'keep-alive',Accept-Encoding: 'gzip, deflate, br' }
Given headers request_header

When url  baseUrl+'/public/v1/users'
And path '30'
When method GET
Then status 200
* print response


Scenario: Check headers details_Part 3

* configure headers = {Connection:'keep-alive',Accept-Encoding: 'gzip, deflate, br' }
When url  baseUrl+'/public/v1/users'
And path '30'
When method GET
Then status 200
* print response

