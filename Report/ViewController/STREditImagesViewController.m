//
//  STREditImagesViewController.m
//  Report
//
//  Created by Lyndon Michael Bibera on 7/10/14.
//  Copyright (c) 2014 Secret Transaction Inc. All rights reserved.
//

#import "STREditImagesViewController.h"
#import "STRAsyncImageDownloader.h"

@interface STREditImagesViewController ()

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imageThumnails;

@end

@implementation STREditImagesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
}

- (void)configureView
{
    NSLog(@"Count:%lu", (unsigned long)self.imageThumnails.count);
    if (self.report) {
        for (ReportImage *img in self.report.images) {
            UIImageView *imgView = self.imageThumnails[[self.report.images indexOfObject:img]];
            
            NSString *i = @"https://fbcdn-sphotos-f-a.akamaihd.net/hphotos-ak-xap1/t1.0-9/15373_4237805801220_7354239875186379846_n.jpg";
            
            [STRAsyncImageDownloader loadFromURL:i toImageView:imgView];
        }
    }
}

- (IBAction)tapPhoto:(UITapGestureRecognizer *)sender
{
    UIView *image = sender.view;
    NSLog(@"Start Camera for: %lu", (unsigned long)[self.imageThumnails indexOfObject:image]);
    [image setHidden:YES];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString *segueId = segue.identifier;
    NSLog(@"Segue:%@", segueId);
}

@end
