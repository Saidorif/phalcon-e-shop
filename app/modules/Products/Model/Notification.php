<?php

namespace Products\Model;

use Application\Mvc\Model\Model;

class Notification extends Model
{

    public function getSource()
    {
        return "notification";
    }

    public function initialize()
    {
        $this->hasMany('id', $this->translateModel, 'foreign_id');
    }

    public function beforeCreate()
    {
        $this->created_at = date("Y-m-d H:i:s");
    }

    protected $id;
    protected $title;
    protected $products;
    protected $status;
    protected $message;
    protected $translateModel = 'Products\Model\Translate\NotificationTranslate'; // translate
    protected $translateFields = [
        'title',
        'message'
    ];


    public function getId()
    {
        return $this->id;
    }

    public function setMessage($message)
    {
        $this->setMLVariable('message', $message);
        return $this;
    }

    public function getMessage()
    {
        return $this->getMLVariable('message');
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

    public function getProducts()
    {
        return json_decode($this->products);
    }

    public function setProducts($products)
    {
        $this->products = json_encode($products);
        return $this;
    }

    public function getStatus()
    {
        return $this->status;
    }

    public function setStatus($status)
    {
        $this->status = $status;
        return $this;
    }
    

}
