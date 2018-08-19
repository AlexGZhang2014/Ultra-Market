function Item(attributes) {
  this.name = attributes.name;
  this.description = attributes.description;
  this.id = attributes.id;
  this.bought = attributes.bought;
  this.merchant = attributes.merchant;
}

Item.submitCreateForm = function(e) {
  e.preventDefault();
  let $form_values = $(this).serialize();
  $.post("/items", $form_values, Item.successCreate, "json");
}

Item.listClick = function(e) {
  e.preventDefault();
  $.get("/items.json", Item.successList);
}

Item.nextItem = function() {
  let nextId = parseInt($("#js-next-item").attr("data-id")) + 1;
  $.get("/items/" + nextId + ".json", Item.successNextItem);
}

Item.successCreate = function(data) {
  let item = new Item(data);
  return item.createItem();
}

Item.successList = function(data) {
  for (const i in data) {
    let item = new Item(data[i]);
    item.listItem();
  }
}

Item.successNextItem = function(data) {
  let item = new Item(data);
  return item.displayNextItemData();
}

Item.prototype.createItem = function() {
  $("#itemName").text(this.name);
  $("#itemDescription").text(this.description);
  $("#itemMerchant").text(`Sold by: ${this.merchant.name}`);
}

Item.prototype.listItem = function() {
  $("#all-items").append(`
    <h4>${this.name}</h4>
    <p>${this.description}</p>
    `);
}

Item.prototype.displayNextItemData = function() {
  $("#itemName").text(this.name);
  $("#itemDescription").text(this.description);
  $("#itemMerchant").text(this.merchant.name);
  $("#js-next-item").attr("data-id", this.id);
}

$(function() {
  $("form#new_item").submit(Item.submitCreateForm);

  $("#js-all-items").on("click", Item.listClick);

  $("#js-next-item").on("click", Item.nextItem);

  // $("#js-all-merchants").on("click", function(e) {
  //   e.preventDefault();
  //   $.get("/merchants.json", function(data) {
  //     for (const m in data) {
  //       $("#all-merchants").append(`<h3>${data[m]["name"]}</h3><br>`);
  //       for (const i in data[m]["items"]) {
  //         $("#all-merchants").append(`
  //           <h4>${data[m]["items"][i].name}</h4>
  //           <p>${data[m]["items"][i].description}</p>
  //           `)
  //       }
  //     }
  //   });
  // });
});
