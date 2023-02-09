//
//  DemoVC2Cell2.m
//  HDCollectionView
//
//  Created by HaoDong chen on 2018/12/18.
//  Copyright © 2018 CHD. All rights reserved.
//

#import "DemoVC5Cell2.h"
#import "UIView+gesture.h"
#import "HDCollectionView.h"
#import "HDDemoCellViewModel.h"

@interface DemoVC5Cell2()
@property (nonatomic, strong) UILabel *titleL;
@end
@implementation DemoVC5Cell2
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleL = [[UILabel alloc] initWithFrame:self.bounds];
        self.titleL.textAlignment = NSTextAlignmentCenter;
        self.titleL.numberOfLines = 0;
        [self.contentView addSubview:self.titleL];
    }
    __weak typeof(self) weakS = self;
    [self setTapActionWithBlock:^(UITapGestureRecognizer *tap) {
        [weakS clickSelf];
    }];
    return self;
}
- (void)layoutSubviews
{
    _titleL.frame = self.bounds;
    [super layoutSubviews];
}

HDCellVMGetter(HDDemoCellViewModel);

-(void)updateCellUI:(__kindof id<HDCellModelProtocol>)model
{
    self.titleL.text = [NSString stringWithFormat:@"%@",model.orgData];
    self.backgroundColor = [self viewModel].bgColor;
}

- (void)clickSelf
{
    [self.superCollectionV hd_changeSectionModelWithKey:self.hdModel.secModel.sectionKey animated:YES changingIn:^(HDSectionModel *secModel) {
            [secModel.sectionDataArr removeObject:self.hdModel];
    }];
}
@end
