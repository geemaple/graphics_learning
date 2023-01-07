//
//  main.m
//  ObjcWarmUps
//
//  Created by Dean Ji on 12/28/20.
//  Copyright © 2020 dean. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/objc.h>
#import "Util.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        id __weak weak_obj1;
        {
            id obj1 = [[NSMutableArray alloc] init];
            NSLog(@"%lu", _objc_rootRetainCount(obj1));
            weak_obj1 = obj1;
            NSLog(@"%p", weak_obj1);
            NSLog(@"%lu", _objc_rootRetainCount(weak_obj1));
            _objc_autoreleasePoolPrint();
        }
        NSLog(@"weak_obj1-%@", weak_obj1);
        NSLog(@">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        
        id __weak weak_obj2;
        {
            id obj1 = [NSMutableArray array];
            weak_obj2 = obj1;
            NSLog(@"%p", weak_obj2);
            NSLog(@"%lu", _objc_rootRetainCount(weak_obj2));
            _objc_autoreleasePoolPrint();
        }
        NSLog(@"weak_obj2-%@", weak_obj2);
        NSLog(@">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        
        id __weak weak_obj3;
        @autoreleasepool {
            id obj3 = [NSMutableArray array];
            weak_obj3 = obj3;
            NSLog(@"%p", weak_obj3);
            NSLog(@"%lu", _objc_rootRetainCount(weak_obj3));
            _objc_autoreleasePoolPrint();
        }
        NSLog(@"obj0-3-%@", weak_obj3);
        NSLog(@">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    }
    return 0;
}
