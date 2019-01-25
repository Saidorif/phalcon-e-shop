<?php

namespace Products\Form;

use Application\Form\Form;
use Phalcon\Forms\Element\Check;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Forms\Element\Select;
use Application\Form\Element\Image;
use Products\Model\Category;

class NotificationForm extends Form
{

    public function initialize()
    {
        $this->add((new Text('title', array('required' => true)))->setLabel('Заголовок'));
        $this->add((new Text('products', array('required' => true)))->setLabel('Продукты'));
        $this->add((new TextArea('message', array('required' => true)))->setLabel('Сообщения'));
    }

}
