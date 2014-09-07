//
//  OficinesTableViewController.m
//  Ematsa 2.0
//
//  Created by Oscar Blanco Castan on 23/03/14.
//  Copyright (c) 2014 Oscar. All rights reserved.
//

#import "OficinesTableViewController.h"
#define METERS_PER_MILE 1609.344

@interface OficinesTableViewController ()

@end

@implementation OficinesTableViewController

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
    
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 41.13194444444444;
    zoomLocation.longitude= 1.2513888888888889;
    
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.1*METERS_PER_MILE, 0.1*METERS_PER_MILE);
    
    // 3
    [_mapView setRegion:viewRegion animated:YES];
    
    CLLocationCoordinate2D annotationCoord;
    
    annotationCoord.latitude = 41.13194444444444;
    annotationCoord.longitude = 1.2513888888888889;
    
    MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
    annotationPoint.coordinate = annotationCoord;
    annotationPoint.title = @"Oficines";
    [_mapView addAnnotation:annotationPoint];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)mapes:(id)sender {
    
    UIApplication *ourApplication = [UIApplication sharedApplication];
    NSString *ourPath = [@"http://maps.apple.com/?q=41.13194444444444,1.2513888888888889" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *ourURL = [NSURL URLWithString:ourPath];
    [ourApplication openURL:ourURL];
    
}
- (IBAction)googlemaps:(id)sender {
    
    UIApplication *ourApplication = [UIApplication sharedApplication];
    NSString *ourPath = [@"comgooglemaps://?daddr=41.13194444444444,1.2513888888888889&directionsmode=walking"stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *ourURL = [NSURL URLWithString:ourPath];
    [ourApplication openURL:ourURL];
    
}

- (IBAction)setMapType:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.mapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            self.mapView.mapType = MKMapTypeSatellite;
            break;
        case 2:
            self.mapView.mapType = MKMapTypeHybrid;
            break;
        default:
            break;
    }
}

- (IBAction)telefon:(id)sender {
    
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:900550555"]];
    
}

- (IBAction)telefon2:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:900203329"]];
    
}

-(IBAction)email:(id)sender {
    // Email Subject
    NSString *emailTitle = @"Email";
    // Email Content
    NSString *messageBody = @"";
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"info.ematsa@ematsa.cat"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self.navigationController presentModalViewController:mc animated:YES];
    
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}
@end
