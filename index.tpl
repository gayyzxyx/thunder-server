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
                        <input type="text" class="input-xxlarge" id="down_address" name="down_address">
                        <input type="text" class="span2" id="user_id" name="user_id">
                        <button type="submit" class="btn">download</button>
                    </div>
                </form>
                <table class="table table-bordered table-hover table-striped">
                    <thead>
                    <tr>
                        <td style="word-wrap: break-word" width="60%"><p class="lead text-center">Address</p></td>
                        <td style="word-wrap: break-word" width="20%"><p class="lead text-center">User</p></td>
                        <td style="word-wrap: break-word" width="20%"><p class="lead text-center">Operation</p></td>
                    </tr>
                    </thead>
                    {% for task in tasks %}
                        <tr>
                            <td id="address">{{task.split(' ')[0]}}</td>
                            <td id="user">{{task.split(' ')[1]}}</td>
                            <td style="text-align: center">
                                <div class="btn-group">
                                    <button class="btn">Action</button>
                                    <button class="btn dropdown-toggle" data-toggle="dropdown">
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a href="#" onclick='' data-toggle="popver" data-placement="right" title
                                               data-original-title="Attention">delete</a></li>
                                        <li><a href="#" onclick='' data-toggle="modal" role="button">rename</a></li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                    {% end %}
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>