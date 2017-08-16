//  weibo: http://weibo.com/xiaoqing28
//  blog:  http://www.alonemonkey.com
//
//  ZhuiShuShenQiFreeSource.m
//  ZhuiShuShenQiFreeSource
//
//  Created by 马旭 on 2017/8/16.
//  Copyright (c) 2017年 yolande. All rights reserved.
//


#import "ZhuiShuShenQiFreeSource.h"
#import "CaptainHook.h"
#import <UIKit/UIKit.h>

CHDeclareClass(CustomViewController)

//decryptKey

CHDeclareClass(SqliteUtils)
CHOptimizedMethod1(self, BOOL, SqliteUtils, bookAllowPirateResource, id, arg1){
    return YES;
}
CHOptimizedMethod1(self, BOOL, SqliteUtils, bookAllowPirateReading, id, arg1) {
    return NO;
}

CHDeclareClass(BookChapterItem)
CHOptimizedMethod0(self, NSString*, BookChapterItem, decryptKey) {
    // fuck... key是购买才能后拿到的256 AES
    NSString *key = CHSuper0(BookChapterItem, decryptKey);
    NSLog(@"%@: key", key);
    return key;
}

CHConstructor{
    CHLoadLateClass(BookChapterItem);
    CHClassHook(0, BookChapterItem, decryptKey);
    
    CHLoadLateClass(SqliteUtils);
    CHClassHook1(SqliteUtils, bookAllowPirateResource);
    CHClassHook1(SqliteUtils, bookAllowPirateReading);
}

