# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (Merchant has_many :items)
- [x] Include at least one belongs_to relationship (Service belongs_to :client)
- [x] Include at least one has_many through relationship (Merchant has_many :clients, through: :services)
- [x] The "through" part of the has_many through includes at least one user submittable attribute (service.name, service.description)
- [x] Include reasonable validations for simple model objects (UserAccount, Item, Service)
- [x] Include a class level ActiveRecord scope method (Item.most_recent, URL: /items/most_recent)
- [x] Include signup (UserAccount resources for new and create, UserAccount validations for username and email, and has_secure_password + bcrypt gem)
- [x] Include login (get "/login" => "sessions#new", post "/login" => "sessions#create", has_secure_password + bcrypt gem)
- [x] Include logout (get "/logout" => "sessions#destroy")
- [x] Include third party signup/login (OmniAuth with Github, get "/auth/github/callback" => "sessions#create_user_with_github")
- [x] Include nested resource show or index (clients/1/items, merchants/1/services/1)
- [x] Include nested resource "new" form (merchants/1/items/new)
- [x] Include form display of validation errors (form URL /items/new, /services/new, /items/1/edit, /services/2/edit)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
