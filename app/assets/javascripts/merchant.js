function Merchant(attributes) {
  this.id = attributes.id;
  this.name = attributes.name;
  this.items = attributes.items;
}

Merchant.listClick = function(e) {
  e.preventDefault();
  $.get("/merchants.json", Merchant.successList);
}

Merchant.successList = function(data) {
  for (const m in data) {
    let merchant = new Merchant(data[m]);
    merchant.listMerchant();
    merchant.listMerchantItems();
  }
}

Merchant.prototype.listMerchant = function() {
  $("#all-merchants").append(`<h3>${this.name}</h3><br>`);
}

Merchant.prototype.listMerchantItems = function() {
  for (const i in this.items) {
    $("#all-merchants").append(`
      <h4>${this.items[i].name}</h4>
      <p>${this.items[i].description}</p>
      `)
  }
}

$(function() {
  $("#js-all-merchants").on("click", Merchant.listClick);
});
