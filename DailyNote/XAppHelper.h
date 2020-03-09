//
//  XAppHelper.h
//  DailyNote
//
//  Created by vivi wu on 2020/3/9.
//  Copyright © 2020 viviwu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define IPAD (XAppHelper.runningOnIpad)

@interface XAppHelper : NSObject

+ (instancetype)instance;

+ (BOOL)runningOnIpad;

@end

NS_ASSUME_NONNULL_END
