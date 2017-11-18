from django.test import TestCase


from apscheduler.schedulers.blocking import BlockingScheduler


def my_job():
    print('hello world')
    logger.info
def  my_scheduler(runtime):

    sched = BlockingScheduler()#生成对象
    sched.add_job(my_job, 'interval', seconds=runtime)#在指定时间运行一次
    sched.start()

if __name__=='__main':
    my_scheduler(3)

my_scheduler(3)

