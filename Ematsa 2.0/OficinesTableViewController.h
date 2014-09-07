//
//  OficinesTableViewController.h
//  Ematsa 2.0
//
//  Created by Oscar Blanco Castan on 23/03/14.
//  Copyright (c) 2014 Oscar. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <MessageUI/MessageUI.h>
#import <UIKit/UIKit.h>

@interface OficinesTableViewController : UITableViewController <MFMailComposeViewControllerDelegate, MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end
