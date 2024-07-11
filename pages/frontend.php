<?php


$tasks = array();
$group = 1;

$currentSubGroup = '';

$all_tasks = base_quality_check::query()
    ->where('status', 1, "=")
    ->where('group', $group, "=")
    ->orderBy('prio', 'ASC');


if ($all_tasks) {
    foreach ($all_tasks as $task) {
        if ($currentSubGroup != $task->getSubgroup()->subgroup) {
            $currentSubGroup = $task->getSubgroup()->subgroup;

        } else {
            $currentSubGroup = '';
        }

        $checked = '';
        if ($task->getCheck() == 1) {
    
            $checked = 'checked';
            $link = '<a class="tasklink" href="' . rex_url::currentBackendPage(['func' => 'unchecktask', 'id' => $task->getId()]) . '" >
                         <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="#62A959" class="size-6 ">
                             <path stroke-linecap="round" stroke-linejoin="round" d="M10.125 2.25h-4.5c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125v-9M10.125 2.25h.375a9 9 0 0 1 9 9v.375M10.125 2.25A3.375 3.375 0 0 1 13.5 5.625v1.5c0 .621.504 1.125 1.125 1.125h1.5a3.375 3.375 0 0 1 3.375 3.375M9 15l2.25 2.25L15 12" />
                         </svg>
                     </a>';
        } else {
            $link = '<a class="tasklink" href="' . rex_url::currentBackendPage(['func' => 'checktask', 'id' => $task->getId()]) . '" >
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="darkgrey" class="size-6">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 14.25v-2.625a3.375 3.375 0 0 0-3.375-3.375h-1.5A1.125 1.125 0 0 1 13.5 7.125v-1.5a3.375 3.375 0 0 0-3.375-3.375H8.25m2.25 0H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 0 0-9-9Z" />
                        </svg>
                    </a>';
        }

        $tasks[] = '
            <tr>
                <td style="width: 120px;">
                    ' . $currentSubGroup . '
                </td>
                <td style="width: 40px; text-align:center;">
                    ' . $link . '
                </td>
                <td style="width: 250px;">
                    <b>' . $task->getTitle() . '</b>
                </td>
                <td>';

        if ($task->getDescription() || $task->getSource() || $task->getLinks()) {
            $tasks[] = '
                <header class="collapsed ' . $checked . '" data-toggle="collapse" data-target="#collapse-' . $task->getId() . '" aria-expanded="false">
                    <div class="panel-title">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-4">
                            <path stroke-linecap="round" stroke-linejoin="round" d="m19.5 8.25-7.5 7.5-7.5-7.5" />
                        </svg>
                    ' . $task->getSecondTitle() . ' 
                    </div>
                </header>
                <div id="collapse-' . $task->getId() . '" class="panel-collapse collapse" aria-expanded="false" style="height: 0px; padding: 16px 8px 16px 0;">';

            if ($task->getDescription()) {
                $tasks[] = '
                    <h6 style="margin-top: 20px;opacity:50%;"><b>Infos</b></h6>
                    ' . $task->getDescription();
            }
            if ($task->getSource()) {
                $tasks[] = '
                    <h6 style="margin-top: 30px;opacity:50%;"><b>Code</b></h6>
                    '.$task->getSource();
            }
            if ($task->getLinks()) {
                $tasks[] = '
                    <h6 style="margin-top: 30px;opacity:50%;"><b>Links</b></h6>
                    ' . $task->getLinks();
            }
        } else {
            $tasks[] = '<div class="panel-title ' . $checked . ' pl-title">'.$task->getSecondTitle() . '</div>';
        }

        if ($task->getDescription() || $task->getSource() || $task->getLinks()) {
            $tasks[] = '
                </div>
            </div>';
        }

        $tasks[] = '</td>
            </tr>';

        $currentSubGroup = $task->getSubgroup()->subgroup;
    }

    $content = '
            <table class="table table-striped table-hover bqc-table">
                <thead>
                    <tr>
                        <th style="width: 120px;">Gruppe</th>
                        <th  style="width: 40px; text-align:center;">Status</th>
                        <th style="width: 250px;"></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    ' . implode($tasks) . '
                </tbody>
            </table>
        ';
}


$fragment = new \rex_fragment();
$fragment->setVar('body', $content, false);
echo $fragment->parse('core/page/section.php');

