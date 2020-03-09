//
//  constant.h
//  DailyNote
//
//  Created by vivi wu on 2020/3/9.
//  Copyright © 2020 viviwu. All rights reserved.
//

#ifndef constant_h
#define constant_h


#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH  [UIScreen mainScreen].bounds.size.height

#define kSelfViewW  self.view.bounds.size.width
#define kSelfViewH  self.view.bounds.size.height

#define kUserDef [NSUserDefaults standardUserDefaults]
#define kUserDef_OBJ(s) [[NSUserDefaults standardUserDefaults] objectForKey:s]

/* ****************************************************************************************************************** */
//宏
#define Number(x)               [NSNumber numberWithInteger:x]

#define UserDefaultString(s)    [[NSUserDefaults standardUserDefaults] objectForKey:s]
#define UserDefaultInteger(s)   [[[NSUserDefaults standardUserDefaults] objectForKey:s] integerValue]
#define UserDefaultBool(s)      [[[NSUserDefaults standardUserDefaults] objectForKey:s] boolValue]
#define UserDefaultFloat(s)     [[[NSUserDefaults standardUserDefaults] objectForKey:s] floatValue]

/* ****************************************************************************************************************** */
#define LString(key)             NSLocalizedStringFromTableInBundle(key,nil,currentBundle(),nil)


/* ****************************************************************************************************************** */

/* ****************************************************************************************************************** */
 
/* ****************************************************************************************************************** */

#endif /* constant_h */
