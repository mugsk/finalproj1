//
//  NewTripEntryViewController.m
//  finalproj1
//
//  Created by Mugdha Kanhere on 2/21/15.
//  Copyright (c) 2015 Mugdha Kanhere. All rights reserved.
//

#import "NewTripEntryViewController.h"

@interface NewTripEntryViewController ()

@end

@implementation NewTripEntryViewController

-(NSString *)docsDir{
    //Searches in the Document directories and gets the first result
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Load the property list file containing the trip journal entries
    listPath = [[self docsDir]stringByAppendingString:@"TripJournalDataSet.plist"];
    //If there is nothing at this path already then copy the file
    if(![[NSFileManager defaultManager]fileExistsAtPath:listPath]){
        
        [[NSFileManager defaultManager]copyItemAtPath:[[NSBundle mainBundle]pathForResource:@"TripJournalDataSet" ofType:@"plist"] toPath: listPath error:nil];
    }
    
    // There is a property list in the documents directory
    
    tripEntriesArray = [NSMutableArray arrayWithContentsOfFile:listPath];
    NSLog(@"Count: %lu",(unsigned long)[tripEntriesArray count]);
    
    //Clear all the text fields for new entry
    self.tripTitle.text = @"";
    self.tripPlaces.text= @"";
    self.tripNotes.text = @"";
    // Get today date
    NSDate *now =[NSDate date];
    
    // Assign date picker object to today's date
    [self.tripDate setDate:now animated:YES];
    
    
    
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

- (IBAction)writeTripEntryToFile:(id)sender {
  
    // Store selected date from date picker into object
 
    NSDate *today = [self.tripDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init] ;
    [dateFormat setDateFormat:@"EEE dd MMM yyyy"];
    NSString *dateString = [dateFormat stringFromDate:today];
    
   
    //Create a dictionary with akk the fields entered by the user
    NSDictionary *item = [[NSDictionary alloc]  initWithObjectsAndKeys:
                          [NSString stringWithString:self.tripTitle.text],@"Title",
                          [NSString stringWithString:self.tripPlaces.text],@"Places",
                          [NSString stringWithString:self.tripNotes.text],@"Notes",
                          [NSString stringWithFormat:@"travel3.png"], @"Image",
                          [NSString stringWithString:dateString], @"Date",
                          [NSString stringWithString:self.moodValue.text],@"Mood",
                          nil];

    // Add the dictionary to the trie entries array in the file
    [tripEntriesArray addObject:item];
    NSLog(@"The path of the file is%@", listPath);
    if( [tripEntriesArray writeToFile:listPath atomically:YES]){
        NSLog(@"Count of entries after adding a new one: %lu",(unsigned long)[tripEntriesArray count]);
    }else{
        NSLog(@"couldn't write to new plist");

    }
    
}
- (IBAction)moodSliderSetter:(id)sender {
    
     // Assign stepper value to mood value label and an image in ViewController's view
    if(self.moodSlider.value >= 1 && self.moodSlider.value <=2)
    {
        self.moodValue.text = @"Sad";
        self.moodImage.image = [UIImage imageNamed:@"Sad.png"];
    }else if (self.moodSlider.value >= 2 && self.moodSlider.value <=3)
    {
        self.moodValue.text = @"Happy";
        self.moodImage.image = [UIImage imageNamed:@"Happy.png"];
    }else if (self.moodSlider.value >= 3 && self.moodSlider.value <=4)
    {   self.moodValue.text = @"Enjoying";
        self.moodImage.image = [UIImage imageNamed:@"Enjoying.png"];
    } else if (self.moodSlider.value >= 4 && self.moodSlider.value <=5)

    {   self.moodValue.text = @"Excited";
        self.moodImage.image = [UIImage imageNamed:@"Excited.png"];
    }

}
@end
