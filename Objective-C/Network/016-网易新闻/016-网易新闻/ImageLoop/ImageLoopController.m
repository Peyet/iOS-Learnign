//
//  ImageLoopController.m
//  016-网易新闻
//
//  Created by Peyet-Zhao on 2021/11/22.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ImageLoopController.h"
#import "Headline.h"
#import "headlineCell.h"

@interface ImageLoopController () 

@property (nonatomic, strong) NSArray *headlines;

@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@end

@implementation ImageLoopController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    
    // Do any additional setup after loading the view.
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    NSLog(@"iamgeLoopViewcontroller");
    [Headline headlineWithSuccessBlock:^(NSArray * _Nonnull array) {
        //        NSLog(@"--success : %@", array);
        self.headlines = array;
    } errorBlock:^{
        NSLog(@"出错了");
    }];
    
    [self setCollectionViewStyle];
}

- (void)setCollectionViewStyle {
    self.flowLayout.itemSize = self.collectionView.frame.size;
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.flowLayout.minimumInteritemSpacing = 0;
    self.flowLayout.minimumLineSpacing = 0;
    
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.bounces = NO;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (void)setHeadlines:(NSArray *)headlines {
    _headlines = headlines;
    [self.collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    NSLog(@"number of item : %lu ", self.headlines.count);
    
    return self.headlines.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    headlineCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"headlineCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    
    // Configure the cell
    cell.tag = indexPath.item;
    cell.headline = self.headlines[indexPath.item];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
