# DjangoProject

```shell script
pip freeze > plist.txt    # 导出本地pip包
pip install -r plist.txt  # 导入pip包

# 运行Django
python manage.py runserver 0.0.0.0:80
# 创建表结构
python manage.py makemigrations
python manage.py migrate
# 重新生成表
Example:
python manage.py sqlmigrate administrator 0001

```

## 服务器环境
```shell script
系统 CentOS7.4
软件版本 Django2.0.2
环境软件 Python3.6.4,Mysql5.6,PyMySQL(0.8.0),uwsgi 2.0.15,nginx/1.12.2
systemctl restart uwsgi # 重启uwsgi
systemctl restart nginx # 重启nginx
```

## generate data
```python
from faker import Faker

# generate administrator

for i in range(20):
    user = User()
    fake = Faker(locale='zh_CN')
    user.username = fake.user_name()
    if i == 0:
        user.username = 'admin'
    user.password = make_password('123456')
    user.name = fake.name()
    user.sex = 0
    user.tel = fake.phone_number()
    user.email = fake.email()
    user.role = 1
    user.superior = 1
    user.save()

# generate article

for number in range(10):
    article = Article()
    fake = Faker(locale='zh_CN')
    article.title = fake.word()
    article.classify = 1
    article.content = fake.text()
    article.save()


# generate member


for number in range(20):
    user = User()
    fake = Faker(locale='zh-CN')
    user.username = fake.user_name()
    user.password = make_password("123456")
    user.name = fake.name()
    user.sex = 0
    user.tel = fake.phone_number()
    user.email = fake.email()
    user.address = fake.address()
    user.save()
```

错误记录

<del>pip install mysqlclien 错误</del><br>
<del>sudo apt-get install libmysqlclient-dev</del>