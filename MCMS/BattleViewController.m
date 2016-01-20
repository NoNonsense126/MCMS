//
//  BattleViewController.m
//  MCMS
//
//  Created by John McCants on 1/19/16.
//  Copyright © 2016 NoNonsense. All rights reserved.
//

#import "BattleViewController.h"

@interface BattleViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *challengerImageView;
@property (weak, nonatomic) IBOutlet UIImageView *opponentImageView;
@property (weak, nonatomic) IBOutlet UILabel *winnerLabel;

@end

@implementation BattleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.challengerImageView.image = [UIImage imageNamed:self.challenger.imageCreature];
    
    self.opponentImageView.image = [UIImage imageNamed:self.opponent.imageCreature];
    
    int winner = arc4random()%2;
    if (winner == 0) {
        self.winnerLabel.text = [NSString stringWithFormat:@"%@ destroyed the opponent", self.challenger.name];
    }else {
        
        self.winnerLabel.text = [NSString stringWithFormat:@"%@ blew up the challenger", self.opponent.name];
        
    }
    
    
    
}



@end
