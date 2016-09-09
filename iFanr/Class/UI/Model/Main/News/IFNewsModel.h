//
//  IFNewsModel.h
//  iFanr
//
//  Created by LXJ on 16/9/5.
//  Copyright © 2016年 LianLuo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IFNewsModel : NSObject

@property (nonatomic, copy, nullable) NSString *ID;
@property (nonatomic, copy, nullable) NSString *author;
@property (nonatomic, copy, nullable) NSString *category;
@property (nonatomic, copy, nullable) NSString *category_link;
@property (nonatomic, copy, nullable) NSString *comments;
@property (nonatomic, copy, nullable) NSString *content;
@property (nonatomic, copy, nullable) NSString *excerpt;
@property (nonatomic, copy, nullable) NSString *image;
@property (nonatomic, copy, nullable) NSString *introduce;
@property (nonatomic, copy, nullable) NSString *is_ad;
@property (nonatomic, copy, nullable) NSString *like;
@property (nonatomic, copy, nullable) NSString *link;
@property (nonatomic, copy, nullable) NSString *post_modified;
@property (nonatomic, copy, nullable) NSString *post_timestamp;
@property (nonatomic, copy, nullable) NSString *post_type;
@property (nonatomic, copy, nullable) NSString *pubDate;
@property (nonatomic, copy, nullable) NSString *tags;
@property (nonatomic, copy, nullable) NSString *title;

@property (nonatomic, assign) CGFloat titleLabelHeight;

+ (NSArray *)modelWithNewsRequest:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END

