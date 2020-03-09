//
//  ShareViewController.h
//  Share
//
//  Created by vivi wu on 2020/3/9.
//  Copyright © 2020 viviwu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>


#define SUPPORTED_EXTENTIONS @[@"public.jpeg",@"com.compuserve.gif",@"public.url",@"public.movie",@"com.apple.mapkit.map-item",@"com.adobe.pdf",@"public.png",@"public.image"]

@interface ShareViewController : SLComposeServiceViewController

@end
