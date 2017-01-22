<?php

/* @var $this yii\web\View */
/* @var $user common\models\User */

$confirmLink = Yii::$app->urlManager->createAbsoluteUrl(['user/user/confirm-email', 'token' => $token->old_email_token]);
?>
Здравствуйте, <?= $user->username ?>,

Перейдите по ссылке ниже, чтобы подтвердить изменение адреса электронной почты:
<?= $confirmLink ?>
