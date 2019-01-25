<!--controls-->
<div class="ui segment">

    <a href="{{ url.get() }}products/admin" class="ui button">
        <i class="icon left arrow"></i> {{ helper.at('Back') }}
    </a>
    <a href="{{ url.get() }}products/notification/add" class="ui button blue">
        <i class="icon plus"></i> {{ helper.at('Add New') }}
    </a>

</div>
<!--/end controls-->

{% if paginate.total_items > 0 %}

    <table class="ui table very compact celled selectable">
        <thead>
        <tr>
            <th style="width: 100px">ID</th>
            <th>{{ helper.at('Title') }}</th>
            <th>{{ helper.at('Message') }}</th>
            <th>{{ helper.at('Status') }}</th>
        </tr>
        </thead>
        <tbody>
        {% for item in paginate.items %}
            {% set link = url.get() ~ "products/notification/edit/" ~ item.getId() %}
            <tr>
                <td><a href="{{ link }}?lang={{ constant('LANG') }}" class="mini ui icon button"><i
                                class="icon edit"></i> id = {{ item.getId() }}</a></td>
                <td><a href="{{ link }}?lang={{ constant('LANG') }}">{{ item.getTitle() }}</a></td>
                <td>{{item.getMessage()}}</td>
                <td>
                {% if item.getStatus() == "new" %}
                    <a class="ui tag label">New</a>
                {% endif %}
                {% if item.getStatus() == 'success' %}
                    <a class="ui teal tag label">Success</a>
                {% endif %}
                </td>
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
