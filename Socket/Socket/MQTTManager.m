//
//  MQTTManager.m
//  Socket
//
//  Created by Apple on 2018/4/3.
//  Copyright © 2018年 王全金. All rights reserved.
//

#import "MQTTManager.h"
#import <MQTTKit.h>

static  NSString * KClientID = @"wangquanjin";

@interface MQTTManager() {
    MQTTClient *client;
}

@end

@implementation MQTTManager

+ (instancetype)share
{
    static dispatch_once_t onceToken;
    static MQTTManager *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

//初始化连接
- (void)initSocketIp:(NSString *)server_ip port:(unsigned short)server_port {
    if (client) {
        [self disConnect];
    }
    
    
    client = [[MQTTClient alloc] initWithClientId:KClientID];
    client.port = server_port;
    
    [client setMessageHandler:^(MQTTMessage *message) {
         //收到消息的回调，前提是得先订阅
         NSString *msg = [[NSString alloc]initWithData:message.payload encoding:NSUTF8StringEncoding];
         NSLog(@"收到服务端消息：%@",msg);
     }];
    
    [client connectToHost:server_ip completionHandler:^(MQTTConnectionReturnCode code) {
        switch (code) {
            case ConnectionAccepted:
                NSLog(@"MQTT连接成功");
                //订阅自己ID的消息，这样收到消息就能回调
                [client subscribe:client.clientID withCompletionHandler:^(NSArray *grantedQos) {
                    NSLog(@"订阅wangquanjin成功");
                }];
                break;
            case ConnectionRefusedBadUserNameOrPassword:
                NSLog(@"错误的用户名密码");
                //....
            default:
                NSLog(@"MQTT连接失败");
                break;
        }
    }];
}

#pragma mark - 对外的一些接口
//建立连接
- (void)connectIp:(NSString *)server_ip port:(unsigned short)server_port {
    [self initSocketIp:server_ip port:server_port];
}

//断开连接
- (void)disConnect {
    if (client) {
        //取消订阅
        [client unsubscribe:client.clientID withCompletionHandler:^{
            NSLog(@"取消订阅wangquanjin成功");
            
        }];
        //断开连接
        [client disconnectWithCompletionHandler:^(NSUInteger code) {
            NSLog(@"断开MQTT成功");
        }];
        
        client = nil;
    }
}

//发送消息
- (void)sendMsg:(NSString *)msg {
    //发送一条消息，发送给自己订阅的主题
//    typedef enum MQTTQualityOfService : NSUInteger {
//        AtMostOnce,
//        AtLeastOnce,
//        ExactlyOnce
//    } MQTTQualityOfService;
//    QOS(0),最多发送一次：如果消息没有发送过去，那么就直接丢失。
//    QOS(1),至少发送一次：保证消息一定发送过去，但是发几次不确定。
//    QOS(2),精确只发送一次：它内部会有一个很复杂的发送机制，确保消息送到，而且只发送一次。
    [client publishString:msg toTopic:KClientID withQos:ExactlyOnce retain:YES completionHandler:^(int mid) {
        
    }];
}

@end
