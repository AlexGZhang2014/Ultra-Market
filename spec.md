# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (Merchant has_many :items)
- [x] Include at least one belongs_to relationship (Service belongs_to :client)
- [x] Include at least one has_many through relationship (Merchant has_many :clients, through: :services)
- [x] The "through" part of the has_many through includes at least one user submittable attribute (service.name, service.description)
- [x] Include reasonable validations for simple model objects (UserAccount, Item, Service)
- [x] Include a class level ActiveRecord scope method (Item.most_recent, URL: /items/most_recent)
- [ ] Include signup (how e.g. Devise)
- [ ] Include login (how e.g. Devise)
- [ ] Include logout (how e.g. Devise)
- [ ] Include third party signup/login (how e.g. Devise/OmniAuth)
- [ ] Include nested resource show or index (URL e.g. users/2/recipes)
- [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
