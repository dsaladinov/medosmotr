<?php

/* @var $this yii\web\View */
/* @var $user common\models\User */

$resetLink = Yii::$app->urlManager->createAbsoluteUrl(['user/user/reset-password', 'token' => $token->token]);
?>
Здравствуйте, <?= $user->username ?>,

Перейдите по ссылке ниже, чтобы сбросить пароль:

<?= $resetLink ?>
