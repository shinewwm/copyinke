//
//  WMShowTableViewCell.m
//  copyYinke
//
//  Created by 王网明 on 2018/2/27.
//  Copyright © 2018年 王网明. All rights reserved.
//

#import "WMShowTableViewCell.h"

@interface WMShowTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *onlineLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bigHeadImage;

@end


@implementation WMShowTableViewCell

- (void)setModel:(WMShowModel *)model{
    _model = model;
    [self.headImage downloadImage:model.portrait placeholder:@"default_room"];
    if (!model.portrait320) {
        [self.bigHeadImage downloadImage:model.portrait placeholder:@"default_room"];
    }else{
        [self.bigHeadImage downloadImage:model.portrait320 placeholder:@"default_room"];
    }
    self.nameLabel.text = model.nick;
    self.locationLabel.text = model.city;
    self.onlineLabel.text = [@(model.radioFanNumber) stringValue];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.headImage.layer.cornerRadius = 25;
    self.headImage.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
