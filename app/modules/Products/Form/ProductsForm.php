<?php

namespace Products\Form;

use Application\Form\Element\Image;
use Application\Form\Element\Images;
use Phalcon\Forms\Element\Check;
use Phalcon\Validation\Validator\PresenceOf;
use Application\Form\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Numeric;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Forms\Element\Select;
use \Phalcon\Forms\Element\File;
use Products\Model\Category;
use Products\Model\Brand;

class ProductsForm extends Form
{

    public function initialize()
    {
        $category = new Select('category_id', Category::cachedListArray(['key' => 'id']));
        $category->setLabel('Категория');
        $this->add($category);
        
        $in_stock = new Check('in_stock');
        $in_stock->setLabel('Есть на складе');
        $this->add($in_stock);

        $brand = new Select('brand_id',
            Brand::find(),
            [
               'using' => ['id','slug'],
               'useEmpty' => true,
               'emptyText' => 'Бренд',
               'emptyValue' => ''
            ]);
        $brand->setLabel('Бренды');
        $this->add($brand);

        $title = new Text('title', ['required' => true]);
        $title->addValidator(new PresenceOf([
            'message' => 'Title can not be empty'
        ]));
        $title->setLabel('Заголовок');
        $this->add($title);

        $slug = new Text('slug', ['required' => true]);
        $slug->setLabel('Ссылка');
        $this->add($slug);

        $text = new TextArea('text');
        $text->setLabel('Характеристика');
        $this->add($text);

        $price = new Numeric("price", ['value' => 0]);
        $price->setLabel('Цена');
        $this->add($price);

        $special_offer = new Check('special_offer');
        $special_offer->setLabel('Спецпредложение');
        $this->add($special_offer);

        $meta_description = new TextArea('meta_description');
        $meta_description->setLabel('Meta-description');
        $this->add($meta_description);

        $meta_title = new TextArea('meta_title');
        $meta_title->setLabel('Meta-title');
        $this->add($meta_title);

        $image = new Image('anons', ['required' => true]);
        $image->setLabel('Изображение');
        $this->add($image);

        $photos = new Images('photos');
        $photos->setLabel('Фотографии');
        $this->add($photos);

        $index_page = new Check('index_page');
        $index_page->setLabel('Отключить индексацию');
        $this->add($index_page);

        $is_new = new Check('is_new');
        $is_new->setLabel('Новый продукт');
        $this->add($is_new);

        $is_sale = new Check('is_sale');
        $is_sale->setLabel('Скидка есть');
        $this->add($is_sale);

        $sale_ends = new Text('sale_ends');
        $sale_ends->setLabel('Дата окончание скидки');
        $this->add($sale_ends);

        $sale_amount = new Text('sale_amount');
        $sale_amount->setLabel('Процент скидки');
        $this->add($sale_amount);
    }

}
