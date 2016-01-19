//
//  RootViewController.m
//  MCMS
//
//  Created by Wong You Jing on 19/01/2016.
//  Copyright © 2016 NoNonsense. All rights reserved.
//

#import "RootViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"

@interface RootViewController () <UITableViewDataSource, UITableViewDelegate>

@property NSMutableArray *creatures;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MagicalCreature *creature1 = [MagicalCreature new];
    creature1.name = @"Ralph";
    MagicalCreature *creature2 = [MagicalCreature new];
    creature2.name = @"Lauren";
    MagicalCreature *creature3 = [MagicalCreature new];
    creature3.name = @"Tommy";
    
    self.creatures = [NSMutableArray arrayWithObjects:creature1, creature2, creature3, nil];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

- (IBAction)addCreature:(UIBarButtonItem *)sender {
    NSString *name = self.textField.text;
    MagicalCreature *creature = [MagicalCreature new];
    creature.name = name;
    [self.creatures addObject:creature];
    self.textField.text = @"";
    [self.textField resignFirstResponder];
    [self.tableView reloadData];
    
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.creatures.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    MagicalCreature *creature = self.creatures[indexPath.row];
    
    cell.textLabel.text = creature.name;
    
    return cell;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    MagicalCreature *currentCreature = [self.creatures objectAtIndex:indexPath.row];
    CreatureViewController *creatureVC = segue.destinationViewController;
    creatureVC.title = [currentCreature name];
    creatureVC.creature = currentCreature;
}

@end
