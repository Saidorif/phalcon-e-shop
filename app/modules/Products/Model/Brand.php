<?php

namespace Products\Model;

use Application\Mvc\Model\Model;

class Brand extends Model {

    public function getSource(){
        return 'product_brands';
    }

    private $id;
    protected $slug;
    protected $title;
    protected $text;
    protected $translateModel = 'Products\Model\Translate\BrandTranslate';


    public function initialize()
    {
        $this->hasMany('id', $this->translateModel, 'foreign_id'); // translate
    }

    public function getId(){
        return $this->id;
    }

    public function setId($id){
        $this->id = $id;
        return $this;
    }

    public function getSlug(){
        return $this->slug;
    }

    public function setTitle($title)
    {
        $this->setMLVariable('title', $title);
        return $this;
    }

    public function getTitle()
    {
        return $this->getMLVariable('title');
    }

    public function setText($text)
    {
        $this->setMLVariable('text', $text);
        return $this;
    }

    public function getText()
    {
        return $this->getMLVariable('text');
    }

}