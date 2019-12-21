import time


def generate_file_name():
    return time.strftime("%Y-%m-%d-%H_%M_%S", time.localtime(time.time()))
