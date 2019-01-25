<?php

namespace Products\Form;

use Application\Form\Form;
use Phalcon\Forms\Element\Check;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Forms\Element\Select;
use Application\Form\Element\Image;
use Products\Model\Category;

class BrandForm extends Form
{

    public function initialize()
    {
        $this->add((new Text('slug', array('required' => true)))->setLabel('Ссылка'));
        $this->add((new Text('title', array('required' => true)))->setLabel('Заголовок'));
        $this->add((new TextArea('text', array('required' => true)))->setLabel('Текст'));
        $this->add((new Image('image'))->setLabel('Рисунок'));
    }

}
