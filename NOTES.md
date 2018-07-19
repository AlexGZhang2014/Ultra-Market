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

Account has one merchant and/or has one client

form_for automatically generates "fields_with_errors" -> validations with form_for lesson
