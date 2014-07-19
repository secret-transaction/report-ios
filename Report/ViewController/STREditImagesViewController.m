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
@property (weak, nonatomic) IBOutlet UIImageView *primaryImage;

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
            
            //TODO: try to load from local first
            [STRAsyncImageDownloader loadFromURL:img.remotUrl toImageView:imgView];
        }
        
        if (self.report.primaryImage) {
            [STRAsyncImageDownloader loadFromURL:self.report.primaryImage.remotUrl toImageView:self.primaryImage];
        }
    }
}

- (IBAction)tapPhoto:(UITapGestureRecognizer *)sender
{
    UIView *image = sender.view;
    NSLog(@"Start Camera for: %lu", (unsigned long)[self.imageThumnails indexOfObject:image]);

    UIImagePickerController *picker = [UIImagePickerController new];
    picker.delegate = self;
    picker.allowsEditing = YES;
    //not available on emulator
    //picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString *segueId = segue.identifier;
    NSLog(@"Segue:%@", segueId);
}

@end
