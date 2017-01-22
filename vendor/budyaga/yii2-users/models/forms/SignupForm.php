<?php
namespace budyaga\users\models\forms;

use budyaga\users\models\User;
use yii\base\Model;
use Yii;

/**
 * Signup form
 */
class SignupForm extends Model
{
    public $username;
    public $email;
    public $password;
    public $password_repeat;
    public $sex;
    public $photo;
    public $user_type;
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            ['username', 'filter', 'filter' => 'trim'],
            ['username', 'required'],
            ['username', 'string', 'min' => 2, 'max' => 255],
            ['username', 'unique', 'targetClass' => '\budyaga\users\models\User', 'message' => Yii::t('users', 'Такой пользователь уже существует')],

            ['email', 'filter', 'filter' => 'trim'],
            ['email', 'required'],
            ['email', 'email'],
            ['email', 'unique', 'targetClass' => '\budyaga\users\models\User', 'message' => Yii::t('users', 'Такой email уже используется')],
            ['sex', 'in', 'range' => [User::SEX_MALE, User::SEX_FEMALE]],
            ['user_type', 'in', 'range' => [User::USER_TYPE_ADMIN, User::USER_TYPE_PEDIATR, User::USER_TYPE_NEVROPATOLOG, User::USER_TYPE_OVTALMOLOG, User::USER_TYPE_TRAVMOTOLOG, User::USER_TYPE_USER]],
            ['photo', 'safe'],

            [['password', 'password_repeat'], 'required'],
            [['password', 'password_repeat'], 'string', 'min' => 6],
            ['password_repeat', 'compare', 'compareAttribute' => 'password'],
        ];
    }


    public function attributeLabels()
    {
        return [
            'username' => Yii::t('users', 'Имя пользователя'),
            'user_type' => Yii::t('users', 'Тип пользователя'),
            'email' => Yii::t('users', 'EMAIL'),
            'sex' => Yii::t('users', 'Пол'),
            'password' => Yii::t('users', 'Пароль'),
            'password_repeat' => Yii::t('users', 'Повторите пароль'),
            'photo' => Yii::t('users', 'Фото'),
        ];
    }

    /**
     * Signs user up.
     *
     * @return User|null the saved model or null if saving fails
     */
    public function signup()
    {
        if ($this->validate()) {
            $user = new User();
            $user->attributes = $this->attributes;
            $user->status = User::STATUS_NEW;
            $user->setPassword($this->password);
            $user->generateAuthKey();
            
            if ($user->save()) {
                return $user;
            }
        }

        return null;
    }

}
