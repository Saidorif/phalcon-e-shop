<form method="post" class="ui form" action="" enctype="multipart/form-data">

    <!--controls-->
    <div class="ui segment">

        <a href="{{ url.get() }}products/category?lang={{ constant('LANG') }}" class="ui button">
            <i class="icon left arrow"></i> {{helper.at('Back')}}
        </a>

        <div class="ui green submit button">
            <i class="save icon"></i> {{helper.at('Save')}}
        </div>

        {% if model.getId() %}

            <a href="{{ url.get() }}products/category/delete/{{ model.getId() }}?lang={{ constant('LANG') }}"
               class="ui button red">
                <i class="icon trash"></i> {{helper.at('Delete')}}
            </a>

            {% if model.getId() %}
                <a class="ui blue button" target="_blank"
                   href="{{ helper.langUrl(['for':'products','type':model.getSlug()]) }}">
                    See section on site
                </a>
            {% endif %}

        {% endif %}

    </div>
    <!--end controls-->

    <div class="ui segment">
        {{ form.renderDecorated('title') }}
        {{ form.renderDecorated('slug') }}
        <div class="field">
            <label for="parent">Родитель</label>
            <select name="parent" id="parent">
                <option value="0">Без родитель</option>
        {% if categories %}
            {% for cats in categories %}
                <option value="{{cats.getId()}}" {% if model.getParent() == cats.getId() %} selected {% endif %}>{{cats.getTitle()}}</option>
            {% endfor %}
        {% endif %}
            </select>
        </div>
        {{ form.renderDecorated('limit') }}    
        {{ form.renderDecorated('meta_title') }}
        {{ form.renderDecorated('meta_description') }}
        {{ form.renderDecorated('index_page') }}
        {{ form.renderDecorated('menu_check') }}
        {{ form.renderDecorated('text') }}
        {{ form.renderDecorated('foto') }}
    </div>

</form>

<!--ui semantic-->
<script>
    $('.ui.form').form({
        fields: {
            title: {
                identifier: 'title',
                rules: [
                    {type: 'empty'}
                ]
            },
            slug: {
                identifier: 'slug',
                rules: [
                    {type: 'empty'}
                ]
            }
        }
    });
</script><!--/end ui semantic-->