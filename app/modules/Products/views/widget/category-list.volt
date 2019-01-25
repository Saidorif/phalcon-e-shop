{% if categorylist %}
<!-- category nav -->
<div class="category-nav">
  <span class="category-header">{{helper.translate('Categories')}} <i class="fa fa-list"></i></span>
  <ul class="category-list">
    {% set url = helper.currentUrl(constant('LANG'))%}
    {% for list in categorylist %}
    <li><a href="{{url}}products/{{list.getSlug()}}">{{list.getTitle()}}</a></li>
    {% endfor %}
    <li><a href="{{url}}products">View All</a></li>
  </ul>
</div>
<!-- /category nav -->
{% endif %}
