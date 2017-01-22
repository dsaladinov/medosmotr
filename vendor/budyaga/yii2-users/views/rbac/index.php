<?php

use yii\helpers\Url;
use yii\grid\GridView;
use yii\rbac\Item;
use yii\helpers\Html;

$this->title = 'RBAC';
$this->params['breadcrumbs'][] = $this->title;
?>
<h1><?= Html::encode($this->title) ?></h1>

<div class="row">
    <div class="col-xs-6">
        <div class="panel panel-info">
            <div class="panel-heading"><?= Yii::t('users', 'Роли')?></div>
            <div class="panel-body">
                <?= GridView::widget([
                    'dataProvider' => $rolesSearchModel->search(Yii::$app->request->queryParams),
                    'filterModel' => $rolesSearchModel,
                    'columns' => [
                        'name',
                        'description',
                        [
                            'class' => 'yii\grid\ActionColumn',
                            'template' => '{update} {delete} {children}',
                            'buttons' => [
                                'update' => function($url, $model, $key) {
                                    $options = [
                                        'title' => Yii::t('yii', 'Редактировать'),
                                        'aria-label' => Yii::t('yii', 'Редактировать'),
                                        'data-pjax' => '0',
                                    ];
                                    return Html::a('<span class="glyphicon glyphicon-pencil"></span>', $url . '&type=' . $model->type, $options);
                                },
                                'children' => function($url, $model, $key) {
                                    $options = [
                                        'title' => Yii::t('users', 'Потомки'),
                                        'aria-label' => Yii::t('users', 'Потомки'),
                                        'data-pjax' => '0',
                                    ];
                                    return Html::a('<span class="glyphicon glyphicon-link"></span>', $url . '&type=' . $model->type, $options);
                                },
                                'delete' => function($url, $model, $key) {
                                    $options = [
                                        'title' => Yii::t('yii', 'Удалить'),
                                        'aria-label' => Yii::t('yii', 'Удалить'),
                                        'data-confirm' => Yii::t('yii', 'Вы действительно хотите удалить этот элемент?'),
                                        'data-method' => 'post',
                                        'data-pjax' => '0',
                                    ];
                                    return Html::a('<span class="glyphicon glyphicon-trash"></span>', $url . '&type=' . $model->type, $options);
                                }
                            ]
                        ],
                    ],
                ]); ?>
            </div>
            <div class="panel-footer">
                <a class="btn btn-success" href="<?= Url::toRoute(['/user/rbac/create', 'type' => Item::TYPE_ROLE])?>" role="button"><?= Yii::t('users', 'Создать')?></a>
            </div>
        </div>
    </div>

    <div class="col-xs-6">
        <div class="panel panel-info">
            <div class="panel-heading"><?= Yii::t('users', 'Правила')?></div>
            <div class="panel-body">
                <?= GridView::widget([
                    'dataProvider' => $rulesSearchModel->search(Yii::$app->request->queryParams),
                    'filterModel' => $rulesSearchModel,
                    'columns' => [
                        'name',
                        [
                            'header' => Yii::t('users', 'PHP_CLASS'),
                            'value' => function($data) {
                                return unserialize($data->data)->className();
                            }
                        ],
                        [
                            'class' => 'yii\grid\ActionColumn',
                            'template' => '{delete}',
                        ],
                    ],
                ]); ?>
            </div>
            <div class="panel-footer">
                <a class="btn btn-success" href="<?= Url::toRoute(['/user/rbac/create'])?>" role="button"><?= Yii::t('users', 'Создать')?></a>
            </div>
        </div>
    </div>

    <div class="col-xs-12">
        <div class="panel panel-info">
            <div class="panel-heading"><?= Yii::t('users', 'Права')?></div>
            <div class="panel-body">
                <?= GridView::widget([
                    'dataProvider' => $permissionsSearchModel->search(Yii::$app->request->queryParams),
                    'filterModel' => $permissionsSearchModel,
                    'columns' => [
                        'name',
                        'description',
                        [
                            'class' => 'yii\grid\ActionColumn',
                            'template' => '{update} {delete} {children}',
                            'buttons' => [
                                'update' => function($url, $model, $key) {
                                    $options = [
                                        'title' => Yii::t('yii', 'Редактировать'),
                                        'aria-label' => Yii::t('yii', 'Редактировать'),
                                        'data-pjax' => '0',
                                    ];
                                    return Html::a('<span class="glyphicon glyphicon-pencil"></span>', $url . '&type=' . $model->type, $options);
                                },
                                'children' => function($url, $model, $key) {
                                    $options = [
                                        'title' => Yii::t('users', 'Дети'),
                                        'aria-label' => Yii::t('users', 'Дети'),
                                        'data-pjax' => '0',
                                    ];
                                    return Html::a('<span class="glyphicon glyphicon-link"></span>', $url . '&type=' . $model->type, $options);
                                },
                                'delete' => function($url, $model, $key) {
                                    $options = [
                                        'title' => Yii::t('yii', 'Удалить'),
                                        'aria-label' => Yii::t('yii', 'Удалить'),
                                        'data-confirm' => Yii::t('yii', 'Вы действительно хотите удалить этот элемент?'),
                                        'data-method' => 'post',
                                        'data-pjax' => '0',
                                    ];
                                    return Html::a('<span class="glyphicon glyphicon-trash"></span>', $url . '&type=' . $model->type, $options);
                                }
                            ]
                        ],
                    ],
                ]); ?>
            </div>
            <div class="panel-footer">
                <a class="btn btn-success" href="<?= Url::toRoute(['/user/rbac/create', 'type' => Item::TYPE_PERMISSION])?>" role="button"><?= Yii::t('users', 'Создать')?></a>
            </div>
        </div>
    </div>
</div>