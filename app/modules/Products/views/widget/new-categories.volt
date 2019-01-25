{% if categorylist %}

<!-- section -->
<div class="section">
  <!-- container -->
  <div class="container">
    <!-- row -->
    <div class="row">
      {% for index, category in categorylist %}
      {% set link = helper.langUrl(['for':'product', 'category':category.getSlug()]) %}
      <!-- banner -->
      <div class="col-md-4 col-sm-6 {% if index == 2 %} col-md-offset-0 col-sm-offset-3 {% endif %}">
        <a class="banner banner-1" href="{{link}}">
          <img src="/{{category.getFoto()}}" alt="{{category.getTitle()}}">
          <div class="banner-caption text-center">
            <h2 class="white-color">{{category.getTitle()}}</h2>
          </div>
        </a>
      </div>
      <!-- /banner -->
      {% endfor %}
    </div>
    <!-- /row -->
  </div>
  <!-- /container -->
</div>
<!-- /section -->
{% endif %}
