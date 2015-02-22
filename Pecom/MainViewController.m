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
        return;
    }
    NSData* orderDetails = [self getOrderDetails];
    [self performSegueWithIdentifier:kFromMainToOrderViewSeguiID sender:self];
}

//TODO:
- (BOOL) checkOrderNumberFormat {
//    if ([self.orderNumber.text isEqualToString:@"123456"]) {
//        return true;
//    }
//    return false;
    return true;
}

//IvanDrago 123456 88E26912C92CA8D3F6DDBF89E9AC2CA3B86A343F SXZhbkRyYWdvOjg4RTI2OTEyQzkyQ0E4RDNGNkREQkY4OUU5QUMyQ0EzQjg2QTM0M0Y=
- (id)getOrderDetails{
    NSString* urlAsString = @"https://kabinet.pecom.ru/api/v1/cargos/basicstatus/";
    NSURL* url = [NSURL URLWithString:urlAsString];
    NSDictionary* requestDictionary = @{@"cargoCodes": @[self.orderNumber.text]};
    NSError *error = nil;
    NSData* jsonObject = [NSJSONSerialization dataWithJSONObject:requestDictionary options:NSJSONWritingPrettyPrinted error:&error];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    [request setTimeoutInterval:30.0f];
    [request setHTTPMethod:@"POST"];
    [request addValue:@"application/json;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request addValue:@"Basic SXZhbkRyYWdvOjg4RTI2OTEyQzkyQ0E4RDNGNkREQkY4OUU5QUMyQ0EzQjg2QTM0M0Y=" forHTTPHeaderField:@"Authorization"];
    [request setHTTPBody:jsonObject];
    NSURLResponse* response = nil;
    
    NSData* recievedData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    id recievedJsonObject = [NSJSONSerialization JSONObjectWithData:recievedData options:NSJSONReadingAllowFragments error:&error];
    NSDictionary *deserializedDic = (NSDictionary*)recievedJsonObject;
    NSLog(@"%@", deserializedDic);
    return recievedData;
}

- (void) showInvalidOrderFormatAlert{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:kInvalidOrderFormatAlertTitle message:kInvalidOrderFormatAlertMessage preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:kOkActionTitle style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];

}
@end
