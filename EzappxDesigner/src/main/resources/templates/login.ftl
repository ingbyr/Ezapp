<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel='stylesheet' type='text/css' href='http://cdn.ezappx.com/css/bootstrap.min.css'>
    <link rel="stylesheet" type="text/css" th:href="@{/css/designer.css}"/>

    <!--jQuery first, then Popper.js, then Bootstrap JS -->
    <script src='http://cdn.ezappx.com/js/jquery.min.js '></script>
    <script src='http://cdn.ezappx.com/js/popper.min.js'></script>
    <script src='http://cdn.ezappx.com/js/bootstrap.min.js'></script>


    <title>Ezappx登陆</title>
</head>
<body>
<div class="container h-100">
    <div class="row h-100 justify-content-center align-items-center">
        <div class="card" style="width: 30rem">
            <div class="card-header">
                Ezappx登陆
            </div>
            <div class="card-body">
                <form action="/login" method="post" class="center-form">
                    <div class="form-group">
                        <label for="username">用户名</label>
                        <input type="text" class="form-control" name="username" placeholder="输入用户名">
                    </div>
                    <div class="form-group">
                        <label for="password">密码</label>
                        <input type="password" class="form-control" name="password" placeholder="输入密码">
                    </div>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" name="remember-me"/> <a>保存登陆状态</a>
                    </div>
                    <div class="row m-auto">
                        <button type="submit" class="btn btn-primary">登陆</button>
                        <a href="/register" class="btn btn-secondary ml-3">新用户注册</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>