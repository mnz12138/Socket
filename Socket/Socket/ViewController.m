//
//  ViewController.m
//  Socket
//
//  Created by Apple on 2018/4/3.
//  Copyright © 2018年 王全金. All rights reserved.
//

#import "ViewController.h"
#import "SocketManager.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *messageTextField;

@property (strong, nonatomic) SocketManager *socketManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _socketManager = [SocketManager share];
}

- (IBAction)sendAction {
    [_socketManager sendMsg:self.messageTextField.text];
}
- (IBAction)connectAction {
    [_socketManager connectIp:"127.0.0.1" port:6969];
}
- (IBAction)disconnectAction {
    [_socketManager disConnect];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
