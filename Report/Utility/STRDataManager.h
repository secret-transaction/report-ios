//
//  STRDataManager.h
//  Report
//
//  Created by Lyndon Michael Bibera on 7/14/14.
//  Copyright (c) 2014 Secret Transaction Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

//use this stuff as a guide
@interface STRDataManager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (STRDataManager*)sharedInstance;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
