//
//  _ViewController.h
//  scanpay-ios-scan
//
//  Created by Kevin Bessiere on 6/6/13.
//
//

#import <UIKit/UIKit.h>
#import "ScanPayViewController.h"

@interface _ViewController : UIViewController <ScanPayDelegate>

- (IBAction)startScan:(id)sender;

@end
