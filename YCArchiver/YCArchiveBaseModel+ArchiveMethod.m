//
//  YCArchiveBaseModel+ArchiveMethod.m
//  IDTest
//
//  Created by yuchenAaron on 2017/12/15.
//  Copyright © 2017年 yuchenAaron. All rights reserved.
//

#import "YCArchiveBaseModel+ArchiveMethod.h"
#import <objc/runtime.h>

#define ArchiveFilePath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"archive.da"]


@implementation YCArchiveBaseModel (ArchiveMethod)

+ (void)archiveWithObjc:(id)objc{
    
    NSMutableData *data = [NSMutableData data];
    //归档
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    
    [archiver encodeObject:objc forKey:@"archive"];
    [archiver finishEncoding];
    
    NSLog(@"data:%@",data);
    [data writeToFile:ArchiveFilePath atomically:YES];
}

+ (id)unarchive{
    //解档
    NSData *unData = [NSData dataWithContentsOfFile:ArchiveFilePath];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:unData];
    YCArchiveBaseModel *unmodel = [unarchiver decodeObjectForKey:@"archive"];
    return unmodel;
}

@end
