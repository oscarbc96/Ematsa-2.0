//
//  OficinaVirtualViewController.h
//  Ematsa 2.0
//
//  Created by Oscar Blanco Castan on 23/03/14.
//  Copyright (c) 2014 Oscar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OficinaVirtualViewController : UIViewController<UIWebViewDelegate>

@property (nonatomic, strong) IBOutlet UIWebView *webView;

@end
