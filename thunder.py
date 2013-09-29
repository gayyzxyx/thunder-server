#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import tornado.ioloop
import tornado.web
tasks = []

def getTask():
    returnList = []
    for line in tasks:
        returnList.append("%s\n%s" % (line["url"], line["path"]))
    return returnList

class MainHandler(tornado.web.RequestHandler):
    def get(self):
        print "get"
        if len(tasks) == 0:
            self.render("index.tpl",tasks = [])
        else:
            self.render("index.tpl", tasks = getTask())

    def post(self):
        print "post"
        url = self.get_argument("url")
        path = self.get_argument("path")
        task = {}
        if url and path:
            task["url"] = url
            task["path"] = path
            tasks.append(task)
            self.render("index.tpl", tasks = getTask())
        else:
            self.write("error")



class task(tornado.web.RequestHandler):
    def get(self):
        print 'get'
        if len(tasks):
            returnTask = '%s\n%s' % (tasks[0]["url"], tasks[0]["path"])
            self.write(returnTask)
            tasks.remove(tasks[0])
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
