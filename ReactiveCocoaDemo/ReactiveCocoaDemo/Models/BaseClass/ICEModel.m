//
//  ICEModel.m
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/15.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "ICEModel.h"

@implementation ICEModel

+ (instancetype)modelWithJSON:(id)json {
    return [self yy_modelWithJSON:json];
}

- (BOOL)modelSetWithJSON:(id)json {
    return [self yy_modelSetWithJSON:json];
}

+ (NSArray *)modelArrayWithJSON:(id)json {
    return [NSArray yy_modelArrayWithClass:[self class] json:json];
}

+ (NSDictionary *)modelDictionaryWithJSON:(id)json {
    return [NSDictionary yy_modelDictionaryWithClass:[self class] json:json];
}

- (id)modelToJSONObject {
    return [self yy_modelToJSONObject];
}

- (NSData *)modelToJSONData {
    return [self yy_modelToJSONData];
}

- (NSString *)modelToJSONString {
    return [self yy_modelToJSONString];
}

#pragma mark -

- (void)encodeWithCoder:(NSCoder *)aCoder {
    return [self yy_modelEncodeWithCoder:aCoder];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    return [self yy_modelInitWithCoder:aDecoder];
}

- (id)copyWithZone:(NSZone *)zone {
    return [self yy_modelCopy];
}

- (NSUInteger)hash {
    return [self yy_modelHash];
}

- (BOOL)isEqual:(id)object {
    return [self yy_modelIsEqual:object];
}

#pragma mark -

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {

}

- (NSString *)description {
    return [self yy_modelDescription];
}

@end
