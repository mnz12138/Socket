//
//  SocketRocketManager.h
//  Socket
//
//  Created by Apple on 2018/4/3.
//  Copyright © 2018年 王全金. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    disConnectByUser ,
    disConnectByServer,
} DisConnectType;

//webScoket三方库使用封装
@interface SocketRocketManager : NSObject

+ (instancetype)share;

- (void)connectIp:(NSString *)server_ip port:(unsigned short)server_port;
- (void)disConnect;

- (void)sendMsg:(NSString *)msg;

- (void)ping;

@end
