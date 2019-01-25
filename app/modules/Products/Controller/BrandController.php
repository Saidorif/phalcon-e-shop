<?php


namespace Products\Controller;

use Application\Mvc\Controller;
use Products\Form\BrandForm;
use Products\Model\Category;
use Products\Model\Brand;
use Menu\Model\Menus;

class BrandController extends Controller
{

    public function initialize()
    {
        $this->setAdminEnvironment();
    }

    public function indexAction()
    {
        $this->view->entries = Brand::find();

        $this->helper->title($this->helper->at('Brand'), true);
    }

    public function addAction()
    {
        $this->view->pick(array('brand/edit'));

        $form = new BrandForm();
        $model = new Brand();
        $categories = Category::find();

        if ($this->request->isPost()) {
            $post = $this->request->getPost();
            $form->bind($post, $model);

            if ($form->isValid()) {
                if ($model->create()) {
                    $form->bind($post, $model);
                    // $model->updateFields($post);
                    if ($model->update()) {
                        // $this->menuCheck($model->getId());
                        // $this->uploadImage($model);
                        $this->flash->success('Brand created');
                        return $this->redirect($this->url->get() . 'products/brand/edit/' . $model->getId() . '?lang=' . LANG);
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

        $this->view->model = $model;
        $this->view->form = $form;
        $this->view->categories = $categories;
        $this->helper->title('Добвить бренд');
    }

    public function editAction($id)
    {
        $form = new BrandForm();
        $model = Brand::findFirst($id);
        $categories = Category::find();

        if ($this->request->isPost()) {
            $post = $this->request->getPost();
            $form->bind($post, $model);

            if ($form->isValid()) {
                // $model->updateFields($post);
                if ($model->update()) {
                    // $this->menuCheck($model->getId());
                    // $this->uploadImage($model);
                    $this->flash->success('Brand created');
                    return $this->redirect($this->url->get() . 'products/brand/edit/' . $model->getId() . '?lang=' . LANG);
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
        $this->view->categories = $categories;
        $this->helper->title($this->helper->at('Brand'));
    }

    public function deleteAction($id)
    {
        $model = Category::findFirst($id);
        $count = Category::count();
        $slug = 'products/'.$model->getSlug();

        $menus = Menus::findFirst("slug = '".$slug."'");       

        if ($count == 1) {
            $this->flash->error($this->helper->at('Can not Delete the last Category'));
            return;
        }

        if ($this->request->isPost()) {
            if($menus)
              $menus->delete();
            
            $imageFilter = new \Image\Storage([
                'id'   => $model->getId(),
                'type' => 'category',
            ]);
            $imageFilter->remove();            
            $model->delete();
            $this->redirect($this->url->get() . 'products/category');
        }

        $this->view->model = $model;
        $this->helper->title($this->helper->at('Delete category'));
    }

    private function uploadImage($model)
    {
        if ($this->request->isPost()) {
            
            if ($this->request->hasFiles() == true) { 
              $files = $this->request->getUploadedFiles(); 
              
              foreach ($files as $file) { 
                
                if($file->getTempName()){
                    $imageFilter = new \Image\Storage([
                        'id'   => $model->getId(),
                        'type' => 'category',
                    ]);
                    $imageFilter->remove();
                    
                    $image = new \Phalcon\Image\Adapter\GD($file->getTempName());  
                    
                    $image->save($imageFilter->originalAbsPath());

                    $model->setFoto($imageFilter->originalRelPath());
                    $model->update();

                    $this->flash->success($this->helper->at('Image added'));  
                } 
                
              }               
              
            }
        }
    }

    private function menuCheck($id)
    {
      $model = Category::findFirst($id);

      $category_slug = 'products';
      $slug = 'products/'.$model->getSlug();
      
      if($model->getMenuCheck() == 1){
        $category_menus = Menus::findFirst("slug = '".$category_slug."'");          
        $menus = Menus::findFirst("slug = '".$slug."'");   
        if($category_menus){
          if($menus){
            if(!$menus->getTitle()){
              $menus->setTitle($model->getTitle());
              $menus->setStatus(1);
              $menus->save();
            } else {
              $menus->setStatus(1);
              $menus->save();
            }
          } else {
            $menus = new Menus;
            $menus->setRoot('main');
            $menus->setSlug($slug);
            $menus->setDepth(1);
            if ($menus->create()) {
              $menus->setTitle($model->getTitle());
              $menus->setStatus(1);
              $menus->save();
            }
          }   
        } else {
          $category_menus = new Menus;
          $category_menus->setRoot('main');
          $category_menus->setSlug($category_slug);
          $category_menus->setDepth(1);
          if ($category_menus->create()) {
            $category_menus->setTitle($this->helper->at('Products'));
            $category_menus->setStatus(1);
            if($category_menus->save()){
              $menus = new Menus;
              $menus->setRoot('main');
              $menus->setSlug($slug);
              $menus->setDepth(1);
              if ($menus->create()) {
                $menus->setTitle($model->getTitle());
                $menus->setStatus(1);
                $menus->save();
              }
            }
          }
        }       
                 
      }
      if($model->getMenuCheck() == 0){
        $menus = Menus::findFirst("slug = '".$slug."'");          
        if($menus){           
          $menus->setStatus(0);
          $menus->save();           
        }         
      }
    }

} 