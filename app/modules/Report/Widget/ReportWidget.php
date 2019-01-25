<?php

namespace Report\Widget;

use Application\Widget\AbstractWidget;
use Report\Model\Helper\ReportHelper;

class ReportWidget extends AbstractWidget
{

    public function reportBlock($limit = 5)
    {
        $helper = new ReportHelper();
        $fields = $helper->translateFieldsSubQuery();

        $columns = ['p.*'];
        $columns = array_merge($columns, $fields);

        $qb = $this->modelsManager->createBuilder()
            ->columns($columns)
            ->addFrom('Report\Model\Report', 'p')
            ->orderBy('p.id DESC')
            ->limit($limit);

        $entries = $qb->getQuery()->execute();

        $this->widgetPartial('widget/report-block', ['entries' => $entries]);
    }

} 