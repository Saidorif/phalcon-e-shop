<?php

namespace Report;

use Application\Mvc\Router\DefaultRouter;

class Routes
{

    public function init(DefaultRouter $router)
    {
        $router->addML('/report', array(
            'module' => 'report',
            'controller' => 'index',
            'action' => 'index',
        ), 'report');

        return $router;

    }

}