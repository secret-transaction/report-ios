//
//  STRViewController.m
//  Report
//
//  Created by Lyndon Michael Bibera on 7/4/14.
//  Copyright (c) 2014 Secret Transaction Inc. All rights reserved.
//

#import "STRViewController.h"
#import "GTLStatus.h"

@interface STRViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *clientIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UILabel *latestVersionLabel;

@end

@implementation STRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (IBAction)statusCheck
{
    GTLServiceStatus *statusService = [GTLServiceStatus new];
    
    GTLQueryStatus *query = [GTLQueryStatus queryForStatusAPIGetStatusWithClientId:@"iOS V1"];
    
    void (^handler)(GTLServiceTicket *ticket, id object, NSError *error) = ^(GTLServiceTicket *ticket, GTLStatusStatus *status, NSError *error) {
   
        self.titleLabel.text = [NSString stringWithFormat:@"Title: %@", status.title];
        self.clientIdLabel.text = [NSString stringWithFormat:@"Client ID: %@", status.clientId];
        self.messageLabel.text = [NSString stringWithFormat:@"Message: %@", status.message];
        self.latestVersionLabel.text = [NSString stringWithFormat:@"Latest Version: %@", status.latestVersion];
        
    };
    
    [statusService executeQuery:query completionHandler:handler];
}

@end
