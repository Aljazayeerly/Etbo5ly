//
//  URLS.m
//  Etbo5ly
//
//  Created by Sana Elshazly on 5/21/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
NSString *urlPath;
@interface URLS : NSObject

+(NSString *)login;
+(NSString *)allMeals : (int) pagenum;
+(NSString *)allCooks;
+(NSString *)profile;
+(NSString *)registeration;
+(NSString *)regionBasedCooks;
+(NSString *)locationBasedCooks;

@end
