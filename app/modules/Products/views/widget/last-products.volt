{% if products %}
<!-- section -->
<div class="section">
  <!-- container -->
  <div class="container">
    <!-- row -->
    <div class="row">
      <!-- section title -->
      <div class="col-md-12">
        <div class="section-title">
          <h2 class="title">{{helper.translate('Latest Products')}}</h2>
        </div>
      </div>
      <!-- section title -->
      {% for item in products %}
      {% set image = helper.image([
        'id': item.getId(),
        'type': 'products',
        'width': 350,
        'height': 263,
        'strategy': 'w'
      ]) %}
      {% set link = helper.langUrl(['for':'product', 'category':item.getCategorySlug(), 'slug':item.getSlug()]) %}
      {% if image.isExists() %}{% set imageExists = true %}{% else %}{% set imageExists = false %}{% endif %}
      <!-- Product Single -->
      <div class="col-md-3 col-sm-6 col-xs-6">
        <div class="product product-single">
          <div class="product-thumb">
            <a href="{{link}}" class="main-btn quick-view"><i class="fa fa-search-plus"></i>{{helper.translate('Quick view')}}</a>
            <img src="/{{item.getAnons()}}" alt="{{item.getTitle()}}" class="img-responsive">
          </div>
          <div class="product-body">
            <h3 class="product-price">${{ item.getPrice() }}</h3>
            <div class="product-rating">
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star-o empty"></i>
            </div>
            <h2 class="product-name"><a href="{{link}}">{{ item.getTitle() }}</a></h2>
            <div class="product-btns">
              <button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>
              <button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>
              <button class="primary-btn add-to-cart add_to_cart" data-thumb="/{{item.getAnons()}}" data-id="{{item.getId()}}" data-product="{{item.getTitle()}}" data-price="{{item.getPrice()}}">
                <i class="fa fa-shopping-cart"></i> {{helper.translate('Add to Cart')}}
              </button>
            </div>
          </div>
        </div>
      </div>
      <!-- /Product Single -->
      {% endfor %}
    <!-- /row -->
  </div>
  <!-- /container -->
</div>
<!-- /section -->
{% endif %}
