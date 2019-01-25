<?php

/**
 * AdminUserController
 */

namespace Admin\Controller;

use Application\Mvc\Controller;
use Admin\Model\AdminUser;
use Admin\Form\LoginForm;
use Michelf\Markdown;
use Phalcon\Mvc\View;

class IndexController extends Controller
{

    public function indexAction()
    {
        $this->setAdminEnvironment();
        $this->view->languages_disabled = true;

        $auth = $this->session->get('auth');
        if (!$auth || !isset($auth->admin_session) || !$auth->admin_session) {
            $this->flash->notice($this->helper->at('Log in please'));
            $this->redirect($this->url->get() . 'admin/index/login');
        }
        if($auth->role == 'user'){
          return $this->redirect($this->url->get() . 'user/index');
        }

        $this->helper->title($this->helper->at('Welcome to Eskiz CMS'), true);

        $this->helper->activeMenu()->setActive('admin-home');

    }

    public function loginAction()
    {
        $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);

        $form = new LoginForm();

        if ($this->request->isPost()) {
            if ($this->security->checkToken()) {
                if ($form->isValid($this->request->getPost())) {
                    $login = $this->request->getPost('login', 'string');
                    $password = $this->request->getPost('password', 'string');
                    $user = AdminUser::findFirst("login='$login'");
                    if ($user) {
                        if ($user->checkPassword($password)) {
                            if ($user->isActive()) {
                                $this->session->set('auth', $user->getAuthData());
                                if($user->role == 'admin'){
                                  $this->flash->success($this->helper->translate("Welcome to the administrative control panel!"));
                                  return $this->redirect($this->url->get() . 'admin/index');
                                }else if($user->role == 'user'){
                                  $this->flash->success($this->helper->translate("Welcome to the administrative control panel!"));
                                  return $this->redirect($this->url->get() . 'user/index');
                                }
                            } else {
                                $this->flash->error($this->helper->translate("User is not activated yet"));
                            }
                        } else {
                            $this->flash->error($this->helper->translate("Incorrect login or password"));
                        }
                    } else {
                        $this->flash->error($this->helper->translate("Incorrect login or password"));
                    }
                } else {
                    foreach ($form->getMessages() as $message) {
                        $this->flash->error($message);
                    }
                }
            } else {
                $this->flash->error($this->helper->translate("Security errors"));
            }
        }

        $this->view->form = $form;

    }

    public function logoutAction()
    {
        if ($this->request->isPost()) {
            if ($this->security->checkToken()) {
                $this->session->remove('auth');
            } else {
                $this->flash->error("Security errors");
            }
        } else {
            $this->flash->error("Security errors");
        }
        $this->redirect($this->url->get());
    }

    public function registerAction(){
      if($this->request->isPost()){
        $inputs = $this->request->getPost();
        $messages = [];
        if($inputs['name'] == '' || strlen($inputs['name']) <= 5 ){
          $messages['name'] = 'Name min length is 5 character';
        }
        if($inputs['email'] == '' || strlen($inputs['email']) <= 7 ){
          $messages['email'] = 'email min length is 7 character';
        }
        if($inputs['phone'] == '' || strlen($inputs['phone']) !== 12 ){
          $messages['phone'] = 'Phone must be 12 character';
        }
        if($inputs['password'] !== $inputs['confirmpassword']){
          $messages['password'] = 'Password not same';
        }
        if(!empty($messages)){
          $this->view->setVar('messages', $messages);
          return false;
        }else{
          $user = new AdminUser();
          $user->setName($inputs['name']);
          $user->setEmail($inputs['email']);
          $user->setPhone($inputs['phone']);
          $user->setLogin($inputs['email']);
          $user->setRole('user');
          $user->setActive(0);
          $user->setPassword($inputs['password']);
          if($user->save()){
            $this->view->setVar('register', true);
          }
        }
      }
    }

}
