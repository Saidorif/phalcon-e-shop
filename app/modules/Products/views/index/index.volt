<!-- section -->
<div class="section">
  <!-- container -->
  <div class="container">
  {{helper.widget('Breadcrumbs').breadcrumbs()}}
    <!-- row -->
    <div class="row">
      <!-- ASIDE -->
      <div id="aside" class="col-md-3">

        <!-- aside widget -->
        <div class="aside">
          <h3 class="aside-title">Filter by Brand</h3>
          <ul class="list-links">
            <li><a href="#">Nike</a></li>
            <li><a href="#">Adidas</a></li>
            <li><a href="#">Polo</a></li>
            <li><a href="#">Lacost</a></li>
          </ul>
        </div>
        <!-- /aside widget -->

        <!-- aside widget -->
        <div class="aside">
          <h3 class="aside-title">Top Rated Product</h3>
          <!-- widget product -->
          <div class="product product-widget">
            <div class="product-thumb">
              <img src="/assets/img/thumb-product01.jpg" alt="">
            </div>
            <div class="product-body">
              <h2 class="product-name"><a href="#">Product Name Goes Here</a></h2>
              <h3 class="product-price">$32.50 <del class="product-old-price">$45.00</del></h3>
              <div class="product-rating">
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star-o empty"></i>
              </div>
            </div>
          </div>
          <!-- /widget product -->

          <!-- widget product -->
          <div class="product product-widget">
            <div class="product-thumb">
              <img src="/assets/img/thumb-product01.jpg" alt="">
            </div>
            <div class="product-body">
              <h2 class="product-name"><a href="#">Product Name Goes Here</a></h2>
              <h3 class="product-price">$32.50</h3>
              <div class="product-rating">
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star-o empty"></i>
              </div>
            </div>
          </div>
          <!-- /widget product -->
        </div>
        <!-- /aside widget -->
      </div>
      <!-- /ASIDE -->

      <!-- MAIN -->
      <div id="main" class="col-md-9">
        <!-- store top filter -->
        <div class="store-filter clearfix">
          <div class="pull-left">
            <div class="row-filter">
              <a href="#"><i class="fa fa-th-large"></i></a>
              <a href="#" class="active"><i class="fa fa-bars"></i></a>
            </div>
            <div class="sort-filter">
              <span class="text-uppercase">Sort By:</span>
              <select class="input">
                  <option value="0">Position</option>
                  <option value="0">Price</option>
                  <option value="0">Rating</option>
                </select>
              <a href="#" class="main-btn icon-btn"><i class="fa fa-arrow-down"></i></a>
            </div>
          </div>
          <div class="pull-right">
            <div class="page-filter">
              <span class="text-uppercase">Show:</span>
              <select class="input">
                  <option value="0">10</option>
                  <option value="1">20</option>
                  <option value="2">30</option>
                </select>
            </div>
            <ul class="store-pages">
              <li><span class="text-uppercase">Page:</span></li>
              <li class="active">1</li>
              <li><a href="#">2</a></li>
              <li><a href="#">3</a></li>
              <li><a href="#"><i class="fa fa-caret-right"></i></a></li>
            </ul>
          </div>
        </div>
        <!-- /store top filter -->

        <!-- STORE -->
        <div id="store">
          <!-- row -->
          <div class="row">
            {% if paginate.total_items > 0 %}
              {% for index, item in paginate.items %}
              {% set image = helper.image([
              'id': item.p.getId(),
              'type': 'products',
              'width': 270,
              'height': 360,
              'strategy': 'a'
              ]) %}
              {% set link = helper.langUrl(['for':'product', 'category':item.t_slug, 'slug':item.p.getSlug()]) %}
              {% if image.isExists() %}{% set imageExists = true %}{% else %}{% set imageExists = false %}{% endif %}
            <!-- Product Single -->
            <div class="col-md-4 col-sm-6 col-xs-6">
              <div class="product product-single">
                <div class="product-thumb">
                  <div class="product-label">
                    {% if item.is_new %}<span>{{helper.translate('New')}}</span>{% endif %}
                    {% if item.is_sale %}<span class="sale">-{{item.sale_amount}}%</span>{% endif %}
                  </div>
                  <a href="{{link}}" class="main-btn quick-view"><i class="fa fa-search-plus"></i> {{helper.translate('Quick view')}}</a>
                  {% if imageExists %}
                  {{ image.imageHTML() }}
                  {% endif %}
                </div>
                <div class="product-body">
                  <h3 class="product-price">${{ item.p.getPrice() }} <del class="product-old-price">${{ item.p.getPrice() + 13 }}</del></h3>                  <div class="product-rating">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star-o empty"></i>
                  </div>
                  <h2 class="product-name"><a href="{{link}}">{{ item.p.getTitle() }}</a></h2>
                  <div class="product-btns">
                    <button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>
                    <button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>
                    <button class="primary-btn add-to-cart add_to_cart" data-thumb="/{{item.p.getAnons()}}" data-id="{{item.p.getId()}}" data-product="{{item.p.getTitle()}}" data-price="{{item.p.getPrice()}}">
                      <i class="fa fa-shopping-cart"></i> {{helper.translate('Add to Cart')}}
                    </button>
                  </div>
                </div>
              </div>
            </div>
            <!-- /Product Single -->
            {% endfor %}
            {% endif %}
          </div>
          <!-- /row -->
        </div>
        <!-- /STORE -->

        <!-- store bottom filter -->
        <div class="store-filter clearfix">
          <div class="pull-left">
            <div class="row-filter">
              <a href="#"><i class="fa fa-th-large"></i></a>
              <a href="#" class="active"><i class="fa fa-bars"></i></a>
            </div>
            <div class="sort-filter">
              <span class="text-uppercase">Sort By:</span>
              <select class="input">
                  <option value="0">Position</option>
                  <option value="0">Price</option>
                  <option value="0">Rating</option>
                </select>
              <a href="#" class="main-btn icon-btn"><i class="fa fa-arrow-down"></i></a>
            </div>
          </div>
          <div class="pull-right">
            <div class="page-filter">
              <span class="text-uppercase">Show:</span>
              <select class="input">
                  <option value="0">10</option>
                  <option value="1">20</option>
                  <option value="2">30</option>
                </select>
            </div>
            <ul class="store-pages">
              <li><span class="text-uppercase">Page:</span></li>
              <li class="active">1</li>
              <li><a href="#">2</a></li>
              <li><a href="#">3</a></li>
              <li><a href="#"><i class="fa fa-caret-right"></i></a></li>
            </ul>
          </div>
        </div>
        <!-- /store bottom filter -->
      </div>
      <!-- /MAIN -->
    </div>
    <!-- /row -->
  </div>
  <!-- /container -->
</div>
<!-- /section -->
