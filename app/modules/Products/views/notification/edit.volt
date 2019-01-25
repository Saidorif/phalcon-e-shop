<form method="post" class="ui form" action="" enctype="multipart/form-data">

    <!--controls-->
    <div class="ui segment">
        <a href="{{ url.get() }}products/notification?lang={{ constant('LANG') }}" class="ui button">
            <i class="icon left arrow"></i> {{ helper.at('Back') }}
        </a>

        <div class="ui green submit button">
            <i class="save icon"></i> {{ helper.at('Save') }}
        </div>

        {% if model.getId() %}

            <a href="{{ url.get() }}products/notification/delete/{{ model.getId() }}?lang={{ constant('LANG') }}" class="ui button red">
                <i class="icon trash"></i> {{ helper.at('Delete') }}
            </a>

            <a href="{{ url.get() }}products/notification/send/{{ model.getId() }}?lang={{ constant('LANG') }}" class="ui primary basic button">
                <i class="icon trash"></i> {{ helper.at('Send') }}
            </a>
            

        {% endif %}

    </div>
    <!--end controls-->

    <div class="ui segment">
        <div class="ui grid">
            <div class="ten sixteen column">
                {{ form.renderDecorated('title') }}
                {% if products %}
                <select class="products-select" name="products[]" multiple="multiple">
                    {% for product in products %}
                    <option value="{{product.getId()}}" "{% if selectedProducts %}{% for sel in selectedProducts %}{% if sel == product.getId() %} selected {% endif %}{% endfor %}{% endif %}>{{product.getTitle()}}</option>
                    {% endfor %}"
                </select>           
                {% endif %}     
                {{ form.renderDecorated('message') }}
                <input type="hidden" name="status" value="{{model.getStatus()}}" />
            </div>
        </div>
    </div>

</form>

<!--ui semantic-->
<script>
    $( ".ui.form" ).form({
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

<script>
$(document).ready(function() {
    $('.products-select').select2();
});
</script>

<script type="text/javascript" src="{{ url.get() }}vendor/tinymce/tinymce.min.js"></script>
<script type="text/javascript">
  tinymce.init({ selector:'#message',
  language: 'ru',
  height: 500,
  plugins: [
    "advlist autolink autosave link image lists charmap print preview hr anchor pagebreak spellchecker",
    "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking responsivefilemanager",
    "table contextmenu directionality emoticons template textcolor paste textcolor colorpicker textpattern"
  ],

  toolbar1: "bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | styleselect formatselect fontselect fontsizeselect",
  toolbar2: "cut copy paste | bullist numlist | blockquote | link unlink | responsivefilemanager image media | code | forecolor backcolor | table | subscript superscript",

  menubar: false,
  image_advtab: true ,
  external_filemanager_path:"/vendor/responsive_filemanager/filemanager/",
  filemanager_title:"Responsive Filemanager" ,
  external_plugins: { "filemanager" : "/vendor/responsive_filemanager/filemanager/plugin.min.js"},
  toolbar_items_size: 'small'});
</script>
