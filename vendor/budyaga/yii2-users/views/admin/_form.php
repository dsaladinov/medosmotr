<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use budyaga\cropper\Widget;
use budyaga\users\models\User;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $model budyaga\users\models\User */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="user-form">

    <?php $form = ActiveForm::begin(); ?>
    <?php if(Yii::$app->user->identity->user_type == 6 || Yii::$app->user->identity->user_type == 1) {  ?>
    <?= $form->field($model, 'username')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'email')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'photo')->widget(Widget::className(), [
        'uploadUrl' => Url::toRoute('/user/user/uploadPhoto'),
    ]) ?>

    <?= $form->field($model, 'sex')->dropDownList(User::getSexArray()); ?>

    <?= $form->field($model, 'status')->dropDownList(User::getStatusArray()); } ?>
    <?php if(Yii::$app->user->identity->user_type == 2) {  ?>
    <?= $form->field($model, 'complaints')->textInput(['maxlength' => 65000]);?>
    <?= $form->field($model, 's_history')->textInput(['maxlength' => 65000]);?>
    <?= $form->field($model, 'diagnosis')->textInput(['maxlength' => 65000]); } ?> 
    <?php if(Yii::$app->user->identity->user_type == 3) {  ?>
    <?= $form->field($model, 'diag_nevrop')->textInput(['maxlength' => 65000]); } ?>
    <?php if(Yii::$app->user->identity->user_type == 4) {  ?>
    <?= $form->field($model, 'diag_ovtal')->textInput(['maxlength' => 65000]); } ?>
    <?php if(Yii::$app->user->identity->user_type == 5) {  ?>
    <?= $form->field($model, 'diag_travmat')->textInput(['maxlength' => 65000]); } ?>
    <?php if(Yii::$app->user->identity->user_type == 2) {  ?>
    <?= $form->field($model, 'med_report')->textInput(['maxlength' => 65000]); } ?>
    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('users', 'Создать') : Yii::t('users', 'Редактировать'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
