class Item {
  constructor(attributes) {
    this.name = attributes.name;
    this.description = attributes.description;
    this.id = attributes.id;
    this.bought = attributes.bought;
    this.merchant = attributes.merchant;
  }

  static submitCreateForm(e) {
    e.preventDefault();
    let $form_values = $(this).serialize();
    $.post("/items", $form_values, Item.successCreate, "json");
  }

  static listClick(e) {
    e.preventDefault();
    $.get("/items.json", Item.successList);
  }

  static nextItem() {
    let nextId = parseInt($("#js-next-item").attr("data-id")) + 1;
    $.get("/items/" + nextId + ".json", Item.successNextItem);
  }

  static successCreate(data) {
    let item = new Item(data);
    return item.createItem();
  }

  static successList(data) {
    for (const i in data) {
      let item = new Item(data[i]);
      item.listItem();
    }
  }

  static successNextItem(data) {
    let item = new Item(data);
    return item.displayNextItemData();
  }

  createItem() {
    $("#itemName").text(this.name);
    $("#itemDescription").text(this.description);
    $("#itemMerchant").text(`Sold by: ${this.merchant.name}`);
  }

  listItem() {
    $("#all-items").append(`
      <h4>${this.name}</h4>
      <p>${this.description}</p>
      `);
  }

  displayNextItemData() {
    $("#itemName").text(this.name);
    $("#itemDescription").text(this.description);
    $("#itemMerchant").text(this.merchant.name);
    $("#js-next-item").attr("data-id", this.id);
  }

  static addJavaScriptListener() {
    $("form#new_item").submit(Item.submitCreateForm);
    $("#js-all-items").on("click", Item.listClick);
    $("#js-next-item").on("click", Item.nextItem);
  }

  static ready() {
    Item.addJavaScriptListener();
  }
}

$(function() {
  Item.ready();
});

// function Item(attributes) {
//   this.name = attributes.name;
//   this.description = attributes.description;
//   this.id = attributes.id;
//   this.bought = attributes.bought;
//   this.merchant = attributes.merchant;
// }

// Item.submitCreateForm = function(e) {
//   e.preventDefault();
//   let $form_values = $(this).serialize();
//   $.post("/items", $form_values, Item.successCreate, "json");
// }

// Item.listClick = function(e) {
//   e.preventDefault();
//   $.get("/items.json", Item.successList);
// }

// Item.nextItem = function() {
//   let nextId = parseInt($("#js-next-item").attr("data-id")) + 1;
//   $.get("/items/" + nextId + ".json", Item.successNextItem);
// }

// Item.successCreate = function(data) {
//   let item = new Item(data);
//   return item.createItem();
// }

// Item.successList = function(data) {
//   for (const i in data) {
//     let item = new Item(data[i]);
//     item.listItem();
//   }
// }

// Item.successNextItem = function(data) {
//   let item = new Item(data);
//   return item.displayNextItemData();
// }

// Item.prototype.createItem = function() {
//   $("#itemName").text(this.name);
//   $("#itemDescription").text(this.description);
//   $("#itemMerchant").text(`Sold by: ${this.merchant.name}`);
// }

// Item.prototype.listItem = function() {
//   $("#all-items").append(`
//     <h4>${this.name}</h4>
//     <p>${this.description}</p>
//     `);
// }

// Item.prototype.displayNextItemData = function() {
//   $("#itemName").text(this.name);
//   $("#itemDescription").text(this.description);
//   $("#itemMerchant").text(this.merchant.name);
//   $("#js-next-item").attr("data-id", this.id);
// }

// Item.addJavaScriptListener = function() {
//   $("form#new_item").submit(Item.submitCreateForm);
//   $("#js-all-items").on("click", Item.listClick);
//   $("#js-next-item").on("click", Item.nextItem);
// }

// Item.ready = function() {
//   Item.addJavaScriptListener();
// }
