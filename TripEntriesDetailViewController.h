//
//  TripEntriesDetailViewController.h
//  finalproj1
//
//  Created by Mugdha Kanhere on 2/20/15.
//  Copyright (c) 2015 Mugdha Kanhere. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TripEntriesDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *detailImageView;

@property (weak, nonatomic) IBOutlet UILabel *detailTitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *detailDateLabel;

@property (weak, nonatomic) IBOutlet UILabel *detailPlacesLabel;

@property(strong,nonatomic) NSArray *shareArray;
@property (weak, nonatomic) IBOutlet UITextView *detailTripNotesLabel;

@property (weak, nonatomic) IBOutlet UILabel *detailTripMoodLabel;

@end
