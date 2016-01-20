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
#import "BattleViewController.h"

@interface RootViewController () <UITableViewDataSource, UITableViewDelegate>

@property NSMutableArray *creatures;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
                //Charmander//
    
    MagicalCreature *creature1 = [MagicalCreature new];
    creature1.name = @"Ralph";
    creature1.detail = @"Tall and destructive";
    creature1.imageCreature = @"Charmander.png";
    creature1.accessories = [NSMutableArray arrayWithObjects:@"Fire", @"Tail", nil];
    
                //Squirtle//
    
    MagicalCreature *creature2 = [MagicalCreature new];
    creature2.name = @"Lauren";
    creature2.detail = @"Big and greedy";
    creature2.accessories = [NSMutableArray arrayWithObjects:@"Shell", @"Water", nil];
    creature2.imageCreature = @"Squirtle.jpeg";
    
                //Pikachu//
    
    MagicalCreature *creature3 = [MagicalCreature new];
    creature3.name = @"Tommy";
    creature3.detail = @"Little and kind";
    creature3.imageCreature = @"Pikachu.jpeg";
    creature3.accessories = [NSMutableArray arrayWithObjects:@"Agility", @"Thunder", nil];
    
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
    cell.detailTextLabel.text = creature.detail;
    
    return cell;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
  
    
    if ([segue.identifier isEqualToString:@"ShowCreatureSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        MagicalCreature *currentCreature = [self.creatures objectAtIndex:indexPath.row];
        CreatureViewController *creatureVC = segue.destinationViewController;
        creatureVC.title = [currentCreature name];
        creatureVC.creature = currentCreature;
    } else
    
    {
        
        BattleViewController *battleVC = segue.destinationViewController;
        battleVC.challenger = [self.creatures objectAtIndex:arc4random()%self.creatures.count];
        NSMutableArray *remaining = [[NSMutableArray alloc]initWithArray:self.creatures];
        [remaining removeObject:battleVC.challenger];
        battleVC.opponent = [remaining objectAtIndex:arc4random()%remaining.count];
        
    
    }
}

@end
