{% if deals %}
<div class="row">
  <div id="product-slick-1" class="product-slick">
    {% for deal in deals %}
    {% set link = helper.langUrl(['for':'product', 'category':deal.getCategorySlug(), 'slug':deal.getSlug()]) %}
    <!-- Product Single -->
    <div class="product product-single">
      <div class="product-thumb">
        <div class="product-label">
          {% if deal.is_new %}<span>{{helper.translate('New')}}</span>{% endif %}
          {% if deal.is_sale %}<span class="sale">-{{deal.sale_amount}}%</span>{% endif %}
        </div>
        {% if deal.is_sale %}
        <ul class="product-countdown">
          <li><span>{{deal.getSaleDate('d')}}</span></li>
          <li><span>{{deal.getSaleDate('m')}}</span></li>
          <li><span>{{deal.getSaleDate('Y')}}</span></li>
        </ul>
        {% endif %}
        <a href="{{link}}" class="main-btn quick-view"><i class="fa fa-search-plus"></i> {{helper.translate('Quick view')}}</a>
        <img src="/{{deal.getAnons()}}" alt="{{deal.getTitle()}}">
      </div>
      <div class="product-body">
        <h3 class="product-price">${{deal.getPrice()}} <del class="product-old-price">${{deal.getPrice() + 12}}</del></h3>
        <div class="product-rating">
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star-o empty"></i>
        </div>
        <h2 class="product-name"><a href="{{link}}">{{deal.getTitle()}}</a></h2>
        <div class="product-btns">
          <button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>
          <button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>
          <button class="primary-btn add-to-cart add_to_cart" data-thumb="/{{deal.getAnons()}}" data-id="{{deal.getId()}}" data-product="{{deal.getTitle()}}" data-price="{{deal.getPrice()}}">
            <i class="fa fa-shopping-cart"></i> {{helper.translate('Add to Cart')}}
          </button>
        </div>
      </div>
    </div>
    <!-- /Product Single -->
    {% endfor %}
</div>
{% endif %}

