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

//lame way of tracking which image was tapped
@property (weak, nonatomic) UIImageView *tappedView;

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
    self.tappedView =  (UIImageView *)image;

    UIImagePickerController *picker = [UIImagePickerController new];
    picker.delegate = self;
    picker.allowsEditing = YES;
    
    //finally got to make this work on device
    //borrowed some company dev profile
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    //use this when picking through photo lib
    //picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"Picked Image");
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    
    if (self.tappedView) {
        self.tappedView.image = chosenImage;
    }
    self.tappedView = nil;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString *segueId = segue.identifier;
    NSLog(@"Segue:%@", segueId);
}

@end
