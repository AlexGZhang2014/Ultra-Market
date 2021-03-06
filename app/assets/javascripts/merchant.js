class Merchant {
  constructor(attributes) {
    this.id = attributes.id;
    this.name = attributes.name;
    this.items = attributes.items;
    this.services = attributes.services;
  }

  static listClick(e) {
    e.preventDefault();
    $.get("/merchants.json", Merchant.successList);
  }

  static successList(data) {
    for (const merchantData of data) {
      let merchant = new Merchant(merchantData);
      merchant.listMerchant();
      merchant.listItems();
      merchant.listServices();
    }
  }

  listMerchant() {
    $("#all-merchants").append(`<h2>${this.name}</h2><br>`);
  }

  listItems() {
    for (const i in this.items) {
      if (i == 0) {
        $("#all-merchants").append(`<h3>Items:</h3><br>`);
      }
      $("#all-merchants").append(`
        <h4>${parseInt(i)+1}. <a href="/items/${this.items[i].id}">${this.items[i].name}</a></h4>
        <p>${this.items[i].description}</p>
        `);
    }
  }

  listServices() {
    for (const s in this.services) {
      if (s == 0) {
        $("#all-merchants").append(`<h3>Services:</h3><br>`);
      }
      $("#all-merchants").append(`
        <h4>${parseInt(s)+1}. <a href="/services/${this.services[s].id}">${this.services[s].name}</a></h4>
        <p>${this.services[s].description}</p>
        `);
    }
  }

  static addJavaScriptListener() {
    $("#js-all-merchants").on("click", Merchant.listClick);
  }

  static ready() {
    Merchant.addJavaScriptListener();
  }
}

$(function() {
  Merchant.ready();
});

// function Merchant(attributes) {
//   this.id = attributes.id;
//   this.name = attributes.name;
//   this.items = attributes.items;
//   this.services = attributes.services;
// }

// Merchant.listClick = function(e) {
//   e.preventDefault();
//   $.get("/merchants.json", Merchant.successList);
// }

// Merchant.successList = function(data) {
//   for (const m in data) {
//     let merchant = new Merchant(data[m]);
//     merchant.listMerchant();
//     merchant.listItems();
//     merchant.listServices();
//   }
// }

// Merchant.prototype.listMerchant = function() {
//   $("#all-merchants").append(`<h2>${this.name}</h2><br>`);
// }

// Merchant.prototype.listItems = function() {
//   for (const i in this.items) {
//     if (i == 0) {
//       $("#all-merchants").append(`<h3>Items:</h3><br>`);
//     }
//     $("#all-merchants").append(`
//       <h4>${parseInt(i)+1}. ${this.items[i].name}</h4>
//       <p>${this.items[i].description}</p>
//       `);
//   }
// }

// Merchant.prototype.listServices = function() {
//   for (const s in this.services) {
//     if (s == 0) {
//       $("#all-merchants").append(`<h3>Services:</h3><br>`);
//     }
//     $("#all-merchants").append(`
//       <h4>${parseInt(s)+1}. ${this.services[s].name}</h4>
//       <p>${this.services[s].description}</p>
//       `);
//   }
// }

// Merchant.addJavaScriptListener = function() {
//   $("#js-all-merchants").on("click", Merchant.listClick);
// }

// Merchant.ready = function() {
//   Merchant.addJavaScriptListener();
// }
