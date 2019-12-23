# DjangoProject

```shell script
G26组

pip freeze > plist.txt # 导出本地pip包
pip install -r plist.txt # 导入pip包

# 运行Django
python manage.py runserver 0.0.0.0:80
# 创建表结构
python manage.py migrate
python manage.py makemigrations
# 重新生成表
python manage.py sqlmigrate administrator 0001
# 导入数据库
source  /home/DjangoProject/db/website.sql

# template 配置修改
# settings.py 文件中将 
'DIRS': [os.path.join(BASE_DIR, 'templates')]
# 改为
'DIRS': [BASE_DIR + '/templates', ]

# static 配置修改
STATICFILES_DIRS = [
    os.path.join(BASE_DIR, "static")
]

netstat -tunlp
sudo apt-get install zlib1g-dev libbz2-dev libssl-dev libncurses5-dev libsqlite3-dev libreadline-dev tk-dev libgdbm-dev libdb-dev libpcap-dev xz-utils libexpat1-dev liblzma-dev libffi-dev libc6-dev

#杀死指定进程根据pid(进程id)： 
kill 8911  #pid

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
    article.content = fake.paragraph()
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