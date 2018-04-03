var WebSocketServer = require('ws').Server,

wss = new WebSocketServer({ port: 6969 });
wss.on('connection', function (ws) {
    console.log('client connected');

    ws.send('你是第' + wss.clients.length + '位');  

    // 打开WebSocket连接后立刻发送一条消息:
    ws.on('open', function () {
        console.log(`[CLIENT] open()`);
        ws.send('Hello!');
    });

    //收到消息回调
    ws.on('message', function (message) {
        console.log(message);
        ws.send('收到:'+message);  
    });

     // 退出聊天  
    ws.on('close', function(close) {  
      
        console.log('退出连接了');  
    });  
});
console.log('开始监听6969端口');
