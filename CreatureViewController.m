//
//  CreatureViewController.m
//  MCMS
//
//  Created by Wong You Jing on 19/01/2016.
//  Copyright © 2016 NoNonsense. All rights reserved.
//

#import "CreatureViewController.h"
#import "MagicalCreature.h"

@interface CreatureViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.detailLabel.text = self.creature.detail;
    self.imageView.image = [UIImage imageNamed:self.creature.imageCreature];
}

- (IBAction)onEditButtonTapped:(UIBarButtonItem *)sender {
   
    
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Edit" message:@"Rename Creature" preferredStyle:UIAlertControllerStyleAlert];
    
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"New name";
    }];
    
    UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"Rename" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *name = controller.textFields[0].text;
        self.creature.name = name;
        self.navigationItem.title = name;
        
    }];
    
    [controller addAction:saveAction];
    
    [self presentViewController:controller animated:YES completion:nil];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Accessory" ];
    
    cell.textLabel.text = self.creature.accessories[indexPath.row];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    return self.creature.accessories.count;
}


@end
