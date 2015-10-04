//
//  ViewController.m
//  RDRGrowingTextViewExample
//
//  Created by Damiaan Twelker on 04/10/15.
//  Copyright (c) 2015 Damiaan Twelker. All rights reserved.
//

#import "ViewController.h"

#import "RDRGrowingTextView.h"

static NSString * const CellIdentifier = @"cell";
static CGFloat const MaxToolbarHeight = 200.0f;

@implementation ViewController {
    UIToolbar *_toolbar;
}

#pragma mark - Overrides

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (UIView *)inputAccessoryView
{
    if (_toolbar) {
        return _toolbar;
    }
    
    _toolbar = [UIToolbar new];
    
    RDRGrowingTextView *textView = [RDRGrowingTextView new];
    textView.font = [UIFont systemFontOfSize:17.0f];
    textView.textContainerInset = UIEdgeInsetsMake(4.0f, 3.0f, 3.0f, 3.0f);
    textView.layer.cornerRadius = 4.0f;
    textView.layer.borderColor = [UIColor colorWithRed:200.0f/255.0f green:200.0f/255.0f blue:205.0f/255.0f alpha:1.0f].CGColor;
    textView.layer.borderWidth = 1.0f;
    textView.layer.masksToBounds = YES;
    [_toolbar addSubview:textView];
    
    textView.translatesAutoresizingMaskIntoConstraints = NO;
    _toolbar.translatesAutoresizingMaskIntoConstraints = NO;
    
    [_toolbar addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-8-[textView]-8-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(textView)]];
    [_toolbar addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-8-[textView]-8-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(textView)]];
    
    [textView setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [textView setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [_toolbar setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    
    [_toolbar addConstraint:[NSLayoutConstraint constraintWithItem:_toolbar attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationLessThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:MaxToolbarHeight]];
    
    return _toolbar;
}

#pragma mark - View lifecycle

- (void)loadView
{
    [super loadView];
    
    self.title = @"RDRGrowingTextView";
    self.tableView.tableFooterView = [UIView new];
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
}

#pragma mark - UITableView

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor lightGrayColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont systemFontOfSize:16.0f];
    cell.textLabel.text = @"Lorem Ipsum";
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

@end
