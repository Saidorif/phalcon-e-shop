<?php
namespace Admin\Controller;

use Application\Mvc\Controller;

class UserController extends Controller{

  public function initialize(){
    $this->view->languages_disabled = true;
    $auth = $this->session->get('auth');
    if (!$auth || !isset($auth->admin_session) || !$auth->admin_session) {
        $this->flash->notice($this->helper->at('Log in please'));
        $this->redirect($this->url->get() . 'admin');
    }
  }

  public function indexAction(){}



}

?>
