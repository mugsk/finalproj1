//
//  TripEntriesTableViewController.m
//  finalproj1
//
//  Created by Mugdha Kanhere on 2/20/15.
//  Copyright (c) 2015 Mugdha Kanhere. All rights reserved.
//

#import "TripEntriesTableViewController.h"
#import "TripEntriesDetailViewController.h"

@interface TripEntriesTableViewController ()

@end

@implementation TripEntriesTableViewController
{

    NSArray *titles;
    NSArray *subtitles;
    NSArray *images;    
    NSArray *shareArray;
}

-(NSString *)docsDir{
    //Searches in the Document directories and gets the first result
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    listPath = [[self docsDir]stringByAppendingString:@"TripJournalDataSet.plist"];
    
    //If there is nothing at this path
    
    if(![[NSFileManager defaultManager]fileExistsAtPath:listPath]){
    
        [[NSFileManager defaultManager]copyItemAtPath:[[NSBundle mainBundle]pathForResource:@"TripJournalDataSet" ofType:@"plist"] toPath: listPath error:nil];
        
    }
    
    // There is a proerty list in the documents directory
    
    tripEntriesArray = [NSMutableArray arrayWithContentsOfFile:listPath];
    NSLog(@"Count: %lu",(unsigned long)[tripEntriesArray count]);
    NSLog(@"%@",listPath); 
    
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [self.tableView reloadData];
    tripEntriesArray = [NSMutableArray arrayWithContentsOfFile:listPath];
    NSLog(@"VIEW DID APPEAR######## %lu", [tripEntriesArray count]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.

    return [tripEntriesArray count];
    //    return [self.tripEntries count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if(cell==nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }


    NSLog(@"Element at 0 position : %@", [[tripEntriesArray objectAtIndex:indexPath.row] valueForKey:@"Title"]);
    cell.textLabel.text =[[tripEntriesArray objectAtIndex:indexPath.row] valueForKey:@"Title"];
    cell.detailTextLabel.text = [[tripEntriesArray objectAtIndex:indexPath.row] valueForKey:@"Notes"];
    cell.imageView.image = [UIImage imageNamed:[[tripEntriesArray objectAtIndex:indexPath.row]valueForKey:@"Image"]];

    return cell;
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
//     Get the new view controller using [segue destinationViewController].
//     Pass the selected object to the new view controller.
    
    if([[segue identifier] isEqualToString:@"detailviewIdentifier"]){
        TripEntriesDetailViewController *detail = [ segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
    
        long row = [myIndexPath row];
    
        detail.shareArray = @[tripEntriesArray[row]];
    
    }
}

@end
