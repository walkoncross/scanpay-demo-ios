//
//  _ViewController.m
//  scanpay-ios-scan
//
//  Created by Kevin Bessiere on 6/6/13.
//
//

#import "_ViewController.h"

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
    ScanPayViewController *scan = [[ScanPayViewController alloc]initWithDelegate:self appToken:@"PUT_YOUR_TOKEN_HERE"];
    [self presentViewController:scan animated:YES completion:nil];
}

- (void)scanPayViewController:(ScanPayViewController *)scanPayViewController didScanCard:(SPCreditCard *)card
{
    NSLog(@"%@", card.number);
}

- (void)scanCancelledByUser:(ScanPayViewController *)scanPayViewController
{
}

- (void)scanPayViewController:(ScanPayViewController *)scanPayViewController failedToScanWithError:(NSError *)error
{
}

- (BOOL)scanPayViewControllerShouldShowConfirmationView:(ScanPayViewController *)scanPayViewController
{
    return YES;
}

- (BOOL)scanPayViewControllerShouldShowManualEntryButton:(ScanPayViewController *)scanPayViewController
{
    return NO;
}

@end
