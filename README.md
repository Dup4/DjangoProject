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

#杀死指定进程根据pid(进程id)： 
kill 8911  #pid

```