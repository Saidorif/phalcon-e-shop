<?php

namespace Products\Controller;

use Application\Mvc\Controller;
use Products\Model\Notification;
use Products\Model\Products;
use Products\Form\NotificationForm;
use Webform\Model\Webform;
use Cms\Model\Settings;

class NotificationController extends Controller
{

    public function initialize()
    {
        $this->setAdminEnvironment();
        $this->helper->activeMenu()->setActive('admin-products');
    }

    public function indexAction()
    {
        $page = $this->request->getQuery('page', 'int', 1);

        $products = Notification::find([
            "conditions" => $conditions,
            "order"      => "created_at DESC, id DESC"
        ]);

        $paginator = new \Phalcon\Paginator\Adapter\Model([
            "data"  => $products,
            "limit" => 20,
            "page"  => $page
        ]);
        $this->view->paginate = $paginator->getPaginate();

        $this->helper->title('Уведомление', true);
    }

    public function addAction()
    {
        $this->view->pick(['notification/edit']);
        $form = new NotificationForm();
        $model = new Notification();
        $products = Products::find();

        if ($this->request->isPost()) {
            $post = $this->request->getPost();
            //$post['products'] = json_encode($post['products']);
            $form->bind($post, $model);

            if ($form->isValid()) {
                if ($model->create()) {
                    $form->bind($post, $model);
                    if ($model->update()) {
                        $this->flash->success($this->helper->at('Notification created'));
                        return $this->redirect($this->url->get() . 'products/notification?lang=' . LANG);
                    } else {
                        $this->flashErrors($model);
                    }
                } else {
                    $this->flashErrors($model);
                }
            } else {
                $this->flashErrors($form);
            }
        }
;
        $this->view->model = $model;
        $this->view->form = $form;
        $this->view->products = $products;
        $this->helper->title($this->helper->at('Create a notification'), true);

    }

    public function editAction($id)
    {
        $id = (int) $id;
        $form = new NotificationForm();
        $model = Notification::findFirst($id);
        $products = Products::find();
        
        if ($this->request->isPost()) {
            $post = $this->request->getPost();
            $form->bind($post, $model);
            if ($form->isValid()) {
                if ($model->save()) {
                    $this->flash->success($this->helper->at('Notification edited'));
                    return $this->redirect($this->url->get() . 'products/notification/edit/' . $model->getId() . '?lang=' . LANG);
                } else {
                    $this->flashErrors($model);
                }
            } else {
                $this->flashErrors($form);
            }
        } else {
            $form->setEntity($model);
        }

        $this->view->model = $model;
        $this->view->form = $form;
        $this->view->products = $products;
        $this->view->selectedProducts = $model->getProducts();
        $this->helper->title($this->helper->at('Edit notification'), true);
    }

    public function deleteAction($id)
    {
        $model = Products::findFirst($id);

        if ($this->request->isPost()) {

            $imageFilter = new \Image\Storage([
                'id'   => $model->getId(),
                'type' => 'products',
            ]);
            $imageFilter->remove();

            $gallery = Gallery::find('product_id='.$model->getId());

            foreach ($gallery as $g) {
                if($g){
                    $imageFilter = new \Image\Storage([
                        'id'   => $g->getFileId(),
                        'type' => 'products_gallery',
                    ]);
                    $imageFilter->remove();
                    $g->delete();
                }
            }

            $model->delete();
            $this->redirect($this->url->get() . 'products/admin');
        }


        $this->view->model = $model;
        $this->helper->title($this->helper->at('Unpublishing'), true);
    }

    private function uploadImage($model)
    {
        if ($this->request->isPost()) {

            if ($this->request->hasFiles() == true) {
              $files = $this->request->getUploadedFiles();

              foreach ($files as $file) {
                $key = explode('.', $file->getKey());

                if($key[0] == 'anons'){
                    if($file->getTempName()){
                        $imageFilter = new \Image\Storage([
                            'id'   => $model->getId(),
                            'type' => 'products',
                        ]);
                        $imageFilter->remove();

                        $image = new \Phalcon\Image\Adapter\GD($file->getTempName());

                        $image->save($imageFilter->originalAbsPath());

                        $model->setAnons($imageFilter->originalRelPath());
                        $model->update();

                        $this->flash->success($this->helper->at('Image added'));
                    }
                }

                if($key[0] == 'photos'){
                    if($file->getTempName()){
                        $photo = new Gallery();
                        $fid = md5(microtime());
                        $photoFilter = new \Image\Storage([
                            'id'   => $fid,
                            'type' => 'products_gallery',
                        ]);
                        $photoFilter->remove();

                        $img = new \Phalcon\Image\Adapter\GD($file->getTempName());
                        $img->save($photoFilter->originalAbsPath());
                        $photo->setProductId($model->getId());
                        $photo->setFile($photoFilter->originalRelPath());
                        $photo->setFileId($fid);
                        $photo->save();

                        $this->flash->success($this->helper->at('Photo added'));
                    }
                }
              }

            }
        }
    }


    public function sendAction($id)
    {
        $id = $id;
        $items = ['message' => '', 'title' => ''];
        $notification = Notification::findFirst($id);
        $home_url = $this->url->get();
        foreach($notification->products as $key => $prod_id)
        {
            $product = Products::findFirst($prod_id);
            if($product)
            {
                $items[$key]['image'] = $home_url . $product->getAnons();
                $items[$key]['name'] = $product->getTitle();
                $items[$key]['price'] = $product->getPrice();
            }
        }
        $items['message'] = strip_tags($notification->getMessage());
        $items['title'] = $notification->getTitle();
        
        
        $model = new Webform();

        $settings = Settings::findFirst(1);

        $from = 'sayyid2112@gmail.com';
        $name = $settings->getSiteName();

        $mailer = $model->mailconfig($from, $name);

        $params = [
            'items' => $items,
            'message' => $items['message'],
            'title' => $items['title'],
        ];

        $viewPath = 'emails/notifications';
                    
        $message = $mailer->createMessageFromView($viewPath, $params)
            ->to($settings->getEmail(), 'Обратная связь')
            ->subject('Обратная связь');
        $message->send();

        $this->flash->success($this->helper->at('Notification sent'));
        $this->redirect($this->url->get() . 'products/notification');



    }

}
