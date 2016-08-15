//
//  DFCopyLable.m
//  CopyLabel
//
//  Created by mac on 16/6/1.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "DFCopyLabel.h"

@implementation DFCopyLabel

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
////     Drawing code
//    [self setlable];
//}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *copyTap = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(copyLongPressGresture:)];
    [self addGestureRecognizer:copyTap];
    
    return self;
}

-(void)copyLongPressGresture:(UILongPressGestureRecognizer*)gesture{
    [self becomeFirstResponder];
//    UIMenuController * menu = [UIMenuController sharedMenuController];
//    [menu setTargetRect: self.frame inView:self.superview];
//    [menu setMenuVisible: YES animated: YES];
    
    UIMenuItem *copyLink = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copy1:)];
    UIMenuItem *pasteLink = [[UIMenuItem alloc] initWithTitle:@"粘贴" action:@selector(paste1:)];
    [[UIMenuController sharedMenuController] setMenuItems:[NSArray arrayWithObjects:copyLink,pasteLink, nil]];
    [[UIMenuController sharedMenuController] setTargetRect:self.frame inView:self.superview];
    [[UIMenuController sharedMenuController] setMenuVisible:YES animated: YES];

}
- (BOOL)canBecomeFirstResponder  {
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    if (action == @selector(cut:)){
        return NO;
    }else if(action == @selector(copy:)){
        return NO;
    } else if(action == @selector(paste:)){
        return NO;
    } else if(action == @selector(select:)){
        return NO;
    }      else if(action == @selector(selectAll:)){
        return NO;
    }     else      {
        return [super canPerformAction:action withSender:sender];
    }
}

//- (void)copy:(id)sender {
//    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
//    [pasteboard setString:self.text];
//}

- (void)copy1:(id)sender {
    if (self.text) {
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        [pasteboard setString:self.text];
    }
}
- (void)paste1:(id)sender {
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    self.text = pasteboard.string;
}


@end
