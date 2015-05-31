//
//  TripEntriesDetailViewController.m
//  finalproj1
//
//  Created by Mugdha Kanhere on 2/20/15.
//  Copyright (c) 2015 Mugdha Kanhere. All rights reserved.
//

#import "TripEntriesDetailViewController.h"


@interface TripEntriesDetailViewController ()

@end

@implementation TripEntriesDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set the values passed from 'shareArray' in TableViewController to the text fields in the Detail View
    
    self.detailTitleLabel.text = [self.shareArray[0] valueForKey:@"Title"];
    self.detailPlacesLabel.text = [self.shareArray[0] valueForKey:@"Places"];
    self.detailDateLabel.text =  [self.shareArray[0] valueForKey:@"Date"];
    self.detailImageView.image  =[UIImage imageNamed: [self.shareArray[0] valueForKey:@"Image"]];
    self.detailTripNotesLabel.text = [self.shareArray[0] valueForKey:@"Notes"];
    self.detailTripMoodLabel.text = [self.shareArray[0] valueForKey:@"Mood"];
    
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

@end
