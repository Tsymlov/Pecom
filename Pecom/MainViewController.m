//
//  ViewController.m
//  Pecom
//
//  Created by Alexey Tsymlov on 1/25/15.
//  Copyright (c) 2015 Alexey Tsymlov. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

static NSString* kFromMainToOrderViewSeguiID = @"fromMainToOrderView";
static NSString* kInvalidOrderFormatAlertTitle = @"Неверный формат";
static NSString* kInvalidOrderFormatAlertMessage = @"Проверьте номер заявки или код груза";
static NSString* kOkActionTitle = @"Ok";

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.orderNumber becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)checkButtonTapped:(id)sender {
    if (![self checkOrderNumberFormat]) {
        [self showInvalidOrderFormatAlert];
    }
    [self performSegueWithIdentifier:kFromMainToOrderViewSeguiID sender:self];
}

//TODO:
- (BOOL) checkOrderNumberFormat {
    if ([self.orderNumber.text isEqualToString:@"123456"]) {
        return true;
    }
    return false;
}

- (void) showInvalidOrderFormatAlert{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:kInvalidOrderFormatAlertTitle message:kInvalidOrderFormatAlertMessage preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:kOkActionTitle style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];

}
@end
