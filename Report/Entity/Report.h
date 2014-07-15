//
//  Report.h
//  Report
//
//  Created by Lyndon Michael Bibera on 7/16/14.
//  Copyright (c) 2014 Secret Transaction Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ReportImage;

@interface Report : NSManagedObject

@property (nonatomic, retain) NSDate * dateCreated;
@property (nonatomic, retain) NSDate * dateLastEdited;
@property (nonatomic, retain) NSString * detail;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * remoteId;
@property (nonatomic, retain) NSOrderedSet *images;
@end

@interface Report (CoreDataGeneratedAccessors)

- (void)insertObject:(ReportImage *)value inImagesAtIndex:(NSUInteger)idx;
- (void)removeObjectFromImagesAtIndex:(NSUInteger)idx;
- (void)insertImages:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeImagesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInImagesAtIndex:(NSUInteger)idx withObject:(ReportImage *)value;
- (void)replaceImagesAtIndexes:(NSIndexSet *)indexes withImages:(NSArray *)values;
- (void)addImagesObject:(ReportImage *)value;
- (void)removeImagesObject:(ReportImage *)value;
- (void)addImages:(NSOrderedSet *)values;
- (void)removeImages:(NSOrderedSet *)values;
@end
