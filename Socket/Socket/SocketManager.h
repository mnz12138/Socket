//
//  SocketManager.h
//  Socket
//
//  Created by Apple on 2018/4/3.
//  Copyright © 2018年 王全金. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SocketManager : NSObject

+ (instancetype)share;
- (void)connectIp:(const char *)server_ip port:(short)server_port;
- (void)disConnect;
- (void)sendMsg:(NSString *)msg;

@end
