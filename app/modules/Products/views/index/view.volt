<!-- section -->
<div class="section">
  <!-- container -->
  <div class="container">
    {{ helper.widget('Breadcrumbs').breadcrumbs('products', 'category') }}
    <!-- row -->
    <div class="row">
      <!--  Product Details -->
      <div class="product product-details clearfix">
        <div class="col-md-6">
          <div id="product-main-view">
            <div class="product-view">
              <img src="/{{productsResult.p.getAnons()}}" alt="">
            </div>
            {% for key, photo in productsGallery %}
              <div class="product-view">
                <img src="/{{photo.getFile()}}" alt="">
              </div>
              {% endfor %}
          </div>
          <div id="product-view">
            {% for key, photo in productsGallery %}
              {% set image = helper.image([
              'id': photo.getFileId(),
              'type': 'products_gallery',
              'width': 137,
              'height': 137,
              'strategy': 'wh'
              ]) %}
              <div class="product-view">
                <img src="/{{photo.getFile()}}" alt="">
              </div>
              {% endfor %}
          </div>
        </div>
        <div class="col-md-6">
          <div class="product-body">
            <div class="product-label">
              {% if productsResult.p.is_new %}<span>{{helper.translate('New')}}</span>{% endif %}
              {% if productsResult.p.is_sale %}<span class="sale">{{helper.translate('Sale')}}-{{productsResult.p.sale_amount}}%</span>{% endif %}
            </div>
            <h2 class="product-name">{{ productsResult.title }}</h2>
            <h3 class="product-price">${{productsResult.p.getPrice()}} <del class="product-old-price">${{productsResult.p.getPrice() + 5.55}}</del></h3>
            <div>
              <div class="product-rating">
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star-o empty"></i>
              </div>
              <a href="#">3 Review(s) / Add Review</a>
            </div>
            <p>
              <strong>{{helper.translate('Availability')}}:</strong>
              {% if productsResult.p.in_stock %} {{helper.translate('Available')}} {% endif %}
            </p>
            <p>
              <strong>{{helper.translate('Brand')}}:</strong>
              {% if productsResult.p.brand %}
              {{productsResult.p.brand.getTitle()}}
              {% endif %}
            </p>
            {{productsResult.p.getText()}}

            <div class="product-btns">
              <div class="qty-input">
                <span class="text-uppercase">{{helper.translate('QTY')}}: </span>
                <input class="input" type="number">
              </div>
              <button class="primary-btn add-to-cart add_to_cart" data-thumb="/{{productsResult.p.getAnons()}}" data-id="{{productsResult.p.getId()}}" data-product="{{productsResult.p.getTitle()}}" data-price="{{productsResult.p.getPrice()}}">
                <i class="fa fa-shopping-cart"></i> {{helper.translate('Add to Cart')}}
              </button>
              <div class="pull-right">
                <button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>
                <button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>
                <button class="main-btn icon-btn"><i class="fa fa-share-alt"></i></button>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-12">
          <div class="product-tab">
            <ul class="tab-nav">
              <li class="active"><a data-toggle="tab" href="#tab1">{{helper.translate('Description')}}</a></li>
              <li><a data-toggle="tab" href="#tab1">{{helper.translate('Details')}}</a></li>
              <li><a data-toggle="tab" href="#tab2">Reviews (3)</a></li>
            </ul>
            <div class="tab-content">
              <div id="tab1" class="tab-pane fade in active">
                {{productsResult.p.getText()}}
              </div>
              <div id="tab2" class="tab-pane fade in">

                <div class="row">
                  <div class="col-md-6">
                    <div class="product-reviews">
                      <div class="single-review">
                        <div class="review-heading">
                          <div><a href="#"><i class="fa fa-user-o"></i> John</a></div>
                          <div><a href="#"><i class="fa fa-clock-o"></i> 27 DEC 2017 / 8:0 PM</a></div>
                          <div class="review-rating pull-right">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o empty"></i>
                          </div>
                        </div>
                        <div class="review-body">
                          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Duis aute
                            irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
                        </div>
                      </div>

                      <div class="single-review">
                        <div class="review-heading">
                          <div><a href="#"><i class="fa fa-user-o"></i> John</a></div>
                          <div><a href="#"><i class="fa fa-clock-o"></i> 27 DEC 2017 / 8:0 PM</a></div>
                          <div class="review-rating pull-right">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o empty"></i>
                          </div>
                        </div>
                        <div class="review-body">
                          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Duis aute
                            irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
                        </div>
                      </div>

                      <div class="single-review">
                        <div class="review-heading">
                          <div><a href="#"><i class="fa fa-user-o"></i> John</a></div>
                          <div><a href="#"><i class="fa fa-clock-o"></i> 27 DEC 2017 / 8:0 PM</a></div>
                          <div class="review-rating pull-right">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o empty"></i>
                          </div>
                        </div>
                        <div class="review-body">
                          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Duis aute
                            irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
                        </div>
                      </div>

                      <ul class="reviews-pages">
                        <li class="active">1</li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#"><i class="fa fa-caret-right"></i></a></li>
                      </ul>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <h4 class="text-uppercase">Write Your Review</h4>
                    <p>Your email address will not be published.</p>
                    <form class="review-form">
                      <div class="form-group">
                        <input class="input" type="text" placeholder="Your Name" />
                      </div>
                      <div class="form-group">
                        <input class="input" type="email" placeholder="Email Address" />
                      </div>
                      <div class="form-group">
                        <textarea class="input" placeholder="Your review"></textarea>
                      </div>
                      <div class="form-group">
                        <div class="input-rating">
                          <strong class="text-uppercase">Your Rating: </strong>
                          <div class="stars">
                            <input type="radio" id="star5" name="rating" value="5" /><label for="star5"></label>
                            <input type="radio" id="star4" name="rating" value="4" /><label for="star4"></label>
                            <input type="radio" id="star3" name="rating" value="3" /><label for="star3"></label>
                            <input type="radio" id="star2" name="rating" value="2" /><label for="star2"></label>
                            <input type="radio" id="star1" name="rating" value="1" /><label for="star1"></label>
                          </div>
                        </div>
                      </div>
                      <button class="primary-btn">Submit</button>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- /Product Details -->
    </div>
    <!-- /row -->
  </div>
  <!-- /container -->
