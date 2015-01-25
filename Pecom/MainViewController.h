//
//  ViewController.h
//  Pecom
//
//  Created by Alexey Tsymlov on 1/25/15.
//  Copyright (c) 2015 Alexey Tsymlov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *orderNumber;

- (IBAction)checkButtonTapped:(id)sender;

@end

