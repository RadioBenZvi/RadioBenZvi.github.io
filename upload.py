from os import system
from apscheduler.schedulers.background import BackgroundScheduler
from datetime import date, datetime
from time import sleep

global theJobDone
theJobDone = False
sched = BackgroundScheduler()

def theJob():
    print("Executing Task...")

    system("git add .")
    system("git commit -m \"TheUpdate\"")
    system("git push")

    print("Task completed successfully")
    global theJobDone
    theJobDone = True

sched.add_job(
    theJob,
    'date',
    run_date = datetime(2022, 9, 20, 12, 0, 0)
)

# Starts the Scheduled jobs
sched.start()

# Runs an infinite loop
while not theJobDone:
    sleep(1)