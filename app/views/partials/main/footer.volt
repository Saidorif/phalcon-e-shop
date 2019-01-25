<!-- FOOTER -->
<footer id="footer" class="section section-grey">
  <!-- container -->
  <div class="container">
    <!-- row -->
    <div class="row">
      <!-- footer widget -->
      <div class="col-md-3 col-sm-6 col-xs-6">
        <div class="footer">
          <!-- footer logo -->
          <div class="footer-logo">
            <a class="logo" href="#">
              <img src="./img/logo.png" alt="">
            </a>
          </div>
          <!-- /footer logo -->

          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna</p>

          <!-- footer social -->
          <ul class="footer-social">
            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
            <li><a href="#"><i class="fa fa-instagram"></i></a></li>
            <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
            <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
          </ul>
          <!-- /footer social -->
        </div>
      </div>
      <!-- /footer widget -->

      <!-- footer widget -->
      <div class="col-md-3 col-sm-6 col-xs-6">
        <div class="footer">
          <h3 class="footer-header">My Account</h3>
          <ul class="list-links">
            <li><a href="#">My Account</a></li>
            <li><a href="#">My Wishlist</a></li>
            <li><a href="#">Compare</a></li>
            <li><a href="#">Checkout</a></li>
            <li><a href="#">Login</a></li>
          </ul>
        </div>
      </div>
      <!-- /footer widget -->

      <div class="clearfix visible-sm visible-xs"></div>

      <!-- footer widget -->
      <div class="col-md-3 col-sm-6 col-xs-6">
        <div class="footer">
          <h3 class="footer-header">Customer Service</h3>
          <ul class="list-links">
            <li><a href="#">About Us</a></li>
            <li><a href="#">Shiping & Return</a></li>
            <li><a href="#">Shiping Guide</a></li>
            <li><a href="#">FAQ</a></li>
          </ul>
        </div>
      </div>
      <!-- /footer widget -->

      <!-- footer subscribe -->
      <div class="col-md-3 col-sm-6 col-xs-6">
        <div class="footer">
          <h3 class="footer-header">Stay Connected</h3>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.</p>
          <form>
            <div class="form-group">
              <input class="input" placeholder="Enter Email Address">
            </div>
            <button class="primary-btn">Join Newslatter</button>
          </form>
        </div>
      </div>
      <!-- /footer subscribe -->
    </div>
    <!-- /row -->
    <hr>
    <!-- row -->
    <div class="row">
      <div class="col-md-8 col-md-offset-2 text-center">
        <!-- footer copyright -->
        <div class="footer-copyright">
          <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
          Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
          <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
        </div>
        <!-- /footer copyright -->
      </div>
    </div>
    <!-- /row -->
  </div>
  <!-- /container -->
  <!-- Modal -->
<div class="modal fade" id="addToCart" tabindex="-1" role="dialog" aria-labelledby="addToCartLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        {{helper.translate('Product added to cart')}}
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">{{helper.translate('Ok')}}</button>
      </div>
    </div>
  </div>
</div>
</footer>
<!-- /FOOTER -->

