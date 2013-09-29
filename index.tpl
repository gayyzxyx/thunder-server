<!DOCTYPE html>
<html>
<head>
    <title>Thunder</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="/static/css/bootstrap.min.css" rel="stylesheet" media="screen">
</head>
<body>
<script src="/static/js/jquery-1.7.2.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<div class="container">
    <div class="tabbable">
        <div class="tab-content">
            <div class="tab-pane active in fade" id="file-download">
                <form class="form-search" action="/download" method="post">
                    <h2 style="margin-bottom: 10px">File Address:</h2>
                    <div class="input-append">
                        <input type="text" class="input-xxlarge" id="url" name="url">
                        <input type="text" class="span2" id="path" name="path">
                        <button type="submit" class="btn">download</button>
                    </div>
                </form>
                <table class="table table-bordered table-hover table-striped">
                    <thead>
                    <tr>
                        <td style="word-wrap: break-word" width="60%"><p class="lead text-center">Address</p></td>
                        <td style="word-wrap: break-word" width="20%"><p class="lead text-center">Folder</p></td>
                    </tr>
                    </thead>
                    {% for task in tasks %}
                        <tr>
                            <td id="address">{{task.split('\n')[0]}}</td>
                            <td id="user">{{task.split('\n')[1]}}</td>
                        </tr>
                    {% end %}
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>