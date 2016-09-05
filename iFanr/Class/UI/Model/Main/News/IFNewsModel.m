//
//  IFNewsModel.m
//  iFanr
//
//  Created by LXJ on 16/9/5.
//  Copyright © 2016年 LianLuo. All rights reserved.
//

#import "IFNewsModel.h"
#import "YYModel.h"

@implementation IFNewsModel

+ (NSArray *)modelWithNewsRequest:(NSDictionary *)dic {
    NSArray *dataList = dic[@"data"];
    
    if ([dataList isKindOfClass:[NSArray class]]) {
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:dataList.count];
        
        for (int i = 0; i < dataList.count; i++) {
            NSDictionary *tempDic = dataList[i];
            IFNewsModel *model = [IFNewsModel yy_modelWithJSON:tempDic];
            [array addObject:model];
        }
        return  array;
    }
    
    return @[];
}

@end
