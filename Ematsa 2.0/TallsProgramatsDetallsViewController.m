//
//  TallsProgramatsDetallsViewController.m
//  Ematsa 2.0
//
//  Created by Oscar Blanco Castan on 10/04/14.
//  Copyright (c) 2014 Oscar. All rights reserved.
//

#import "TallsProgramatsDetallsViewController.h"

@interface TallsProgramatsDetallsViewController ()

@end

@implementation TallsProgramatsDetallsViewController

@synthesize horaLabel;
@synthesize infoTextView;
@synthesize esdeveniment;
@synthesize nameLabel;

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
    
    self.title = esdeveniment.name;
    self.horaLabel.text = esdeveniment.hora;
    self.nameLabel.text = esdeveniment.name;
    self.infoTextView.text = esdeveniment.text;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
}

- (void)viewDidUnload
{
    [self setHoraLabel:nil];
    [self setInfoTextView:nil];
    [self setNameLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
@end
