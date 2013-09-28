#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import Queue

import tornado.ioloop
import tornado.web

data = Queue.Queue()

def getTask():
    tasks = []
    fp = open('task.txt', 'r+')
    lines = fp.readlines()
    i = 0
    for line in lines:
        tasks.append(line)
    fp.close()
    return tasks

class MainHandler(tornado.web.RequestHandler):
    def get(self):
        print "get"
        self.tasks = getTask()
        if len(self.tasks) == 0:
            #self.write("")
            self.render("index.tpl",tasks=[])
        else:
            self.render("index.tpl", tasks=self.tasks)

    def post(self):
        print "post"
        fp = open('task.txt', 'a')
        url = self.get_argument("down_address")
        path = self.get_argument("user_id")
        if url and path:
            task = "%s %s\n" % (url, path)
            fp.writelines(task)
            fp.flush()
            data.put(task)
            fp.close()
            self.tasks = getTask()
            self.render("index.tpl", tasks=self.tasks)
        else:
            self.write("error")



class task(tornado.web.RequestHandler):
    def get(self):
        print 'get'
        self.taskList = ''
        self.tasks = getTask()
        if len(self.tasks) != 0:
            for task in self.tasks:
                self.taskList += task
            fp = open('task.txt', 'w+')
            for i in range(len(self.tasks)-1):
                fp.write(self.tasks[i+1])
            fp.flush()
            self.write(self.tasks[0])
        else:
            self.write('')

    def post(self):
        print 'post'


application = tornado.web.Application([
    (r"/static/(.*\.(css|js|png|jpg|ico|gif))", tornado.web.StaticFileHandler, dict(path="static")),
    (r"/", MainHandler),
    (r'/download', MainHandler),
    (r'/task', task),
])

if __name__ == "__main__":
    application.listen(8080)
    tornado.ioloop.IOLoop.instance().start()
