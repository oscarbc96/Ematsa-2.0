//
//  TallsProgramatsDetallsViewController.h
//  Ematsa 2.0
//
//  Created by Oscar Blanco Castan on 10/04/14.
//  Copyright (c) 2014 Oscar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TallsProgramatsPaginaViewController.h"

@interface TallsProgramatsDetallsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *horaLabel;
@property (weak, nonatomic) IBOutlet UITextView *infoTextView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) Esdeveniment *esdeveniment;

@end
