//
//  DFTableViewCell.m
//  CopyLabel
//
//  Created by mac on 16/6/1.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "DFTableViewCell.h"
#import "DFCopyLabel.h"
@implementation DFTableViewCell
{
//    DFCopyLabel *codeLabel;
//    DFCopyLabel *timeLabel;
    UILabel *codeLabel;
    UILabel *timeLabel;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self makeUI];
    }
    
    return self;
}

-(void)makeUI
{
    codeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, self.frame.size.width/2, 30)];
//    codeLabel.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:codeLabel];
    
    timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2+10, 10, self.frame.size.width/2, 30)];
//    timeLabel.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:timeLabel];
}

-(void)configDate:(NSString*)string
{
    codeLabel.text = string;
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
//    if (highlighted) {
//        self.backgroundColor = [UIColor lightGrayColor];
//    }else{
//        self.backgroundColor = [UIColor whiteColor];
//    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//    if (selected) {
//        self.backgroundColor = [UIColor yellowColor];
//    }else{
//        self.backgroundColor = [UIColor whiteColor];
//    }
//    [self showMenu:self];
    // Configure the view for the selected state
}
//
//- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
////    [[self delegate] performSelector:@selector(showMenu:) withObject:self afterDelay:0.9f];
//    [super setHighlighted:highlighted animated:animated];
//}
//
////显示菜单
//- (void)showMenu:(id)cell {
//    [cell becomeFirstResponder];
//    UIMenuController * menu = [UIMenuController sharedMenuController];
//    [menu setTargetRect: [self frame] inView: self.superview];
//    [menu setMenuVisible: YES animated: YES];
//}
//
//- (BOOL)canBecomeFirstResponder  {
//    return YES;
//}
//
//- (BOOL)canPerformAction:(SEL)action withSender:(id)sender{
//    if (action == @selector(cut:)){
//        return NO;
//    }else if(action == @selector(copy:)){
//        return YES;
//    } else if(action == @selector(paste:)){
//        return NO;
//    } else if(action == @selector(select:)){
//        return NO;
//    }      else if(action == @selector(selectAll:)){
//        return NO;
//    }     else      {
//        return [super canPerformAction:action withSender:sender];
//    }
//}
//- (void)copy:(id)sender {
//    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
//    [pasteboard setString:[[self textLabel]text]];
//}

@end
