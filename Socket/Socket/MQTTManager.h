//
//  MQTTManager.h
//  Socket
//
//  Created by Apple on 2018/4/3.
//  Copyright © 2018年 王全金. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MQTTManager : NSObject

+ (instancetype)share;

- (void)connectIp:(NSString *)server_ip port:(unsigned short)server_port;
- (void)disConnect;

- (void)sendMsg:(NSString *)msg;

@end
