//
//  YCArchiveBaseModel.m
//  IDTest
//
//  Created by yuchenAaron on 2017/12/15.
//  Copyright © 2017年 yuchenAaron. All rights reserved.
//

#import "YCArchiveBaseModel.h"
#import <objc/runtime.h>

@implementation YCArchiveBaseModel

- (void)encodeWithCoder:(NSCoder *)aCoder{
    
    unsigned int count = 0;
    objc_property_t *propertylist = class_copyPropertyList([self class], &count);
    for (int i = 0; i < count; i++) {
        const char *propertyCName = property_getName(propertylist[i]);
        NSString *propertyName = [NSString stringWithUTF8String:propertyCName];
        id value = [self valueForKey:propertyName];
        [aCoder encodeObject:value forKey:propertyName];
    }
    
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    unsigned int count =0;
    //1.取出所有的属性
    objc_property_t *propertes = class_copyPropertyList([self class], &count);
    //2.遍历所有的属性
    for (int i = 0; i < count; i++) {
        //获取当前遍历到的属性名称
        const char *propertyName = property_getName(propertes[i]);
        NSString *name = [NSString stringWithUTF8String:propertyName];
        //解归档前遍历得到的属性的值
        id value = [aDecoder decodeObjectForKey:name];
        //             self.className = [decoder decodeObjectForKey:@"className"];
        [self setValue:value forKey:name];
    }
    return self;
}

@end
