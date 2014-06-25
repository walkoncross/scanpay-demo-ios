//
//  _ViewController.m
//  scanpay-ios-scan
//
//  Created by Kevin Bessiere on 6/6/13.
//
//

#import "_ViewController.h"
#import "ScanPayViewController.h"

@interface _ViewController ()

@end

@implementation _ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startScan:(id)sender
{
    ScanPayViewController * scanPayViewController = [[ScanPayViewController alloc] initWithToken:@"ENTER_YOUR_TOKEN_HERE" useConfirmationView:YES useManualEntry:YES];

    // If you want to use your own color for set sight
    [scanPayViewController setSightColor:[UIColor colorWithRed:97 / 255.f green:170 / 255.f blue:219 / 255.f alpha:1.0]];
    
    [scanPayViewController startScannerWithViewController:self success:^(SPCreditCard * card){
        
        // You will be notified of the user interaction through this block
        NSLog(@"%@ Expire %@/%@ CVC: %@", card.number, card.month, card.year, card.cvc);
    } cancel:^{

        // You will be notified when the user has canceled through this block
        NSLog(@"User cancel");
    }];
}


@end
