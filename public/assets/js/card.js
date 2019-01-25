$(document).ready(function() {
  var add_to_cart = $(".add_to_cart");
  var locData = JSON.parse(localStorage.getItem("cartItems"));
  var shopping_cart_list = $("#shopping-cart-list");
  var productQty = $(".productQty");
  var productTotal = $("#productTotal");
  var productTotalSum = 0;
  //Fill up the cart
  function fillTheCart(data) {
    shopping_cart_list.html("");
    productQty.html(data.length);
    var cartBody = data.map(product => {
      productTotalSum = productTotal + product.cartQty * product.cartPrice;
      return (
        '<div class="product product-widget">\n' +
        '\t<div class="product-thumb">\n' +
        '\t\t<img src="' +
        product.cartImage +
        '" alt="">\n' +
        "\t</div>\n" +
        '\t<div class="product-body">\n' +
        '\t\t\t<h3 class="product-price">' +
        product.cartPrice +
        ' <span class="qty">' +
        product.cartQty +
        "</span></h3>\n" +
        '\t\t\t<h2 class="product-name"><a href="#">' +
        product.cartTitle +
        "</a></h2>\n" +
        "\t</div>\n" +
        '\t<button class="cancel-btn delete_product" data-id="' +
        product.cartId +
        '"><i class="fa fa-trash"></i></button>\n' +
        "</div>"
      );
    });
    shopping_cart_list.append(cartBody);
  }

  var data = [];
  if (locData != null) {
    data = locData;
    fillTheCart(data);
  }

  add_to_cart.on("click", function(e) {
    e.preventDefault();
    var $this = $(this);
    if (data.length > 0) {
      var qty = 0;
      $.each(data, function(key, value) {
        if (value.cartId == $this.attr("data-id")) {
          qty++;
          value.cartQty++;
        }
      });
      if (qty == 0) {
        data.push({
          cartImage: $this.attr("data-thumb"),
          cartPrice: $this.attr("data-price"),
          cartTitle: $this.attr("data-product"),
          cartQty: 1,
          cartId: $this.attr("data-id")
        });
      }
      fillTheCart(data);
    } else {
      data.push({
        cartImage: $this.attr("data-thumb"),
        cartPrice: $this.attr("data-price"),
        cartTitle: $this.attr("data-product"),
        cartQty: 1,
        cartId: $this.attr("data-id")
      });
      fillTheCart(data);
    }
    $("#addToCart").modal("show");
    localStorage.setItem("cartItems", JSON.stringify(data));
  });

  //Delete product from the cart
  // $('.delete_product').each(function(){
  //   $(this).on('click', function(){
  //   });
  // });
  $(document).on("click", ".delete_product", function(e) {
    var the_id = $(this).attr("data-id");
    var delProduct = 0;
    $.each(data, function(key, product) {
      if (product.cartId == the_id) {
        delProduct = key;
      }
    });
    data.splice(delProduct, 1);
    localStorage.setItem("cartItems", JSON.stringify(data));
    fillTheCart(data);
  });
});
