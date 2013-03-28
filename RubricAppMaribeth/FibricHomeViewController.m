//
//  FibricHomeViewController.m
//  RubricAppMaribeth
//
//  Created by Maribeth Rauh on 3/22/13.
//  Copyright (c) 2013 Maribeth Rauh. All rights reserved.
//

#import "FibricHomeViewController.h"

@interface FibricHomeViewController ()

@property (strong, nonatomic) NSMutableArray *students; // Holds student objects returned from create student view
@property (strong, nonatomic) NSMutableArray *rubrics;
@property (weak, nonatomic) IBOutlet UILabel *studentPropertyDisplay;

@end


@implementation FibricHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // set delegate and datasource for table views
    [self.studentsTableView setDelegate:self];
    [self.studentsTableView setDataSource:self];
    
    [self.rubricsTableView setDelegate:self];
    [self.rubricsTableView setDataSource:self];
    
    NSLog(@"%@,%@", self.studentsTableView.delegate, self.studentsTableView.dataSource);
    
    
    // Changes the navigation bar's back item label
    self.navigationItem.backBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                     style:UIBarButtonItemStyleBordered
                                    target:nil
                                    action:nil];
}

- (void) viewWillAppear:(BOOL)animated {
    [self.studentsTableView reloadData];
    [self.rubricsTableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"createStudentSegue"]) {
        FibricCreateStudentViewController * studentViewController = [segue destinationViewController];
        studentViewController.delegate = self;
    }
    [super prepareForSegue:segue sender:sender];
}


#pragma mark - Setters/Getters overridden

// **Must use synthesize if both setter and getter overridden

// Lazy instantiation
- (NSMutableArray *) students {
    if (!_students) {
        _students = [[NSMutableArray alloc] init];
    }
    
    return _students;
}

-(NSMutableArray *)rubrics {
    if (!_rubrics) {
        _rubrics = [[NSMutableArray alloc] init];
    }
    
    return _rubrics;
}


#pragma mark - Model Methods

- (void) addStudentToArray:(FibricStudent *)sender {
    //NSLog(@"Done button tapped!");
    [self.students addObject:sender];
    self.studentPropertyDisplay.text = ((FibricStudent *)[self.students objectAtIndex:0]).studentFirstName;
    
}

#pragma mark - Tableview DataSource and Delegate Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.studentsTableView) {
        return [self.students count];
    } else if (tableView == self.rubricsTableView) {
        return [self.rubrics count];
    } else {
        return 0;
    }
    
}


- (NSString *)titleForStudentRow:(NSUInteger)row
{
    NSString *lastFirst = ((FibricStudent *)self.students[row]).studentLastName;
    lastFirst = [lastFirst stringByAppendingString:@", "];
    lastFirst = [lastFirst stringByAppendingString:((FibricStudent *)self.students[row]).studentFirstName];
    NSLog(lastFirst);
    return lastFirst;
}

- (NSString *)titleForRubricRow:(NSUInteger)row
{
    NSString *rubricTitle = self.rubrics[row];
    
    return rubricTitle;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
 
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // configure cell
    if (tableView == self.studentsTableView) {
        cell.textLabel.text = [self titleForStudentRow:indexPath.row];
    } else if (tableView == self.rubricsTableView) {
        cell.textLabel.text = [self titleForRubricRow:indexPath.row];
    }
    
    return cell;
}


@end
