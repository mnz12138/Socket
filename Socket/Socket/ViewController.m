//
//  ViewController.m
//  Socket
//
//  Created by Apple on 2018/4/3.
//  Copyright © 2018年 王全金. All rights reserved.
//

#import "ViewController.h"
#import "SocketManager.h"
#import "CocoaAsyncSocketManager.h"
#import "SocketRocketManager.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *messageTextField;

@property (strong, nonatomic) SocketManager *socketManager;
@property (strong, nonatomic) CocoaAsyncSocketManager *cocoaAsyncSocketManager;
@property (strong, nonatomic) SocketRocketManager *socketRocketManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _socketManager = [SocketManager share];
    _cocoaAsyncSocketManager = [CocoaAsyncSocketManager share];
    _socketRocketManager = [SocketRocketManager share];
}

- (IBAction)sendAction {
//    [_socketManager sendMsg:self.messageTextField.text];
    
//    [_cocoaAsyncSocketManager sendMsg:self.messageTextField.text];
    
    [_socketRocketManager sendMsg:self.messageTextField.text];
}
- (IBAction)connectAction {
//    [_socketManager connectIp:"127.0.0.1" port:6969];
    
//    [_cocoaAsyncSocketManager connectIp:@"127.0.0.1" port:6969];
    
    [_socketRocketManager connectIp:@"127.0.0.1" port:6969];
}
- (IBAction)disconnectAction {
//    [_socketManager disConnect];
    
//    [_cocoaAsyncSocketManager disConnect];
    
    [_socketRocketManager disConnect];
}
- (IBAction)sendPingAction {
    [_socketRocketManager ping];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
