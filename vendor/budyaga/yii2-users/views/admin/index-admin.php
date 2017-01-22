<?php
use yii\bootstrap\ActiveForm;
use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\Url;
use budyaga\cropper\Widget;
use budyaga\users\components\AuthKeysManager;
use budyaga\users\UsersAsset;
use budyaga\users\models\User;
?>

<div class="user-view">
    <h1><?= Html::encode($this->title)  ?></h1>
    <?php 
$form = ActiveForm::begin(['id' => 'form-profile']);
if(Yii::$app->user->identity->user_type > 1 && Yii::$app->user->identity->user_type < 6) {  ?>
    <p>
        <?= Yii::$app->user->can('userView', ['user' => $model]) ? Html::a(Yii::t('yii', 'Управление пациентами'), ['index', 'id' => $model->id], ['class' => 'btn btn-primary']) : '' ?>
    </p>
<? } else { ?>
    <p>
        <?= Yii::$app->user->can('userView', ['user' => $model]) ? Html::a(Yii::t('yii', 'Управление пользователями'), ['index', 'id' => $model->id], ['class' => 'btn btn-primary']) : '' ?>
    </p>
 <? } ?>

<?php if(Yii::$app->user->identity->user_type == 1) {  ?>
 <p>
        <?=  Html::a(Yii::t('yii', 'RBAC'), ['rbac/',], ['class' => 'btn btn-primary']) ?>  
    </p>
<? } ?>

    <p>
        <?=  Html::a(Yii::t('yii', 'Профиль'), ['/profile',], ['class' => 'btn btn-primary']) ?>
        
    </p>

   
   

    
</div>