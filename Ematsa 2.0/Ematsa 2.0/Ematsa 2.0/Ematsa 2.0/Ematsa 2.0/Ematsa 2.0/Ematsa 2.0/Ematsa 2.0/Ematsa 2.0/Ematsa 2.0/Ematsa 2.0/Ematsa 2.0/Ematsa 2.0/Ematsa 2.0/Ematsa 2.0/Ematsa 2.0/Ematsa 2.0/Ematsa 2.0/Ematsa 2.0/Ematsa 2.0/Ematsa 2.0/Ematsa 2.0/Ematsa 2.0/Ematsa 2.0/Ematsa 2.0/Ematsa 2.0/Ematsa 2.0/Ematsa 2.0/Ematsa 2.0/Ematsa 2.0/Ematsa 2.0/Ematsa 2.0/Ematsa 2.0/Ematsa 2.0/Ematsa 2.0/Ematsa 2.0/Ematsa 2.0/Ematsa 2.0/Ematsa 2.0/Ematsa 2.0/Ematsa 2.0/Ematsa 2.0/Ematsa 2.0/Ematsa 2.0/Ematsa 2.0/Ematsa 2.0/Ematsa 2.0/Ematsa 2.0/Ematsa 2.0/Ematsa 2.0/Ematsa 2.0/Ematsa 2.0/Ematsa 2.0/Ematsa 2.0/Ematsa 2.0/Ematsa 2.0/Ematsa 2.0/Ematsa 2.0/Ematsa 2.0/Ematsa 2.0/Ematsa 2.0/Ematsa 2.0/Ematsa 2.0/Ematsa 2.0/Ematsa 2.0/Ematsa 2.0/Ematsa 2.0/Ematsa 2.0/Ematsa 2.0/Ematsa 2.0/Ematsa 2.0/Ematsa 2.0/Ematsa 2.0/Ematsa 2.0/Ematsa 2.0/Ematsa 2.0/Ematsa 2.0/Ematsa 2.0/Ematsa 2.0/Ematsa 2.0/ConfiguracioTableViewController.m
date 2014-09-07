//
//  ConfiguracioTableViewController.m
//  Ematsa 2.0
//
//  Created by Oscar Blanco Castan on 22/03/14.
//  Copyright (c) 2014 Oscar. All rights reserved.
//

#import "ConfiguracioTableViewController.h"
#import "CTFeedbackViewController.h"
#import "SVWebViewController.h"

@interface ConfiguracioTableViewController ()

@end

@implementation ConfiguracioTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)twitter:(id)sender {
    
    SVModalWebViewController *webViewController = [[SVModalWebViewController alloc] initWithAddress:@"http://twitter.com/ematsa"];
    [self presentViewController:webViewController animated:YES completion:NULL];
    
}

- (IBAction)ematsa:(id)sender {

    SVModalWebViewController *webViewController = [[SVModalWebViewController alloc] initWithAddress:@"http://www.ematsa.cat"];
   [self presentViewController:webViewController animated:YES completion:NULL];
    
}

- (IBAction)feedback:(id)sender {
    
    CTFeedbackViewController *feedbackViewController = [CTFeedbackViewController controllerWithTopics:CTFeedbackViewController.defaultTopics localizedTopics:CTFeedbackViewController.defaultLocalizedTopics];
    feedbackViewController.toRecipients = @[@"info.ematsa@ematsa.cat"];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:feedbackViewController];
    [self.navigationController presentModalViewController:navigationController animated:YES];
    

    
}

- (IBAction)oscar:(id)sender {
    
    //SVModalWebViewController *webViewController = [[SVModalWebViewController alloc] initWithAddress:@""];
    //[self presentViewController:webViewController animated:YES completion:NULL];
    
}

@end
