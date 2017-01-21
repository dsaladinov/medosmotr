Проект "Медосмотр" реализован на PHP/MYSQL с использованием фрейморвка Yii2.

Установка: 
Склонировать репо и залить в локальный сервер. В моем примере Openserver. 
Для index.php указать путь в папку domain.com/web/ 
Подключение БД
Создать пустой бд "salaidinovdb". 
Данные для подключение к бд нужно изменить на свои в папке /config/db/: 
dbname=salaidinovdb
'username' => 'root',
'password' => '',
Для миграции бд в консоли перейти в папку domain.com/migrations/ и ввести следующую команду: 
mysql -uroot -h localhost -D salaidinovdb < salaidinovdb.sql
или имеются логин и пароль, тогда : mysql -uuser -ppassword -h localhost -D salaidinovdb < salaidinovdb.sql 

Тестовые учетные записи

Администратор - dsalaidinov@gmail.com - danchik1995

Педиатр - allik274@gmail.com - doctor123

Невропатолог - nnazarbaev99@gmail.com - doctor123

Офтальмолог - nandreevna71@gmail.com - doctor123
Травмотолог - gulnuramambetka@gmail.com - doctor123
Пациент - amanbekmambetkalyev@gmail.com - pacient123

Предназначения: 
Администратор сможет управлять всеми(crud).
Врачи смогут просматривать анкету пациента, а также заполнить анкету и педиатр может дать мед.заключение.
Пациент может только посмотреть свою анкету.

Внимание!
После регистрации нужно подтвердить электронную почту.
При добавлении на сайт врача, администратору нужно указать дать права врача в админ-панели.
