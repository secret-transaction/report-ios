//
//  Report+Description.m
//  Report
//
//  Created by Lyndon Michael Bibera on 7/16/14.
//  Copyright (c) 2014 Secret Transaction Inc. All rights reserved.
//

#import "Report+Description.h"

@implementation Report (Description)

- (NSString *)display
{
    return [NSString stringWithFormat:@"Title:%@, Details:%@", self.title, self.detail];
}

@end
