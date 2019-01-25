{% if categorylist %}
<!-- section -->
<div class="section section-grey">
  <!-- container -->
  <div class="container">
    <!-- row -->
    <div class="row">
      <!-- banner -->
    {% for index, category in categorylist %}
    {% set link = helper.langUrl(['for':'product', 'category':category.getSlug()]) %}
      {% if index == 0 %}
      <div class="col-md-8">
        <div class="banner banner-1">
          <img src="/{{category.getFoto()}}" alt="{{category.getTitle()}}">
          <div class="banner-caption text-center">
            <h1 class="primary-color">{{category.getTitle()}}<br><span class="white-color font-weak">Up to 50% OFF</span></h1>
            <a href="{{link}}" class="primary-btn">Shop Now</a>
          </div>
        </div>
      </div>
      <!-- /banner -->
      {% else %}
      <!-- banner -->
      <div class="col-md-4 col-sm-6">
        <a class="banner banner-1" href="{{link}}">
          <img src="/{{category.getFoto()}}" alt="{{category.getTitle()}}">
          <div class="banner-caption text-center">
            <h2 class="white-color">{{category.getTitle()}}</h2>
          </div>
        </a>
      </div>
      <!-- /banner -->
      {% endif %}
    {% endfor %}
    </div>
    <!-- /row -->
  </div>
  <!-- /container -->
</div>
<!-- /section -->
{% endif %}
