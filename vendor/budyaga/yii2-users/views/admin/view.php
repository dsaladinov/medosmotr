<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use budyaga\users\UsersAsset;
use budyaga\users\models\User;
use budyaga\users\components\UserPermissionsWidget;
use budyaga\users\components\PermissionsTreeWidget;

/* @var $this yii\web\View */
/* @var $model budyaga\users\models\User */

$this->title = $model->username;
if(Yii::$app->user->identity->user_type > 1 && Yii::$app->user->identity->user_type < 6)  { 
$this->params['breadcrumbs'][] = ['label' => Yii::t('users', 'Пациенты'), 'url' => ['index']];  
} else {
    $this->params['breadcrumbs'][] = ['label' => Yii::t('users', 'Пользователи'), 'url' => ['index']];  
}
$this->params['breadcrumbs'][] = $this->title;

$assets = UsersAsset::register($this);
?>
<div class="user-view">

    <h1><?= Html::encode($this->title)  ?></h1>

    <p>
        <?= Yii::$app->user->can('userUpdate', ['user' => $model]) ? Html::a(Yii::t('yii', 'Редактировать'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) : '' ?>
        <?= Yii::$app->user->can('userDelete') ? Html::a(Yii::t('yii', 'Удалить'), ['delete', 'id' => $model->id], ['class' => 'btn btn-danger', 'data' => ['confirm' => Yii::t('yii', 'Are you sure you want to delete this item?'), 'method' => 'post']]) : ''?>
    </p>
	<?php
	$attributes =  [
            'id',
            'username',
            'email:email',
            [
                'attribute' => 'photo',
                'value' => ($model->photo) ? $model->photo : $assets->baseUrl . '/img/' . $model->getDefaultPhoto() . '.png',
                'format' => ['image', ['width' => 200, 'height' => 200]]
            ],
            [
                'attribute' => 'sex',
                'value' => User::getSexArray()[$model->sex]
            ],
            [
                'attribute' => 'status',
                'value' => User::getStatusArray()[$model->status]
            ],
            'created_at:datetime',
            'updated_at:datetime'
    ];
	


    if(Yii::$app->user->identity->user_type > 1 && Yii::$app->user->identity->user_type < 6)  { 
        array_push($attributes,'complaints', 's_history', 'diagnosis' );
        array_push($attributes, "diag_nevrop");
        array_push($attributes, "diag_ovtal");
        array_push($attributes, "diag_travmat");
        array_push($attributes, "med_report");

    }
    ?>
    <?= DetailView::widget([
        'model' => $model,
        'attributes' =>$attributes]
		) ?>
<?php  if(Yii::$app->user->identity->user_type == 1){ ?>
     <h2><?= Yii::t('users', 'Права пользователя')?></h2>
    <p>
        <?= Yii::$app->user->can('userPermissions', ['user' => $model]) ? Html::a(Yii::t('yii', 'Редактировать'), ['permissions', 'id' => $model->id], ['class' => 'btn btn-primary']) : '' ?>
    </p>
    <?= PermissionsTreeWidget::widget(['user' => $model])?>
 <? }?>
</div>
