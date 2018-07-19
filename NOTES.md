Ultra Market is an online marketplace where merchants can sell items and/or services and clients can post items/services needed.
Merchant has many items and has many clients through items
Merchant also has many services and has many clients through services
Item belongs to merchant and belongs to client - make relationship optional for client
Service belongs to merchant and belongs to client - make relationship optional for client
Client has many items and has many merchants through services?
Client has many services and has many merchants through services?

Merchant has name, bio, category?
Client has name and bio
Item has name and description
Service has name and description

Merchant class vs Client class - log in as either?

One account class that belongs to Merchant or belongs to Client - different functionality for each, but with different ids? - Let's try this one!
Have checkboxes upon creating an account. Have validations for each one.

class UserAccount
  belongs_to :merchant, optional: true
  belongs_to :client, optional: true

Account has one merchant and/or has one client

form_for automatically generates "fields_with_errors" -> validations with form_for lesson

So the general workflow will be that a user_account will be able to sign up, log in, log out, and .build_merchant and/or .build_client. UserAccount controller will have index, new, create, edit, update, destroy actions.

Items controller and Services controller will have all standard CRUD actions. Merchant and Client controllers will only have new and create actions.

Class methods
Items and services should both have #most_recent and #oldest for sorting by date.
Items should have an #available class method that checks for items such that item.quantity > 0
Services should have an #available class method that checks for services such that service.completed = false
