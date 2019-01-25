<?php

namespace Products\Widget;

use Application\Widget\AbstractWidget;
use Products\Model\Products;
use Products\Model\Category;

class ProductsWidget extends AbstractWidget
{

    public function lastProducts($limit = 8)
    {
        $products = Products::query()
        ->orderBy('created_at DESC')
        ->limit($limit)
        ->execute();

        $this->widgetPartial('widget/last-products', ['products' => $products]);
    }

    //Category list at in index page sidebar
    public function categoryList($limit = 7)
    {
        $categoryList = Category::query()
        ->orderBy('id DESC')
        ->limit($limit)
        ->execute();

        $this->widgetPartial('widget/category-list', ['categorylist' => $categoryList]);
    }

    //Category list at in index page sidebar
    public function categoryDropdownList($limit = 20)
    {
        $categoryList = Category::query()
        ->orderBy('id DESC')
        ->limit($limit)
        ->execute();

        $this->widgetPartial('widget/category-dropdown', ['categorylist' => $categoryList]);
    }

    //Categories at in index page (banner)
    public function specialCategores($limit = 3)
    {
        $categoryList = Category::query()
        ->orderBy('id ASC')
        ->where('index_page = 1')
        ->limit($limit)
        ->execute();

        $this->widgetPartial('widget/spec-categories', ['categorylist' => $categoryList]);
    }

    //Categories at in index page (grid)
    public function newCategores($limit = 3)
    {
        $categoryList = Category::query()
        ->orderBy('id ASC')
        ->where('index_page = 1')
        ->limit($limit)
        ->execute();

        $this->widgetPartial('widget/new-categories', ['categorylist' => $categoryList]);
    }

    //Deals of the day
    public function dealsOfTheDay($limit = 10)
    {
        $deals = Products::query()
        ->orderBy('id DESC')
        ->where('special_offer = 1')
        ->limit($limit)
        ->execute();

        $this->widgetPartial('widget/deals', ['deals' => $deals]);
    }


    public function specialoffers($limit = 10)
    {
        $products = Products::query()
        ->where("special_offer = '1'")
        ->orderBy('created_at DESC')
        ->limit($limit)
        ->execute();

        $this->widgetPartial('widget/specialoffers', ['products' => $products]);
    }

}
