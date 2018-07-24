---------------------------------数据库导入表-----------------------------
第一步:先建个与要导入的database同名的数据库
第二部:use这个database
第三部: .\ d\company.sql



---------------------------------约束---------------------------------

alter table <表名> add primary key(<字段名>); 


---------------------------------日期函数---------------------------------
-->系统时间
current_date
now()
sysdate()

select current_date;--> 2017-04-12
select now()--> 2017-04-12 20:22:07
select sysdate()-->2017-04-12 20:22:07

-->year()= 年份判断
select year(now())=2017;-->返回1或0;1表示今年是2017年,0表示不是;
select *,year(hiredate)=1981 '是否是1981年入职' from emp;

-->查询当天,昨天,n天内数据
SELECT * FROM 表名 WHERE DATEDIFF(字段,NOW())=0; -->当天的所有数据
SELECT * FROM 表名 WHERE DATEDIFF(字段,NOW())=-1; -->查询昨天的所有数据
SELECT * FROM 表名WHERE DATEDIFF(字段,NOW())=n; -->n为负数则为过去第几天的数据,正数为未来第几天的数据
SELECT * FROM 表名 WHERE DATEDIFF(字段,NOW())>-2; -->查询昨天和今天的所有数据
SELECT * FROM 表名 WHERE DATEDIFF(字段,NOW())<n AND DATEDIFF(字段,NOW())>=0; -->n为正数,查询未来n天内的所有数据

select DATE_SUB(curdate(),INTERVAL 0 DAY) -->今天日期 yyyy-mm-dd
select DATE_SUB(curdate(),INTERVAL 1 DAY) -->昨天日期
select DATE_SUB(curdate(),INTERVAL -1 DAY)  -->明天日期

-->日期加一天用来方便sql查询
-->SELECT * FROM 表名 WHER DATE_ADD('2018-01-01',INTERVAL 1 DAY) >= 字段
SELECT DATE_ADD('2018-01-01',INTERVAL 1 DAY)

-->查询一个月前的数据
SELECT * FROM 表名 WHERE 字段 < DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
-->查询一个月内的数据
SELECT * FROM 表名 WHERE 字段 > DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
-->周月年内
SELECT * FROM 表名 where 字段 > DATE_SUB(CURDATE(), INTERVAL 1 DAY) -->一天内
SELECT * FROM 表名 where 字段 > DATE_SUB(CURDATE(), INTERVAL 1 WEEK) -->一周内
SELECT * FROM 表名 where 字段 > DATE_SUB(CURDATE(), INTERVAL 1 MONTH) -->一月内
SELECT * FROM 表名 where 字段 > DATE_SUB(CURDATE(), INTERVAL 1 YEAR) -->一年内

