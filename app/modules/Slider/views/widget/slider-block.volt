{% if entries %}
<!-- SLIDER -->
<div id="home">
  <!-- container -->
  <div class="container">
    <!-- home wrap -->
    <div class="home-wrap">
      <!-- home slick -->
      <div id="home-slick">
        {% for item in entries %}
        <!-- banner -->
        <div class="banner banner-1">
          <img src="/{{ item.getBanner() }}" alt="{{ item.getTitle() }}">
          <div class="banner-caption text-center">
            <h1>{{ item.getTitle() }}</h1>
            <h3 class="white-color font-weak">{{ item.getText() }}</h3>
            <button class="primary-btn">Shop Now</button>
          </div>
        </div>
        <!-- /banner -->
        {% endfor %}
      </div>
      <!-- /home slick -->
    </div>
    <!-- /home wrap -->
  </div>
  <!-- /container -->
</div>
<!-- /SLIDER -->
{% endif %}
