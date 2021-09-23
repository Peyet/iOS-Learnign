//
//  main.m
//  05KVC
//
//  Created by Peyet-Zhao on 2021/9/23.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        Person *person = [Person new];
        
        Dog *dog = [Dog new];
        
//        [person setValue:@"john" forKeyPath:@"name"];
//        [person setValue:@"wong@qq.com" forKeyPath:@"email"];
//        [person setValue:@19999 forKeyPath:@"dog.length"];
//        @"ss".length;
        
        [person setValue:dog forKeyPath:@"dog"];
        [person setValue:@"john" forKeyPath:@"name"];
        [person setValue:@"wong@qq.com" forKeyPath:@"email"];
        [person setValue:@"Mr. Dog" forKeyPath:@"dog.name"];
        [person setValue:@"Red!!" forKeyPath:@"dog.color"];

        
        
        NSLog(@"name: %@, \nemail: %@, \ndog: %@", person.name, person.email, person.dog.name);
        
        
        // get value
        NSString *value = [person valueForKeyPath:@"dog.color"];
        
        NSLog(@"dog color : %@", value);
        
        //------------------------------------------------------
        //-------------------------对象转成字典---------------------
        NSDictionary *dict = [person dictionaryWithValuesForKeys: @[@"name", @"email", @"dog", @"dog"]];
        NSLog(@"trans model to dictionary\ndict:%@", dict);
    }
    return 0;
}
