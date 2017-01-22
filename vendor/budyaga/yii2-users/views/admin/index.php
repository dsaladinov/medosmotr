<?php

use yii\helpers\Html;
use yii\grid\GridView;
use budyaga\users\models\User;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */
if(Yii::$app->user->identity->user_type != 1)  { 
    $this->title = Yii::t('users', 'Пациенты'); 
}
else {
    $this->title = Yii::t('users', 'Пользователи'); 
}
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="user-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= (Yii::$app->user->can('userCreate')) ? Html::a(Yii::t('users', 'Создать'), ['create'], ['class' => 'btn btn-success']) : ''?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'id',
            'username', 
            'email:email',
            [
                'attribute' => 'sex',
                'value' => function($data) {
                    return User::getSexArray()[$data->sex];
                }
            ],
            [
                'attribute' => 'status',
                'value' => function($data) {
                    return User::getStatusArray()[$data->status];
                }
            ],
             'created_at:datetime',
             'updated_at:datetime',           
             'complaints',
             's_history',
             'diagnosis',
             'diag_nevrop',
             'diag_ovtal',
             'diag_travmat',
             'med_report',
            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{view} {update} {delete} {permissions}',
                'buttons' => [
                    'view' => function ($url, $model, $key) {
                        if (!Yii::$app->user->can('userView', ['user' => $model])) {
                            return '';
                        }
                        $options = [
                            'title' => Yii::t('yii', 'Просмотр'),
                            'aria-label' => Yii::t('yii', 'Просмотр'),
                            'data-pjax' => '0',
                        ];
                        return Html::a('<span class="glyphicon glyphicon-eye-open"></span>', $url, $options);
                    },
                    'update' => function ($url, $model, $key) {
                        if (!Yii::$app->user->can('userUpdate', ['user' => $model])) {
                            return '';
                        }
                        $options = [
                            'title' => Yii::t('yii', 'Редактировать'),
                            'aria-label' => Yii::t('yii', 'Редактировать'),
                            'data-pjax' => '0',
                        ];
                        return Html::a('<span class="glyphicon glyphicon-pencil"></span>', $url, $options);
                    },
                    'permissions' => function ($url, $model, $key) {
                        if (!Yii::$app->user->can('userPermissions', ['user' => $model])) {
                            return '';
                        }
                        $options = [
                            'title' => Yii::t('users', 'Права'),
                            'aria-label' => Yii::t('users', 'Права'),
                            'data-pjax' => '0',
                        ];
                        return Html::a('<span class="glyphicon glyphicon-cog"></span>', $url, $options);
                    },
                    'delete' => function($url, $model, $key) {
                        if (!Yii::$app->user->can('userDelete', ['user' => $model])) {
                            return '';
                        }
                        $options = [
                            'title' => Yii::t('yii', 'Удалить'),
                            'aria-label' => Yii::t('yii', 'Удалить'),
                            'data-confirm' => Yii::t('yii', 'Вы действительно хотите удалить этот элемент?'),
                            'data-method' => 'post',
                            'data-pjax' => '0',
                        ];
                        return Html::a('<span class="glyphicon glyphicon-trash"></span>', $url, $options);
                    }
                ]
            ],
        ],
    ]); ?>

</div>
