function Service(attributes) {
  this.name = attributes.name;
  this.description = attributes.description;
  this.id = attributes.id;
  this.bought = attributes.bought;
  this.completed = attributes.completed;
  this.merchant = attributes.merchant;
}

Service.submitCreateForm = function(e) {
  e.preventDefault();
  let $form_values = $(this).serialize();
  $.post("/services", $form_values, Service.successCreate, "json");
}

Service.listClick = function(e) {
  e.preventDefault();
  $.get("/services.json", Service.successList);
}

Service.nextService = function() {
  let nextId = parseInt($("#js-next-service").attr("data-id")) + 1;
  $.get("/services/" + nextId + ".json", Service.successNextService);
}

Service.successCreate = function(data) {
  let service = new Service(data);
  return service.createService();
}

Service.successList = function(data) {
  for (const i in data) {
    let service = new Service(data[i]);
    service.listService();
  }
}

Service.successNextService = function(data) {
  let service = new Service(data);
  return service.displayNextServiceData();
}

Service.prototype.createService = function() {
  $("#serviceName").text(this.name);
  $("#serviceDescription").text(this.description);
  $("#serviceMerchant").text(`Sold by: ${this.merchant.name}`);
}

Service.prototype.listService = function() {
  $("#all-services").append(`
    <h4>${this.name}</h4>
    <p>${this.description}</p>
    `);
}

Service.prototype.displayNextServiceData = function() {
  $("#serviceName").text(this.name);
  $("#serviceDescription").text(this.description);
  $("#serviceMerchant").text(this.merchant.name);
  $("#js-next-service").attr("data-id", this.id);
}

Service.addJavaScriptListener = function() {
  $("form#new_service").submit(Service.submitCreateForm);
  $("#js-all-services").on("click", Service.listClick);
  $("#js-next-service").on("click", Service.nextService);
}

Service.ready = function() {
  Service.addJavaScriptListener();
}

$(function() {
  Service.ready();
});
