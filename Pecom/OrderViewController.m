//
//  OrderViewController.m
//  Pecom
//
//  Created by Alexey Tsymlov on 1/25/15.
//  Copyright (c) 2015 Alexey Tsymlov. All rights reserved.
//

#import "OrderViewController.h"

@interface OrderViewController () <UITableViewDataSource>

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.details.dataSource = self;
    self.details.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    switch (indexPath.row) {
        case 0:
            cell = [self.details dequeueReusableCellWithIdentifier:@"Code"];
            break;
        case 1:
            cell = [self.details dequeueReusableCellWithIdentifier:@"PreCode"];
            break;
        case 2:
            cell = [self.details dequeueReusableCellWithIdentifier:@"Status"];
            break;
        case 3:
            cell = [self.details dequeueReusableCellWithIdentifier:@"Driver"];
            break;
        case 4:
            cell = [self.details dequeueReusableCellWithIdentifier:@"Phone"];
            break;
        case 5:
            cell = [self.details dequeueReusableCellWithIdentifier:@"Car"];
            break;
        default:
            break;
    }
    
    //TODO:
    // Configure Cell
//    UILabel *label = (UILabel *)[cell.contentView viewWithTag:10];
//    [label setText:[NSString stringWithFormat:@"Row %i in Section %i", [indexPath row], [indexPath section]]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat result = 0.0;
    switch (indexPath.row) {
        case 0:
            result = 44;
            break;
        case 1:
            result = 44;
            break;
        case 2:
            result = 90;
            break;
        case 3:
            result = 44;
            break;
        case 4:
            result = 44;
            break;
        case 5:
            result = 44;
            break;
        default:
            break;
    }
    return result;
}

@end
