//
//  TallsProgramatsViewController.m
//  Ematsa 2.0
//
//  Created by Oscar Blanco Castan on 10/04/14.
//  Copyright (c) 2014 Oscar. All rights reserved.
//

#import "TallsProgramatsViewController.h"
#import "TallsProgramatsDetallsViewController.h"
#import "TallsProgramatsPaginaViewController.h"

@interface TallsProgramatsViewController ()

@end

@implementation TallsProgramatsViewController

- (id)initWithCoder:(NSCoder *)aCoder
{
    self = [super initWithCoder:aCoder];
    if (self) {
        // Custom the table
        
        // The className to query on
        self.parseClassName = @"TallsProgramats";
        
        // The key of the PFObject to display in the label of the default cell style
        self.textKey = @"name";
        
        // Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = YES;
        
        // Whether the built-in pagination is enabled
        self.paginationEnabled = NO;
        
        // The number of objects to show per page
        self.objectsPerPage = 10;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (PFQuery *)queryForTable
{
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    
    // If no objects are loaded in memory, we look to the cache first to fill the table
    // and then subsequently do a query against the network.
    if ([self.objects count] == 0) {
        query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    }
    
    //[query orderByAscending:@"hora"];
    
    return query;
}

// Override to customize the look of a cell representing an object. The default is to display
// a UITableViewCellStyleDefault style cell with the label being the first key in the object.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object
{
    static NSString *simpleTableIdentifier = @"Cela";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [object objectForKey:@"name"];
    cell.detailTextLabel.text = [object objectForKey:@"hora"];
    
    return cell;
}

- (void) objectsDidLoad:(NSError *)error
{
    [super objectsDidLoad:error];
    
    NSLog(@"error: %@", [error localizedDescription]);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"mostraEsdeveniment"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        TallsProgramatsDetallsViewController *destViewController = segue.destinationViewController;
        
        PFObject *object = [self.objects objectAtIndex:indexPath.row];
        Esdeveniment *esdeveniment = [[Esdeveniment alloc] init];
        esdeveniment.name = [object objectForKey:@"name"];
        esdeveniment.hora = object[@"hora"];
        esdeveniment.text = [object objectForKey:@"text"];
        destViewController.esdeveniment = esdeveniment;
        
    }
}

@end
