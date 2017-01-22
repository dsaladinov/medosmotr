<?php
namespace budyaga\users\rbac;

use yii\rbac\Rule;
use Yii;
class IsDoctorRule extends Rule
{
    public $name = 'isDoctorRule';
    public function execute($user, $item, $params)
    {
        if (!isset($params['user'])) {
            return false;
        }
        return ($params['user']->user_id == $user);
    }
}