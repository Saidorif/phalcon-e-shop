<?php

namespace Report\Controller;

use Application\Mvc\Controller;
use Report\Model\Report;

class IndexController extends Controller
{

    public function indexAction()
    {
        $this->view->entries = Report::find();
        $this->helper->title($this->helper->translate('Report'), true);
        $this->helper->meta()->set('description', $this->helper->at('Report'));
    }    

}
