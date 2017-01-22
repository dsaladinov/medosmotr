Проект "Медосмотр" реализован на PHP/MYSQL с использованием фрейморвка Yii2.
ДЕМО ПРОЕКТА: http://dsalailj.beget.tech/

Техническое задание:

Регистрация и авторизация пользователей с подтверждением почтового ящика. 

Создать администратора, пациента и 4 врача: педиатр, невропатолог, офтальмолог, травмотолог.

CRUD управление пользователями(пациентами и врачами) с разграничением прав.

Анонимный пользователь не может просматривать  пользователей.

Педиатр может записать: жалобы, краткий анамнез, объективный статус, диагноз и мед.заключение, а остальные 3 врача могут поставить только диагноз.

Администратор может управлять(добавление, удаление, редактирование и просмотр) врачами, пациентами.

Сделать в настройках профиля настройку изменение введенных данных и отобразить в профиле пациента то , что прописали врачи.

Создать админ-панель для врачей и администратора.

После регистрации врача дать его соотвествующие привилегии. 

Установка: 

Склонировать репо и залить в локальный сервер. В моем примере Openserver. 
Для index.php указать путь в папку domain.com/web/ 



Подключение БД

Создать пустой бд "salaidinovdb". 
Данные для подключение к бд нужно изменить на свои в папке /config/db.php: 
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

