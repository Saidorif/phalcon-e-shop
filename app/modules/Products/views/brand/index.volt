<!--controls-->
<div class="ui segment">

    <a href="{{ url.get() }}products/admin" class="ui button">
        <i class="icon left arrow"></i> {{ helper.at('Back') }}
    </a>

    <a href="{{ url.get() }}products/brand/add" class="ui button blue">
        <i class="icon plus"></i> {{ helper.at('Add New') }}
    </a>
</div>
<!--/end controls-->

{% if entries %}

    <table class="ui table very compact celled selectable">
        <thead>
        <tr>
            <th style="width: 100px"></th>
            <th>{{ helper.at('Title') }}</th>
            <th>{{ helper.at('Category') }}</th>
        </tr>
        </thead>
        <tbody>
        {% for item in entries %}
            {% set link = url.get() ~ "products/brand/edit/" ~ item.getId() %}
            <tr>
                <td>
                    <a href="{{ link }}?lang={{ constant('LANG') }}" class="mini ui icon button">
                        <i class="icon edit"></i> ID = {{ item.getId() }}
                    </a>
                </td>
                <td><a href="{{ link }}?lang={{ constant('LANG') }}">{{ item.getTitle() }}</a></td>
                <td>{{ item.getTitle() }}</td>
            </tr>
        {% endfor %}
        </tbody>
    </table>
{% else %}
    <p>{{ helper.at('Entries not found') }}</p>
{% endif %}

{% if paginate.total_pages > 1 %}
    <div class="pagination">
        {{ partial('admin/pagination', ['paginate':paginate] ) }}
    </div>
{% endif %}