</div>
<!-- /section -->

{% if relProducts %}
<!-- section -->
<div class="section">
  <!-- container -->
  <div class="container">
    <!-- row -->
    <div class="row">
      <!-- section title -->
      <div class="col-md-12">
        <div class="section-title">
          <h2 class="title">{{helper.translate('Picked For You')}}</h2>
        </div>
      </div>
      <!-- section title -->
      {% for prods in relProducts %}
      {% set link = helper.langUrl(['for':'product', 'category':prods.getCategorySlug(), 'slug':prods.getSlug()]) %}
      <!-- Product Single -->
      <div class="col-md-3 col-sm-6 col-xs-6">
        <div class="product product-single">
          <div class="product-thumb">
            <a href="{{link}}" class="main-btn quick-view"><i class="fa fa-search-plus"></i> {{helper.translate('Quick view')}}</a>
            <img src="/{{prods.getAnons()}}" alt="{{prods.getTitle()}}">
          </div>
          <div class="product-body">
            <h3 class="product-price">${{prods.getPrice()}}</h3>
            <div class="product-rating">
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star-o empty"></i>
            </div>
            <h2 class="product-name"><a href="#">{{prods.getTitle()}}</a></h2>
            <div class="product-btns">
              <button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>
              <button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>
              <button class="primary-btn add-to-cart add_to_cart" data-thumb="/{{prods.getAnons()}}" data-id="{{prods.getId()}}" data-product="{{prods.getTitle()}}" data-price="{{prods.getPrice()}}">
                <i class="fa fa-shopping-cart"></i> {{helper.translate('Add to Cart')}}
              </button>
            </div>
          </div>
        </div>
      </div>
      <!-- /Product Single -->
      {% endfor %}
    </div>
    <!-- /row -->
  </div>
  <!-- /container -->
</div>
<!-- /section -->
{% endif %}