-->时间相减
--单位:FRAC_SECOND(毫秒)|SECOND(秒)|MINUTE(分钟)|HOUR(小时)|DAY(天)|WEEK(星期)|MONTH(月)|QUARTER(季度)|YEAR(年
--TIMESTAMPDIFF(单位,开始时间,结束时间)
SELECT TIMESTAMPDIFF(SECOND,'2018-01-01 00:00:00','2018-01-01 00:00:10') -->10

---------------------------------日期格式化---------------------------------

-->格式化周
-->每周第一天为星期一
SELECT DATE_FORMAT(字段,'%Y%u') FROM 表名
-->每周第一天为星期天
SELECT DATE_FORMAT(字段,'%Y%U') FROM 表名

-->格式化月
-->201801
SELECT DATE_FORMAT(字段,'%Y%m') FROM 表名
-->20181
SELECT DATE_FORMAT(字段,'%Y%c') FROM 表名

--格式化为时间戳,单位秒
SELECT UNIX_TIMESTAMP('2018-06-26 09:58:00')
SELECT UNIX_TIMESTAMP(now())

-------------------------------------help---------------------------------

?   Bit Functions
?   Comparison operators
?   Control flow functions
?   Date and Time Functions
?   Encryption Functions
?   Information Functions
?   Logical operators
?   Miscellaneous Functions
?   Numeric Functions
?   String Functions

?  Account Management
?  Administration
?  Compound Statements
?  Data Definition
?  Data Manipulation
?  Data Types
?  Functions
?  Functions and Modifiers for Use with GROUP BY  	组函数
?  Geographic Features
?  Help Metadata
?  Language Structure
?  Plugins
?  Procedures
?  Storage Engines
?  Table Maintenance
?  Transactions
?  User-Defined Functions
?  Utility


------------------------------------------第一天----------------------------------
1. create database company;  --创建数据
2. drop database company;  --删除数据库
3. use company; --使用company这个数据库
4. source d:\company.sql  --导入sql, 不要加分号
5. show tables; --查看数据库中有哪些表
6. select ename, empno from emp; --查询emp表中ename和empno这两个字段的值
7， select ename from emp; --只查询ename这一列
8. select * from emp;  --查询emp表中所有的列
9. select * from emp where empno = 7499; --查询empno为7499的记录
10. select * from emp where ename = 'MILLER'; --查询姓名为MiLLER的员工。
11.  select empno, deptno from emp where sal > 1000 and sal < 2000; --查询工资在1000到2000元之间的人
12. select * from emp where sal between 1100 and 2000; --查询工资在[1100,2000]之间的所有的人。
13.  select * from emp where deptno != 30;  --查询部门不等于 30的所有的员工
  或者  select * from emp where deptno <> 30;
14.  select * from emp where ename like 'A%';  --查询出名字以A开头的所有的数据
15. select * from emp where ename like '%N'; --查询出名字以N结尾的所有的数据
16. select * from emp where ename like '%A%';  --查询出名字中包含A的所有的数据
17. select * from emp where deptno = 10 or deptno = 20;  --查询出部门是10号部门或者20号部门的所有的员工
18. select * from emp where deptno in(10,20);  --查询部门在10,20中的所有的员工
19. select * from emp where comm is null;  --查询comm为空的所有的数据
20. select * from emp where comm is not null; --查询comm不为空的所有的数据
21. create table student(id int(5), name varchar(20));   
22.  insert into student(id,name) values(1, 'zhangsan');
23. insert into emp values(9999, 'zhan', 'CLERK', 7698, now(), 2000, null, 20);
24. insert into emp(empno, job) values(888, 'CLERK');
 --创建表emp1,将emp表结构复制过来，同时将emp表中所有的数据也插入到emp1中
25. create table emp1 as select * from emp;
26. create table emp3 select * from emp where 1 = 1; --同上
27.  create table emp2 select * from emp where 1 = 2; --创建emp2表，只是将表结构复制过来
--创建emp4表，将表结构复制过来，同时将sal大于2000的所有数据插入到 emp4表中。
28. create table emp4 select * from emp where sal > 2000; 
29. insert into emp4 select * from emp where sal <= 2000; -- 将emp中sal<=2000的所有数据都插入到emp4中。
30. insert into emp4(empno,job) select empno,job from emp where sal <= 2000;
31. insert into emp4(empno,job) select empno,ename from emp where sal <= 2000; 

32. drop table emp1, emp2, emp3, emp4,student; --删除多个表
33.  create table stu(id int(5) zerofill); 
34. create table stu2(id int(11) signed); --signed表是有符号 (默认有符号)
35. create table stu2(id int(11) unsigned);  -- unsigned表示无符号
36. create table ss(height decimal(3,2);  --
37. desc emp; --查看表的信息
38. show create table emp; --查看创建表的语句
39.  create table ss(id int(11), name varchar(20), createTime timestamp, birthday timestamp, updateTimie timestamp);



-------------------------------------------------第二天-----------------------------------------------------
--添加字段,并设置默认值
ALTER TABLE 表明 ADD 字段 int(11) DEFAULT '0' ;

1. alter table ss add age int(11);  --给ss表添加一个age字段，数据类型为int

2. alter table ss add (phoneNum varchar(20), height float(5));  --给ss表添加两个字段， 多个字段必须用()括起来

3. alter table ss drop column name; --删除ss表中的name字段，一次只能删除一个

4. alter table ss modify name varchar(10); --修改name数据类型
5. alter table ss change name username varchar(20);  --将name这个字段名改为username
6. truncate table emp1;  --清空表中中所有的数据,删除表中所有数据
7. rename table emp1 to emp2; --将emp1表名重命名为emp2;
8. mysqladmin -uroot -p password 123456 -- dos命令行的命令，将root用户的密码修改为123456
9. create user 'hello'@'localhost' identified by '123456';  --创建一个用户名为hello, 只能在本机上访问，密码为123456
   create user 'hello'@'192.168.2.144' identified by '123456';  --创建一个用户名为hello, 只能在192.168.2.144机器登录，密码为123456
   create user 'hello'@'%' identified by '123456'; --创建一个用户名为hello, 所有机器都可以登录，密码为123456

create user 'sqlbank'@'172.11.1.31' identified by '123456'; 
create user 'sqlbank'@'172.11.1.18' identified by '123456'; 
create user 'sqlbank'@'172.11.1.34' identified by '123456'; 
create user 'sqlbank'@'172.11.1.21' identified by '123456'; 

grant all on spdbank.* to 'hello'@'172.11.1.18' ;
grant all on sqlbank.* to 'sqlbank'@'172.11.1.18' ;
grant all on sqlbank.* to 'sqlbank'@'172.11.1.34' ;
grant all on sqlbank.* to 'sqlbank'@'172.11.1.21' ;
flush privileges;  --刷新权限

--最简单的授权语句
grant all on *.* to 'root'@'%';    --这时是没有密码,没有密码时,可以让远程用户没有密码登录,然后执行修改密码命令  SET PASSWORD = PASSWORD('123456');   就修改密码成功.
grant all on *.* to 'root'@'%'  identified by '123456';  --密码123456

-- 给hello(该用户只能在本机登录)用户, 授予对school这个数据库的所有操作权限
10. grant all on school.* to 'hello'@'localhost';  
   

--将hello(该用户只能在本机登录)用户, 将其的删除表、删除数据的权限撤销。
11. revoke drop, delete on school.* from 'hello'@'localhost';  

-- 将hello(该用户只能在本机登录)用户，授予company中的goods表拥有 增删查改权限。
12. grant insert, update, delete, select on company.goods to 'hello'@'localhost';

--删除用户，在mysql数据库中有 user表，用户都存在该表中。 
13. delete from user where host = 'localhost' and user = 'hello';

-- constraint
14. create table ss(id int, name varchar(20) not null); --创建ss表，name不允许为空。
    create table s2(id int, name varchar(20) not null default 'xxx');  --创建表s2, name不允许为空，默认值为xxx

--创建表ss, id值是唯一的，但是可以插入多个空值
15. create table ss(id int unique); 
    create table s3(id int, unique(id));
    create table s3(id int, name varchar(2), unique(id,name));  

    --表中可以有多个字段，是非空和唯一性约束
16. create table s3(id int primary key, age int not null unique, name varchar(20) not null unique); 
    -- 错误：一个表中只能有一个主键约束的字段。
    create table s2(id int primary key, age int primary key, name varchar(20) not null unique); 
    create table s3(id int, primay key(id));  --指定id为主键
    create table stu(id int, name varchar(2), primary key(id,name)); --将id, name作为联合主键

17. create table s5(id int primary key auto_increment); --auto_incremenet 自增长，只能作用在主键上

18. show variables like '%log%';
    show variables like '%auto_incre%';

19. select * from emp\G;  --以打印的方式查看

20. create table s1(id int primary key auto_increment, name varchar(20)) auto_increment=10000;

    create table s1(id int primary key auto_increment, name varchar(20));
    alter table s1 auto_increment=10000;

--该设置只针对当前会话有效，设置每次递增的值为5
21.  set @@auto_increment_increment=5; 
  
--------------------------------------------------第三天--------------------------------------

1. create table class(id int, name varchar(20)); 
   create table student (
        id int primary key auto_increment, 
        name varchar(20),
        class_id int,
        constraint foreign key (class_id) references class(id));
   alter table class add primary key(id);  --给class添加主键

   insert into class values(1, 'java'),(2, 'web'),(3, 'android');
   insert into student(name,class_id) values ('zhangsan', 1), ('lisi', 2),('wangwu',2),('zhao', 3), ('tianqi', 3);
   insert into student(name,class_id) values ('zhangsan', null); --插入空值也可以

  -- 在删除数据数据的时候，必须先删出字表中相关的数据。
  -- 在公司开发中，我们往往只是从逻辑上指定表与表之间的关联关系，
  -- 而不是从建表语句级别强制的要求，表与表之间遵循这种关联关系。这个语句在一些误操作上会导致数据的塌方，
  -- 而且会使得数据库的查询速度比较慢。
 
2. create table student(id int check(id > 10), name varchar(20));  --检查约束，mysql没有实现

3.  select empno, job, comm, ifnull(comm,0) from emp; 
    select empno, job, comm, ifnull(comm,0) as cc from emp;
    select ename, ifnull(sal, 0) * 12 + ifnull(comm, 0) salary from emp;  
    select e.ename name, e.job, ifnull(e.sal, 0) * 12 + ifnull(e.comm, 0) salary from emp e;

4. 两种用法：
    第一种用法：case when boolean表达式 then ... when boolean表达式 then ...else ... end;
    select case 
        when deptno = 10 then '10号部门' 
        when deptno = 20 then '20号部门' 
        else '其他部门' end description 
    from emp;
    第二种用法：case value when value1 then ... when value2 then ... else ... end;
    select case deptno 
        when 10 then  '10号部门' 
        when 20 then '20号部门' 
        else '其他部门' end description 
    from emp;
5. select date(hiredate) from emp; -- date() 只抽取年月日
6. select year(hiredate) from emp;  --year() 只是抽取年份
7. select month(hiredate) from emp; --month() 只是抽取月份
8. select date_format('2009-12-31 22:20:20', '%Y-%m-%d %H:%i:%s');  --将日期转换为字符串
8.1. select date_format(check_date, '%Y-%m') 'date' ,count(check_date) 'count',state FROM ccheck where check_date like '2017%' and state = '未审核' group by date
   ---------------------------------------------
   %Y  年份的四个数    2017
   %y  年份的两个数字   17
   %M  英语表达的月份  March
   %m  阿拉伯的月份    03
   %d  天数的阿拉伯数字  
   %D  1st 2nd 3rd 4th 
   %H  24小时制度
   %h  12小时制度
   %i  分钟
   %s|%S   秒
9. insert into emp(empno, hiredate) values(333, date_format('2009-12-31 22:20:20', '%Y-%m-%d %H:%i:%s'));
10. select * from emp where deptno not in(10,20); 
    --如果not in 后值中包含 null.没有结果
    select * from emp where deptno not in (10, 20, null);  --******not in 如果存在空值，没有结果
    select * from emp where deptno in (10, 20, null);

11. select * from emp order by sal asc;  --按照升序排序 默认是升序 
    select * from emp order by sal desc;  --按照降序排序
    -- 按照工资的升序排序，如果工资相同，按照名字的升序排序。
    select * from emp order by sal,ename;
    --按照工资的升序排序，如果工资相同，按照名字的降序排序
    select * from emp order by sal,ename desc;
    --按照工资的降序排序，如果工资相同，按照名字的降序排序
    select * from emp order by sal desc,ename desc;

    select * from emp order by hiredate desc; --按照雇佣日期的降序排序

12. 求各部门的平均工资、最大工资、最小工资、人数、总工资。
 组函数：min()  max() avg() sum()  count()
  select deptno, sum(sal) from emp group by deptno;  --各个部门的总工资
  --求各部门的总工资，最小工资，平均工资，人数
  select deptno, sum(sal) sumSal, min(sal) minSal, avg(sal) avgSal, count(empno) c from emp group by deptno; 

12.2 合计,如果null为0
SELECT COALESCE ( SUM ( column_name ), 0 )  FROM table_name

13. select min(sal) from emp;  --求公司的最小工资
    select max(sal) from emp;  --工资的最高工资
    select sum(sal) from emp;  --总工资
    select avg(sal) from emp;  --平均工资
    select count(*) from emp;  --总人数

14. select count(*) from student;  --统计总共有多少条记录
    select count(name) from student;  --统计name有多少个，null值不参与统计 

15. select min(sal),max(sal),sum(*) from emp; 

--根据工种和部门分组，求最小工资。在select后的除了组函数以外的字段都必须出现在group by后
16. select job, deptno, min(sal) from emp group by job, deptno;  

--求出各部门平均工资大于2500的的部门编号以及该部门的平均工资
17. select deptno, avg(sal) from emp group by deptno having avg(sal) > 2500;

18. select * from emp limit 1, 3;  --limit后第一个数字表示索引(从0开始), 第二个数字是length
    select * from emp limit 3;  --默认从索引为0的位置，查询3条数据。

19.select * from emp, dept; -- 该查询会产生一个笛卡尔积

20. --查询员工的工号、姓名、部门编号、部门名字、部门所在的位置。
    select e.empno, e.ename, e.job, e.deptno, d.dname, d.loc from emp e, dept d where e.deptno = d.deptno;

21. data_format() :将日期转换为字符串； select date_format(hiredate, '%Y-%m-%d %H:%i:%s') from emp;
    str_to_date() : 将字符串转换为日期  select str_to_date('2017-03-27 16:17:38', '%Y-%m-%d %H:%i:%s');

-- join ... on .. join前后两张表，on后是表之间的关联关系。
22.select e.empno, d.dname, d.loc from emp e join dept d on d.deptno = e.deptno;


23.查询 订单编号、订单时间(年-月-日)、商品的名字、商品的单价、商品的数量、该订单支付总金额、支付方式('微信支付'|'支付宝支付').
    select o.order_id, date(o.create_time) createTime, g.goods_name, 
           g.goods_price, o.amount, g.goods_price * o.amount totalAmount,
           case pay_type when 'wx' then '微信支付' when 'Alipay' then '支付宝支付' end payType
    from orders o inner join goods g on o.goods_id = g.gid limit 5;

-- left [outer] join .. on ... 做外链接。以右表为基准，满足的条数据查出来，右表中不满足条件的数据也出来。
24.select e.empno, e.ename, e.job, e.deptno, d.dname, d.loc from dept d right join emp e on e.deptno = d.deptno;
   select e.empno, e.ename, e.job, e.deptno, d.dname, d.loc from emp e left join dept d on e.deptno = d.deptno;

  select e.empno, e.ename, e.job, d.deptno, d.dname, d.loc from emp e right outer join dept d on e.deptno = d.deptno;

--------------------------------------------第四天---------------------------------------------------------

1. 查询出工资最低员工的 empno、ename、job、hiredate;
select empno, ename, job, hiredate from emp where sal = (select min(sal) from emp);  --子查询

2. 查询工资比BLAKE工资的高的员工的 empno, ename, job;
select empno, ename, job from emp where sal > (select sal from emp where ename = 'BLAKE');

3.查询部门名字，以及部门的平均工资。
select d.dname, avg(ifnull(e.sal, 0)) from emp e right join dept d on e.deptno = d.deptno group by d.dname;

4.查询出员工的empno, ename, 上级领导的empno, ename. 
select e.empno, e.ename, e1.empno, e1.ename from emp e left join emp e1 on e.mgr = e1.empno; 

5.查询比平均工资高的员工的ename, job, deptno, dname;
select e.ename, e.job, e.deptno, d.dname 
    from emp e join dept d on e.deptno = d.deptno 
        where e.sal > (select avg(sal) from emp)

6.查询出与WARD工种相同，但是工资比他高的员工。
select * from emp 
    where job = (select job from emp where ename = 'WARD') 
    and sal > (select sal from emp where ename = 'WARD');

7. 查询出1981年进公司的员工有多少人。
select count(*) from emp where year(hiredate) = 1981;

8.查询比20号部门平均工资高的员工的ename, job, empno;
select ename, job, empno from emp where sal > (select avg(sal) from emp where deptno = 20);

9.查询出部门员工大于3人的部门的名字于部门编号，以及该部门的员工人数。
select e.deptno, d.dname, count(*) from emp e join dept d on e.deptno = d.deptno group by e.deptno, d.dname having count(*) > 3;
 
10.查询order_id, 账户名， create_time, goods_name, goods_price, 总金额。 
    select o.order_id, a.account_name, o.create_time, g.goods_name, g.goods_price, o.amount * g.goods_price 
        from orders o join goods g on o.goods_id = g.gid 
             join account a on o.account_id = a.id;

11.查询出各个平台支付总金额。
select a.platform, sum(o.amount * g.goods_price)  
    from orders o join goods g on o.goods_id = g.gid 
         join account a on o.account_id = a.id 
    group by  a.platform;

12. 查询 花钱最多的账户名，所花的钱, 取前十名；
select a.account_name, sum(o.amount * g.goods_price)
    from orders o join goods g on o.goods_id = g.gid 
         join account a on o.account_id = a.id 
    group by a.account_name 
    order by sum(o.amount * g.goods_price) desc limit 10;

13. 查询order_id, 账户名， create_time, goods_name, goods_price, 总金额, 
    时间在 2015-12-08 00:00:00 至 2015-12-10 23:59:59之间下单，使用微信支付，查询第二页(每页5条)
 select o.order_id, a.account_name, o.create_time, g.goods_name, g.goods_price, o.amount * g.goods_price 
        from orders o join goods g on o.goods_id = g.gid 
             join account a on o.account_id = a.id 
        where 
            a.create_time between str_to_date('2015-12-08 00:00:00', '%Y-%m-%d %H:%i:%s') 
                           and str_to_date(' 2015-12-10 23:59:59', '%Y-%m-%d %H:%i:%s') 
            and o.pay_type = 'wx' limit 5, 5;


--删除语句
DELETE FROM 表明 WHERE 字段 = 值;

--去重
25.mysql> select distinct(column_name) from emp;

--行列转换
+----+------+------------+--------+
| Id | Name | Date       | Scount |
+----+------+------------+--------+
|  1 | 小说 | 2013-09-01 |  10000 |
|  2 | 微信 | 2013-09-01 |  20000 |
|  3 | 小说 | 2013-09-02 |  30000 |
|  4 | 微信 | 2013-09-02 |  35000 |
|  5 | 小说 | 2013-09-03 |  31000 |
|  6 | 微信 | 2013-09-03 |  36000 |
|  7 | 小说 | 2013-09-04 |  35000 |
|  8 | 微信 | 2013-09-04 |  38000 |
+----+------+------------+--------+
--行列转换
select date,max(case name when '小说' then scount else 0 end) '小说' ,max(case name when '微信' then scount else 0 end )'微信' from tabname GROUP BY date;

--行列转换统计
select Date, group_concat(NAME,'总量:',Scount) as b_str from TabName group by Date

--行列转换统计2
select Date,NAME, concat(NAME,'总量:',Scount) as b_str from TabName  group by Date ,NAME

-->批量更新
-->简单
UPDATE
	tableName
SET 
	coulmnName1 = CASE id
WHEN 1 THEN 'abc'
WHEN 2 THEN 'qwe'
WHEN 3 THEN 'zxc'
END 
WHERE id in (1,2,3)

-->简单附带其他条件
UPDATE
	tableName
SET 
	coulmnName1 = CASE id
WHEN 1 THEN 'abc'
WHEN 2 THEN 'qwe'
WHEN 3 THEN 'zxc'
END 
WHERE id in (1,2,3)
AND job = 'java'

-->复杂批量更新
UPDATE
	tableName
SET 
	coulmnName1 = CASE id
WHEN 1 THEN 'abc'
WHEN 2 THEN 'qwe'
WHEN 3 THEN 'zxc'
END ,
  coulmnName2 = CASE id
WHEN 1 THEN 'rty'
WHEN 2 THEN 'fgh'
WHEN 3 THEN 'vbn'
END
WHERE id in (1,2,3)

-->复杂批量更新2
UPDATE lb_video
SET lecturer = 'aaa',
 courseID = '1',
 courseName = 'aa',
 lastUserID = '1',
 lastDtm = NOW(),
 title = CASE id
WHEN 1 THEN
	"AAA"
WHEN 2 THEN
	"CCC"
WHEN 3 THEN
	"CCC"
END
WHERE
	id IN (1, 2, 3)

-->mysql数据远程导入导出
-->导入mysql -P 3306 -h 192.168.8.203 -uroot -p123456 aaa < /test.sql
mysql -P 3306 -h 192.168.8.203 -uroot -p123456 aaa < /test.sql
-->导出 mysqldump -u账号 -p密码 数据库名 > 绝对路径加文件名和后缀
-->例mysqldump -uroot -p test > c:/test.sql
mysqldump -P 3306 -h 192.168.8.203 -uroot -p123456 aaa>/test.sql
-->Java代码执行mysqldump 命令失败,需要将 > 改  成--result-file  或 -r
-->例如:mysqldump -u账号 -p密码 数据库名 --result-file 绝对路径加文件名和后缀
-->导入数据不需要将 < 转义

-->四舍五入
-->往下浮动-整数
select FLOOR(1.23); --> 1
select FLOOR(-1.23); --> -2
-->往上浮动-整数
select CEILING(1.23); --> 2
select CEILING(-1.23); --> -1
-->四舍五入-整数
select ROUND(-1.23); --> -1
select ROUND(-1.58);  --> -2
select ROUND(1.58); --> 2
-->四舍五入-小数
select ROUND(1.298, 1);  --> 1.3
select ROUND(1.298, 2);  --> 1.3
select ROUND(1.291, 2);  --> 1.29
select ROUND(1.298, 0); --> 1

--如果就 if
-->SELECT IF(expr1,expr2,expr3) 
SELECT IF( 5 < 10 ,'正确','错误') -->正确 

-->如果空则为0,如果null则为0
SELEC IFNULL(字段,0) 表名



--------------------------------------------------------------- 字符串
-->字符串替换
--> UPDATE 表 SET 字段 = REPLACE(字段,'源字符串','新字符串')
UPDATE lb_video SET coverPath = REPLACE(coverPath,'10.0.1.12:80','www.lenovo-edu.com:40081');

-->字符串长度
SELECT CHAR_LENGTH('中国'); --> 2

-->substring_index
SELECT SUBSTRING_INDEX('中国_广东_深圳','_',1); -->中国
SELECT SUBSTRING_INDEX('中国_广东_深圳','_',2); -->中国_广东

-->substring
SELECT SUBSTRING('中国_广东',4); -->广东

--字符串拼接
SELECT CONCAT("A"," ","B");

-->binary   区分大小写查询
select * from emp where binary ename like 'K%';
select * from emp where binary ename = 'KING';


--------------------------------------------------------------- 触发器
--所有触发器
SELECT * FROM information_schema.`TRIGGERS`;
--显示自定义触发器
SHOW TRIGGERS;
--删除触发器
DROP TRIGGER 触发器名;
DROP TRIGGER IF EXISTS 触发器名; 

--创建触发器
-- AFTER|BEFORE
-- INSERT|UPDATE|DELETE
DROP TRIGGER IF EXISTS 触发器名;  -- 删除触发器
CREATE TRIGGER 触发器名 -- 创建触发器
AFTER INSERT ON 表名 -- 在某表执行新增之后执行
FOR EACH ROW -- 循环所更新的行内容
BEGIN
    需要操作的内容;
    -- old.字段名 --该行的内容
    -- new.字段名 --该行的内容
END;


--触发器与IF使用
DROP TRIGGER IF EXISTS 触发器名;  -- 删除触发器
CREATE TRIGGER 触发器名 -- 创建触发器
AFTER INSERT ON 表名 -- 在某表执行新增之后执行
FOR EACH ROW -- 循环所更新的行内容
BEGIN
	IF(new.`name` LIKE '%学校')
	THEN
	需要操作的内容;
    END IF;
END;

--触发器变量使用
DROP TRIGGER IF EXISTS 触发器名;  -- 删除触发器
CREATE TRIGGER 触发器名 -- 创建触发器
AFTER INSERT ON 表名 -- 在某表执行新增之后执行
FOR EACH ROW -- 循环所更新的行内容
BEGIN
    SET @变量 = ( SELECT 字段 FROM 表名 WHERE 条件 )
    INSERT INTO 表明 ( 字段 ) VALUES ( @变量 )
END

------------------------------------------------- 存储过程 -------------------------------------------------
DROP PROCEDURE IF EXISTS 名称;
CREATE PROCEDURE 名称 () 
BEGIN 

END;; 

-- 调用存储过程
CALL 名称();



------------------------------------------------- !FIND_IN_SET -------------------------------------------------
--这是个特殊的内联查询,字段的格式是 1,2,3,4,5 或 ,1,2,3,4,5,
--基本语句
SELECT * FROM 表名 WHERE !FIND_IN_SET(值,字段);
--也可以用于级联
SELECT * FROM A表 LEFT JOIN B表 ON !FIND_IN_SET(B表.字段,A表.字段); -- A表.字段:格式为 1,2,3,4,5  B表.字段 字段格式为int
-- SELECT * FROM A表 LEFT JOIN B表 ON A表.字段 = B表.字段 


--------------------------------------------------Mybatis--------------------------------------------------
-->如果数据相同，返回值为0
需要在jdbc地址后边追加参数  useAffectedRows=true  
例:  jdbc_url=jdbc:mysql://192.168.8.206:3306/cloudecker?useAffectedRows=true
