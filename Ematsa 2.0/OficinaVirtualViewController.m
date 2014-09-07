//
//  OficinaVirtualViewController.m
//  Ematsa 2.0
//
//  Created by Oscar Blanco Castan on 23/03/14.
//  Copyright (c) 2014 Oscar. All rights reserved.
//

#import "OficinaVirtualViewController.h"
#import "SVProgressHUD.h"

@interface OficinaVirtualViewController ()

@end

@implementation OficinaVirtualViewController

@synthesize webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSURL *url = [NSURL URLWithString:@"https://ematsa-aguasonline.agbar.net"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
    
    webView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    [SVProgressHUD showWithStatus:@"Carregant..."];
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [SVProgressHUD dismiss];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [SVProgressHUD dismiss];
    
}

@end
