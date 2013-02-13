Feature: Signing in
Scenario: Unsuccessful signin
	Given a user visits the signin page
	When he submits invalid signin information
	Then he should see an error messsage

Scenario: Successful signin
	Given a user visits the signin page
	And   the user has an account
	When  the useer submits valid signin information
	Then  he should see his profile page
	And   he should see a signout link

