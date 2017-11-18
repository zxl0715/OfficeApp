from apscheduler.schedulers.blocking import BlockingScheduler



import time

def my_job():
    with open("douban.txt", "a") as f:
        f.write("这是个测试！"+time.strftime("%H:%M:%S"))
        f.write('\n')
    print('hello world'+"这是个测试！"+time.strftime("%H:%M:%S"))



def my_scheduler(runtime):
    sched = BlockingScheduler()  # 生成对象
    sched.add_job(my_job, 'interval', seconds=runtime)  # 在指定时间运行一次
    sched.start()


if __name__ == '__main':
    my_scheduler(3)
else:
    my_scheduler(3)

