//
//  CocoaAsyncSocketManager.h
//  Socket
//
//  Created by Apple on 2018/4/3.
//  Copyright © 2018年 王全金. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CocoaAsyncSocketManager : NSObject

+ (instancetype)share;
- (BOOL)connectIp:(NSString *)server_ip port:(const uint16_t)server_port;
- (void)disConnect;
- (void)sendMsg:(NSString *)msg;
- (void)pullTheMsg;

@end
