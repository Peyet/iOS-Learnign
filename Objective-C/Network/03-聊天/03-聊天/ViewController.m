//
//  ViewController.m
//  03-聊天
//
//  Created by Peyet-Zhao on 2021/10/23.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"
#import <sys/socket.h>
#import <netinet/in.h>
#import <arpa/inet.h>


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *ipView;
@property (weak, nonatomic) IBOutlet UITextField *portView;
@property (weak, nonatomic) IBOutlet UITextField *messageView;
@property (weak, nonatomic) IBOutlet UILabel *recvMessageView;
@property (nonatomic, assign) int clientSocket;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)connectClicked:(id)sender {
    [self connect:self.ipView.text port:[self.portView.text intValue]];
}
- (IBAction)sendClicked:(id)sender {
    self.recvMessageView.text = [self sendAndRecv:self.messageView.text];
}

- (BOOL)connect:(NSString *)ip port:(int)port {
    // 创建socket
    int clientSocket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    self.clientSocket = clientSocket;
    
    struct sockaddr_in addr;
    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = inet_addr(ip.UTF8String);
    addr.sin_port = htons(port);
    int rst = connect(clientSocket, (const struct sockaddr *)&addr, sizeof(addr));
    if (!rst) {
        NSLog(@"成功");
        return YES;
    } else {
        NSLog(@"失败");
        return NO;
    }
}
//const char *msg = "hello world";
//ssize_t sendCount  = send(clientSocket, msg, strlen(msg), 0);
//NSLog(@"发送的字节数 %zd", sendCount);

- (NSString *)sendAndRecv:(NSString *)sendMsg {
    const char *msg = sendMsg.UTF8String;
    ssize_t sendCount  = send(self.clientSocket, msg, strlen(msg), 0);
    NSLog(@"发送的字节数 %zd", sendCount);

    uint8_t buffer[1024];
    ssize_t recvCount = recv(self.clientSocket, buffer, sizeof(buffer), 0);
    NSLog(@"接受的字节数: %zd", recvCount);
    NSData* data = [NSData dataWithBytes:buffer length:recvCount];
    NSString* recvString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"接收到的文字%@", recvString);
    return recvString;
}

@end
