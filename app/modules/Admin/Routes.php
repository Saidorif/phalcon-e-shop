<?php

namespace Admin;

class Routes
{

    public function init($router)
    {
        $router->add('/admin', array(
            'module'     => 'admin',
            'controller' => 'index',
            'action'     => 'index',
        ))->setName('admin');

        $router->add('/user/index', array(
            'module'     => 'admin',
            'controller' => 'user',
            'action'     => 'index',
        ))->setName('user');

        $router->add('/user/register', array(
            'module'     => 'admin',
            'controller' => 'index',
            'action'     => 'register',
        ))->setName('register');

        return $router;
    }

}
