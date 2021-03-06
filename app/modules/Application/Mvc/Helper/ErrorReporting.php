<?php

/**
 * ErrorReporting
 */
namespace Application\Mvc\Helper;

class ErrorReporting extends \Phalcon\Mvc\User\Component
{

    public function error404()
    {
        $response = $this->getDi()->get('response');
        $response->setHeader(404, 'Not Found');
        $response->setContent(include __DIR__ . '/../../../Index/views/error/404.phtml');

    }

    public function error503()
    {
        $response = $this->getDi()->get('response');
        $response->setHeader(503, 'Service Unavailable');
        $response->setContent(include __DIR__ . '/../../../Index/views/error/503.phtml');

    }

}
