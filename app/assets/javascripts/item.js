$(function() {
  $("form#new_item").submit(function(e) {
    e.preventDefault();
    let $form_values = $(this).serialize();
    $.post("/items", $form_values, function(data) {
      let item = data;
      $("#itemName").text(item.name);
      $("#itemDescription").text(item.description);
      $("#itemMerchant").text(`Sold by: ${item.merchant.name}`);
    }, "json");
  });

  $("#js-all-items").on("click", function(e) {
    e.preventDefault();
    $.get("/items.json", function(data) {
      for (const i in data) {
        $("#all-items").append(`
          <h4>${data[i].name}</h4>
          <p>${data[i].description}</p>
          `);
      }
    });
  });

  $("#js-all-merchants").on("click", function(e) {
    e.preventDefault();
    $.get("/merchants.json", function(data) {
      for (const m in data) {
        $("#all-merchants").append(`<h3>${data[m]["name"]}</h3><br>`);
        for (const i in data[m]["items"]) {
          $("#all-merchants").append(`
            <h4>${data[m]["items"][i].name}</h4>
            <p>${data[m]["items"][i].description}</p>
            `)
        }
      }
    });
  });

  $("#js-next-item").on("click", function() {
    let nextId = parseInt($("#js-next-item").attr("data-id")) + 1;
    $.get("/items/" + nextId + ".json", function(data) {
      $("#itemName").text(data.name);
      $("#itemDescription").text(data.description);
      $("#itemMerchant").text(data.merchant.name);
      $("#js-next-item").attr("data-id", data.id);
    });
  });
});
