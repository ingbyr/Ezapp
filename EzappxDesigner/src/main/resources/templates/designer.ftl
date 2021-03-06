<!DOCTYPE html>
<html>
<head>
    <link rel='stylesheet' type='text/css' href='http://cdn.ezappx.com/css/grapes.min.css'>
    <link rel='stylesheet' type='text/css' href='http://cdn.ezappx.com/css/bootstrap.min.css'>
    <link rel='stylesheet' type='text/css' href='/css/designer.css'/>

    <script src='http://cdn.ezappx.com/js/grapes.min.js'></script>
    <script src='http://cdn.ezappx.com/js/jquery.min.js '></script>
    <script src='http://cdn.ezappx.com/js/popper.min.js'></script>
    <script src='http://cdn.ezappx.com/js/bootstrap.min.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/ckeditor@4.9.2/ckeditor.js'></script>
    <script src='http://cdn.ezappx.com/js/grapesjs-plugin-ckeditor.min.js'></script>

    <script src='http://cdn.ezappx.com/js/ezappx-plugin-toolbar.min.js'></script>
    <script src='http://cdn.ezappx.com/js/ezappx-plugin-es.min.js'></script>
    <script src='http://cdn.ezappx.com/js/ezappx-plugin-export.min.js'></script>
    <script src='http://cdn.ezappx.com/js/ezappx-plugin-f7.min.js'></script>

    <title>Ezappx Designer</title>
</head>

<body>
<div id='gjs'></div>

<div id='tip'></div>

<script type='text/javascript' th:inline='javascript'>
    const editor = grapesjs.init({
        height: '100%',
        showOffsets: 1,
        noticeOnUnload: 0,
        storageManager: {
            id: 'gjs-',
            contentTypeJson: true,
            type: 'remote',
            stepBeforeSave: 1,
            urlStore: '${storeApi}',
            urlLoad: '${loadApi}',
            autosave: false,
            autload: true,
        },
        container: '#gjs',
        fromElement: true,

        plugins: [
            'grapesjs-plugin-ckeditor',
            'ezappx-plugin-es',
            'ezappx-plugin-export',
            'ezappx-plugin-toolbar',
            'ezappx-plugin-f7'],

        pluginsOpts: {
            'ezappx-plugin-export': {
                tipDivId: 'tip',
                username: '${username}',
                projectName: '${username}',
                uploadApi: '/upload/projectFile',
                exportApi: '/export/mobileAppProject'
            },

            'ezappx-plugin-toolbar': {
                clearCanvas: {
                    id: '#clear-canvas',
                    confirmBtnId: '#confirm-clear-canvas',
                    cancleBtnId: '#cancle-clear-canvas'
                },
                displayAboutId: '#display-about',
                remoteStorageApi: 'http://localhost:8080/remoteStorageApi',
                tipDivId: 'tip',
            },

            'ezappx-plugin-f7': {
                appName: 'ezappx-test'
            },

            'grapesjs-plugin-ckeditor': {}
        },

        canvas: {
            styles: ['https://cdn.jsdelivr.net/npm/framework7@3.4.2/css/framework7.min.css'],
            scripts: [
                'https://cdn.jsdelivr.net/npm/framework7@3.4.2/js/framework7.min.js',
                'https://cdn.jsdelivr.net/npm/jquery@3.3.1/dist/jquery.min.js',
                'https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js',
                'https://cdn.jsdelivr.net/npm/stomp-websocket@2.3.4-next/lib/stomp.min.js'],
        },

        assetManager: {
            upload: '${uploadApi}',
            uploadName: 'files',
            params: {
                'username': '${username}',
                'projectName': '${username}'
            }
        },

        deviceManager: {
            devices: [],
        }
    });
    editor.runCommand('set-device-android'); //TODO 应该由后台传入用户设置
    window.editor = editor;
</script>
</body>