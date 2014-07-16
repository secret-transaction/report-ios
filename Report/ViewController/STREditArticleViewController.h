//
//  STREditArticleViewController.h
//  Report
//
//  Created by Lyndon Michael Bibera on 7/10/14.
//  Copyright (c) 2014 Secret Transaction Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Report.h"

@interface STREditArticleViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *editTitle;
@property (weak, nonatomic) IBOutlet UITextView *editDetails;
@property (strong, nonatomic) Report *report;

@end
