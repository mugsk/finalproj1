//
//  NewTripEntryViewController.h
//  finalproj1
//
//  Created by Mugdha Kanhere on 2/21/15.
//  Copyright (c) 2015 Mugdha Kanhere. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewTripEntryViewController : UIViewController
{
    //Path in the documents directory
    NSString *listPath;
    NSMutableArray *tripEntriesArray;
}

// Button to write the entry to the property list file

@property (weak, nonatomic) IBOutlet UIButton *writeTripEntryToFile;
- (IBAction)writeTripEntryToFile:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *tripTitle;

@property (weak, nonatomic) IBOutlet UITextField *tripPlaces;

@property (weak, nonatomic) IBOutlet UIDatePicker *tripDate;
@property (weak, nonatomic) IBOutlet UITextView *tripNotes;
@property (weak, nonatomic) IBOutlet UISlider *moodSlider;


@property (weak, nonatomic) IBOutlet UILabel *moodValue;
- (IBAction)moodSliderSetter:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *moodImage;

@end
