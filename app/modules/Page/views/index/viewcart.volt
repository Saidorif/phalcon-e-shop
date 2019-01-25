	<!-- section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<form id="checkout-form" class="clearfix" method="post">
					<div class="col-md-12">
						<div class="order-summary clearfix">
							<div class="section-title">
								<h3 class="title">Order Review</h3>
							</div>
							<table class="shopping-cart-table table" id="cartTable">
								<thead>
									<tr>
										<th>Product</th>
										<th></th>
										<th class="text-center">Price</th>
										<th class="text-center">Quantity</th>
										<th class="text-center">Total</th>
										<th class="text-right"></th>
									</tr>
								</thead>
								<tbody>
									
								</tbody>
								<tfoot>
									<tr>
										<th class="empty" colspan="3"></th>
										<th>TOTAL</th>
										<th colspan="2" class="total"></th>
									</tr>
								</tfoot>
							</table>
							<div class="pull-right">
								<button class="primary-btn">Place Order</button>
							</div>
						</div>

					</div>
				</form>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /section -->

<script>
$(document).ready(function(){
    var carts = JSON.parse(localStorage.getItem("cartItems"));
    var allTotal = 0;
    var n = carts.length;
    for(var i = 0; i < n; i++){
        var total = carts[i].cartPrice * carts[i].cartQty;
        $('#cartTable').append('<tr>\n' +
                    '\t<td class="thumb"><img src="'+carts[i].cartImage+'" alt=""></td>\n'+
                    '\t<td class="details">\n'+
                        '\t<a href="#">'+carts[i].cartTitle+'</a>\n'+
                        // '\t<ul>\n'+
                        //     '\t<li><span>Size: XL</span></li>\n'+
                        //     '\t<li><span>Color: Camelot</span></li>\n'+
                        // '\t</ul>\n'+
                    '\t</td>\n'+
                    '\t<td class="price text-center"><strong>$'+carts[i].cartPrice+'</strong></td>\n'+
                    '\t<td class="qty text-center"><input class="input" type="number" value="'+carts[i].cartQty+'"></td>\n'+
                    '\t<td class="total text-center"><strong class="primary-color">$'+ total +'</strong></td>\n'+
                    '\t<td class="text-right"><button class="main-btn icon-btn delete_product" data-id="'+carts[i].cartId+'"><i class="fa fa-close"></i></button></td>\n'+
                '\t</tr>');
        allTotal = allTotal + carts[i].cartPrice * carts[i].cartQty;
    }
    $('#cartTable th.total').text('$'+allTotal);
});

</script>