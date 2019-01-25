<?php

namespace Report\Controller;

use Application\Mvc\Controller;
use Report\Model\Report;
use Report\Form\ReportForm;

class AdminController extends Controller
{

    public function initialize()
    {
        $this->setAdminEnvironment();
        $this->helper->activeMenu()->setActive('admin-report');
    }

    public function indexAction()
    {
        $this->view->entries = Report::find();
        $this->helper->title($this->helper->at('Report'), true);
    }

    public function addAction()
    {
        $this->view->pick('admin/edit');
        $model = new Report();
        $form = new ReportForm();  
        
        if ($this->request->isPost()) {
            $post = $this->request->getPost();
                
            $form->bind($post, $model);
            if ($form->isValid()) {
                if ($model->create()) {
                    $form->bind($post, $model);                    
                    if ($model->update()) {
                        $this->uploadImage($model);
                        $this->flash->success($this->helper->at('Created has been successful'));
                        $this->redirect($this->url->get() . 'report/admin/edit/' . $model->getId() . '?lang=' . LANG);
                    } else {
                        $this->flashErrors($model);
                    }
                    
                } else {
                    $this->flashErrors($model);
                }
            } else {
                $this->flashErrors($form);
            }
        } else {
            $form->setEntity($model);
        }

        
        $this->view->setVar('form', $form);

        $this->view->title = $this->helper->at('Adding Report');
        $this->helper->title($this->view->title);

    }

    public function editAction($id)
    {
        $id = (int) $id;
        $form = new ReportForm();
        $model = Report::findFirst($id); 

        if (!$model) {
            $this->redirect($this->url->get() . 'report/admin/add');
        }        
       
        if ($this->request->isPost()) {
            $post = $this->request->getPost();            
            $form->bind($post, $model);
            if ($form->isValid()) {
                if ($model->save()) {                    
                    $this->uploadImage($model);
                    $this->flash->success($this->helper->at('Updated has been successful'));
                    $this->redirect($this->url->get() . 'report/admin/edit/' . $model->getId() . '?lang=' . LANG);
                } else {
                    $this->flashErrors($model);
                }
            } else {
                $this->flashErrors($form);
            }
        } else {
            $form->setEntity($model);
        }

        $this->view->setVar('form', $form);
        $this->view->setVar('Report', $model);

        $this->helper->title($this->helper->at('Editing Report'), true);

    }

    public function deleteAction($id)
    {
        $id = (int) $id;
        $model = Report::findFirst($id);
        if ($model) {

            if ($this->request->isPost()) {
                if($model->getFoto()){
                    $path = ROOT.'/'.$model->getFoto();
                    unlink($path);
                }
                $model->delete();
                $this->redirect($this->url->get() . 'report/admin/index');
            }

            $this->view->model = $model;
        }

    }

    private function uploadImage($model)
    {
        if ($this->request->isPost()) {
            if ($this->request->hasFiles() == true) {
                foreach ($this->request->getUploadedFiles() as $file) {
                    if (!$file->getTempName()) {
                        return;
                    }
                    if (!in_array($file->getType(), [
                        'image/bmp',
                        'image/jpeg',
                        'image/png',
                    ])
                    ) {
                        return $this->flash->error($this->helper->at('Only allow image formats jpg, jpeg, png, bmp'));
                    }
                    
                    $hash = $model->getId().'.'.$file->getExtension();
                    $currentPath = ROOT.'/uploads/report/'.$hash;
                    $img = substr($currentPath, strpos($currentPath, 'uploads'));
                    $file->moveTo($currentPath);

                    $model->setFoto($img);
                    $model->update();

                    $this->flash->success($this->helper->at('Photo added'));
                }
            }
        }
    }

}