//
//  ICEModel.h
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/15.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICEModel : NSObject<YYModel>

+ (instancetype)modelWithJSON:(id)json;
- (BOOL)modelSetWithJSON:(id)json;

+ (NSArray *)modelArrayWithJSON:(id)json;
+ (NSDictionary *)modelDictionaryWithJSON:(id)json;

- (id)modelToJSONObject;
- (NSData *)modelToJSONData;
- (NSString *)modelToJSONString;

@end
