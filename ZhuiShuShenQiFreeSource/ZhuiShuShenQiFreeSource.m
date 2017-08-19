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


CHDeclareClass(SqliteUtils)
CHOptimizedMethod1(self, BOOL, SqliteUtils, bookAllowPirateResource, id, arg1){
    return YES;
}
CHOptimizedMethod1(self, BOOL, SqliteUtils, bookAllowPirateReading, id, arg1) {
    return NO;
}


@interface ReadViewLabel : UILabel
@end

CHDeclareClass(ReadViewLabel)
CHOptimizedMethod1(self, void, ReadViewLabel, drawTextInRect, struct CGRect, arg1) {
    CHSuper1(ReadViewLabel, drawTextInRect, arg1);
    NSArray<UIView *> *arr = self.subviews;
    for(int i = 0; i < arr.count; i++) {
        [arr[i] removeFromSuperview];
    }
}

CHConstructor{
    CHLoadLateClass(SqliteUtils);
    CHClassHook1(SqliteUtils, bookAllowPirateResource);
    CHClassHook1(SqliteUtils, bookAllowPirateReading);
    
    CHLoadLateClass(ReadViewLabel);
    CHHook1(ReadViewLabel, drawTextInRect);
}

