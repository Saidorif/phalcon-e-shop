{% if categorylist %}
<select class="input search-categories">
    {% for index, list in categorylist %}
    {% set url = helper.currentUrl(constant('LANG'))%}
    <a href="{{url}}products/{{list.getSlug()}}">
        <option value="{{index}}">{{list.getTitle()}}</option>
    </a>
    {% endfor %}
</select>
{% endif %}