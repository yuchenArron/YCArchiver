//
//  YCArchiveBaseModel+ArchiveMethod.h
//  IDTest
//
//  Created by yuchenAaron on 2017/12/15.
//  Copyright © 2017年 yuchenAaron. All rights reserved.
//

#import "YCArchiveBaseModel.h"

@interface YCArchiveBaseModel (ArchiveMethod)

+ (void)archiveWithObjc:(id)objc;
+ (id)unarchive;

@end
