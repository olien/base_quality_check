<?php

/**
 *  @var rex_addon $this
 */

$addon = rex_addon::get('base_quality_check');

if (rex_addon::get('yform')->isAvailable() && !rex::isSafeMode()) {
	rex_yform_manager_dataset::setModelClass(
		'rex_base_quality_check',
		base_quality_check::class,
	);
	rex_yform_manager_dataset::setModelClass(
		'rex_base_quality_check_group',
		base_quality_check_group::class,
	);
	rex_yform_manager_dataset::setModelClass(
		'rex_base_quality_check_sub_group',
		base_quality_check_sub_group::class,
	);
}

rex_extension::register('PACKAGES_INCLUDED', function () {
	if (rex::getUser() && $this->getProperty('compile') === true) {
		$compiler = new rex_scss_compiler();
		$scss_files = rex_extension::registerPoint(new rex_extension_point('BE_STYLE_SCSS_FILES', [$this->getPath('scss/bqc.scss')]));
		$compiler->setScssFile($scss_files);
		$compiler->setCssFile($this->getPath('assets/bqc.css'));
		$compiler->compile();
		rex_file::copy($this->getPath('assets/bqc.css'), $this->getAssetsPath('bqc.css'));
	}
});

rex_view::addCssFile($this->getAssetsUrl('bqc.css'));

    rex_extension::register('OUTPUT_FILTER',function(rex_extension_point $ep){
        $suchmuster = '<h4 class="rex-nav-main-title">[translate:navigation_base_addon]</h4>';
        $ersetzen = '<div class="rex-nav-main-title" style="padding:0px; margin-bottom: 14px;"></div>';
        $ep->setSubject(str_replace($suchmuster, $ersetzen, $ep->getSubject()));
    });


if (isset($_GET['page']) && is_string($_GET['page']) && preg_match('/base_quality_check/', $_GET['page'])) {
	
	rex_view::addJsFile($this->getAssetsUrl('bqc.js'));

	rex_extension::register('OUTPUT_FILTER', function (rex_extension_point $ep) {
		$suchmuster = 'class="rex-page-main';
		$ersetzen = 'class="bqc-addon rex-page-main';
		$ep->setSubject(str_replace($suchmuster, $ersetzen, $ep->getSubject()));
	});

	rex_extension::register('OUTPUT_FILTER', function (rex_extension_point $ep) {
		$suchmuster = '<title>Backend &lt;div id=&quot;backendcount&quot;&gt;&lt;/div&gt;';
		$ersetzen = '<title>Backend ';
		$ep->setSubject(str_replace($suchmuster, $ersetzen, $ep->getSubject()));
	});

	rex_extension::register('OUTPUT_FILTER', function (rex_extension_point $ep) {
		$suchmuster = '<title>Frontend &lt;div id=&quot;frontendcount&quot;&gt;&lt;/div&gt;';
		$ersetzen = '<title>Frontend ';
		$ep->setSubject(str_replace($suchmuster, $ersetzen, $ep->getSubject()));
	});

	rex_extension::register('OUTPUT_FILTER', function (rex_extension_point $ep) {
		$suchmuster = '<title>Live &lt;div id=&quot;livedcount&quot;&gt;&lt;/div&gt;';
		$ersetzen = '<title>Live ';
		$ep->setSubject(str_replace($suchmuster, $ersetzen, $ep->getSubject()));
	});	

}

$func = rex_request('func', 'string');
$id = rex_request('id', 'int');

if ($func !== '' && $id !== '') {
	$sql = rex_sql::factory();
	$sql->setTable('rex_base_quality_check');
	$sql->setWhere('id = :id', ['id' => $id]);
	$sql->setValue('check', $func == 'checktask' ? 1 : 0);
	$sql->update();
}

function updateTaskscounter()
{
	$all_tasks = base_quality_check::query()->where('status', 1)->count();
	$all_tasks_checked = base_quality_check::query()->where('check', 1)->where('status', 1)->count();
	$all_tasks_checked_percentage = intval(round(($all_tasks_checked / $all_tasks) * 100, 0));

	$all_frontend_tasks = base_quality_check::query()->where('group', 1)->where('status', 1)->count();
	$all_frontend_tasks_checked = base_quality_check::query()->where('group', 1)->where('check', 1)->where('status', 1)->count();
	$frontend_tasks_checked_percentage = intval(round(($all_frontend_tasks_checked / $all_frontend_tasks) * 100, 0));

	$all_backend_tasks = base_quality_check::query()->where('group', 2)->where('status', 1)->count();
	$all_backend_tasks_checked = base_quality_check::query()->where('group', 2)->where('check', 1)->where('status', 1)->count();
	$backend_tasks_checked_percentage = intval(round(($all_backend_tasks_checked / $all_backend_tasks) * 100, 0));


	$all_live_tasks = base_quality_check::query()->where('group', 3)->where('status', 1)->count();
	$all_live_tasks_checked = base_quality_check::query()->where('group', 3)->where('check', 1)->where('status', 1)->count();
	$live_tasks_checked_percentage = intval(round(($all_live_tasks_checked / $all_live_tasks) * 100, 0));

	$color = getColorByPercentage($all_tasks_checked_percentage);
	$color_frontend = getColorByPercentage($frontend_tasks_checked_percentage);
	$color_backend = getColorByPercentage($backend_tasks_checked_percentage);
	$color_live = getColorByPercentage($live_tasks_checked_percentage);	

	$script = "<script>
		document.addEventListener('DOMContentLoaded', function() {
			var element = document.querySelector('#rex-navi-page-base-quality-check a');
			var newText = document.createElement('span');
			newText.style.backgroundColor = '{$color}';
			newText.style.color = '#000';
			newText.innerHTML = ' {$all_tasks_checked_percentage}%';
			element.appendChild(newText);

			var element = document.querySelector('#frontendcount');
			var newText = document.createElement('span');
			newText.style.backgroundColor = '{$color_frontend}';
			newText.style.color = '#000';
			newText.innerHTML = '{$all_frontend_tasks_checked} | {$all_frontend_tasks}';
			element.appendChild(newText);

			var element = document.querySelector('#backendcount');
			var newText = document.createElement('span');
			newText.style.backgroundColor = '{$color_backend}';
			newText.style.color = '#000';
			newText.innerHTML = '{$all_backend_tasks_checked} | {$all_backend_tasks}';
			element.appendChild(newText);


			var element = document.querySelector('#livecount');
			var newText = document.createElement('span');
			newText.style.backgroundColor = '{$color_live}';
			newText.style.color = '#000';
			newText.innerHTML = '{$all_live_tasks_checked} | {$all_live_tasks}';
			element.appendChild(newText);			
		});
	</script>";

	return $script;
}

function getColorByPercentage($percentage)
{
	if ($percentage > 0 && $percentage < 25) {
		return '#FF0000';
	} elseif ($percentage >= 25 && $percentage < 50) {
		return '#EE4420';
	} elseif ($percentage >= 50 && $percentage < 75) {
		return '#DD8850';
	} elseif ($percentage >= 75 && $percentage < 99) {
		return '#ACCE40';
	} elseif ($percentage == 100) {
		return '#49AD50';
	} else {
		return '#FF0000';
	}
}

rex_extension::register('PACKAGES_INCLUDED', function () {
	echo updateTaskscounter();
});
