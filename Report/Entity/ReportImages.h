//
//  ReportImages.h
//  Report
//
//  Created by Lyndon Michael Bibera on 7/10/14.
//  Copyright (c) 2014 Secret Transaction Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Report;

@interface ReportImages : NSManagedObject

@property (nonatomic, retain) NSString * localUrl;
@property (nonatomic, retain) NSNumber * uploaded;
@property (nonatomic, retain) NSString * uploadUrl;
@property (nonatomic, retain) NSString * remotUrl;
@property (nonatomic, retain) Report *report;

@end
