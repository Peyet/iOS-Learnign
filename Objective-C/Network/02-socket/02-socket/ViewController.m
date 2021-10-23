//
//  ViewController.m
//  02-socket
//
//  Created by Peyet-Zhao on 2021/10/23.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"
#import <sys/socket.h>
#import <netinet/in.h>
#import <arpa/inet.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 创建socket
    int clientSocket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    
    // 链接服务器
//    struct sockaddr {
//        __uint8_t       sa_len;         /* total length */
//        sa_family_t     sa_family;      /* [XSI] address family */
//        char            sa_data[14];    /* [XSI] addr value (actually larger) */
//    };

    struct sockaddr_in addr;
    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = inet_addr("127.0.0.1");
    addr.sin_port = htons(12345);
    int rst = connect(clientSocket, (const struct sockaddr *)&addr, sizeof(addr));
    if (!rst) {
        NSLog(@"成功");
        const char *msg = "hello world";
        ssize_t sendCount  = send(clientSocket, msg, strlen(msg), 0);
        NSLog(@"发送的字节数 %zd", sendCount);
    } else {
        NSLog(@"失败");
    }
    
    // 接受数据
    uint8_t buffer[1024];
    ssize_t recvCount = recv(clientSocket, buffer, sizeof(buffer), 0);
    NSLog(@"接受的字节数: %zd", recvCount);
    NSData* data = [NSData dataWithBytes:buffer length:recvCount];
    NSString* recvString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"接收到的文字%@", recvString);
    
    close(clientSocket);
}


@end
