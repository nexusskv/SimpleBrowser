//
//  RootViewController.m
//  SimpleBrowser
//
//  Created by rost on 23.12.13.
//  Copyright (c) 2013 rost. All rights reserved.
//

#import "RootViewController.h"
#import "CollectViewCell.h"
#import "CollectViewDataSource.h"


@interface RootViewController ()
@property (strong, nonatomic) UIWebView *browserView;
@property (strong, nonatomic) UIButton *backBtn;
@property (strong, nonatomic) NSArray *collDataArr;
@property (strong, nonatomic) UILabel *titleLabel;
@end


@implementation RootViewController

@synthesize browserView;
@synthesize backBtn;
@synthesize collDataArr;
@synthesize titleLabel;


#pragma mark - Constructor
- (id)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}
#pragma mark -


#pragma mark - View life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    [self createUI];
    
    self.collDataArr = [[CollectViewDataSource shared] getLinksArray];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    self.navigationController.navigationBar.hidden = TRUE;
}
#pragma mark - 


#pragma mark - createUI
- (void)createUI
{
    CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
    
    
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, screenRect.origin.y, screenRect.size.width, 44.0f)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor colorWithRed:255/255.0f green:155/255.0f blue:31/255.0f alpha:1.0f];
    //titleLabel.text = self.navigationItem.title;
    [titleLabel setShadowColor:[UIColor darkGrayColor]];
    [titleLabel setShadowOffset:CGSizeMake(0.5f, 1.0f)];
    [self.view addSubview:self.titleLabel];
    
    
    [self setTitleLabel:@"Browser" withFontSize:25.0f];
    
    /*
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                                                   [UIColor colorWithRed:255/255.0f green:155/255.0f blue:31/255.0f alpha:1.0f],
                                                                   UITextAttributeTextColor,
                                                                   [UIColor whiteColor],
                                                                   UITextAttributeTextShadowColor,
                                                                   [NSValue valueWithUIOffset:UIOffsetMake(0, 0)],
                                                                   UITextAttributeTextShadowOffset,
                                                                   [UIFont fontWithName:BROWSER_TITLE_FONT size:40.0f],
                                                                   UITextAttributeFont,
                                                                   nil];    
    */
    UIView *bgBarView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 20.0f, self.view.bounds.size.width, 44.0f)];
    bgBarView.backgroundColor = [UIColor colorWithRed:159/255.0f green:191/255.0f blue:234/255.0f alpha:0.1f];
    [self.navigationController.view addSubview:bgBarView];

    self.backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backBtn setFrame:CGRectMake(10.0f, screenRect.origin.y + 7.0f, 32.0f, 32.0f)];
    [self.backBtn setBackgroundImage:[UIImage imageNamed:@"back_btn.png"] forState:UIControlStateNormal];
    [self.backBtn addTarget:self action:@selector(changeViewByRect:andShowFlag:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.view addSubview:self.backBtn];
    self.backBtn.hidden = TRUE;
    
    UIView *fieldView = [[UIView alloc] initWithFrame:CGRectMake(5.0f, [self getIndent], screenRect.size.width - 10.0f, 36.0f)];
    fieldView.backgroundColor           = [UIColor colorWithRed:255/255.0f green:244/255.0f blue:240/255.0f alpha:1.0f];
    fieldView.layer.cornerRadius        = 15.0f;
    fieldView.layer.borderWidth         = 1.0f;
    fieldView.layer.borderColor         = [[UIColor lightGrayColor] CGColor];
    
    UITextField *urlField = [[UITextField alloc] initWithFrame:CGRectMake(10.0f, [self getIndent] + 3.0f, fieldView.bounds.size.width - 10.0f, 30.0f)];
    urlField.delegate                  = self;
    urlField.font                      = [UIFont fontWithName:@"Helvetica" size:20.0f];
    urlField.autocapitalizationType    = UITextAutocapitalizationTypeNone;
    urlField.autocorrectionType        = UITextAutocorrectionTypeNo;
    urlField.keyboardType              = UIKeyboardTypeURL;
    urlField.returnKeyType             = UIReturnKeySearch;
    urlField.clearButtonMode           = UITextFieldViewModeWhileEditing;
    urlField.placeholder               = BROWSER_TXT_FLD_HOLDER;
    [self.view addSubview:fieldView];
    [self.view addSubview:urlField];
 
    
    float browserIndent = screenRect.origin.y + urlField.frame.origin.y + urlField.frame.size.height + 5.0f;
    
    self.browserView  = [[UIWebView alloc] initWithFrame:CGRectMake(0.0f, browserIndent, screenRect.size.width, screenRect.size.height)];
    self.browserView.delegate = self;
    [self.view addSubview:self.browserView];
    
    [self addCollectionView];

}
#pragma mark - 


#pragma mark - Indent for view
- (float)getIndent
{
    return [[UIScreen mainScreen] applicationFrame].origin.y + 50.0f;
}
#pragma mark - 


#pragma mark - setTitleLabel:withFontSize:
- (void)setTitleLabel:(NSString *)titleStr withFontSize:(float)fontSize
{
    self.titleLabel.font = [UIFont fontWithName:BROWSER_TITLE_FONT size:fontSize];
    self.titleLabel.text = titleStr;
}
#pragma mark -


#pragma mark - Back Button Selector
- (void)changeViewByRect:(CGRect)newRect andShowFlag:(BOOL)btnFlag
{
    CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
    
    NSString *titleStr = [self.browserView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
    float setFontSize = 15.0f;
    
    if (btnFlag)
    {
        screenRect.origin.y = [self getIndent] + 30.0f;
        
        btnFlag = TRUE;
        
        titleStr = @"Browser";
        
        self.browserView.backgroundColor = [UIColor colorWithRed:255/255.0f green:244/255.0f blue:240/255.0f alpha:1.0f];
        
        [self addCollectionView];
        
        setFontSize = 25.0f;
    }
    
    self.backBtn.hidden = btnFlag;
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.browserView.frame = newRect;
                     }
                     completion:nil];

    [self setTitleLabel:titleStr withFontSize:setFontSize];
}
#pragma mark -


#pragma mark - showWebViewByURL:
- (void)showWebViewByURL:(NSString *)urlStr
{
    dispatch_async(dispatch_get_main_queue(),
                   ^{
                       [[self.view viewWithTag:COLLECT_VIEW_TAG] removeFromSuperview];
                       
                       NSURL *webURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@", urlStr]];
                       [self.browserView loadRequest:[NSURLRequest requestWithURL:webURL]];
                   });
}
#pragma mark -


#pragma mark - addCollectionView
- (void)addCollectionView
{
    CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    
    CGRect collectViewRect = CGRectMake(5.0f, screenRect.origin.y + 88.0f, screenRect.size.width - 10.0f, screenRect.size.height - 90.0f);
    
    UICollectionView *collectView = [[UICollectionView alloc] initWithFrame:collectViewRect collectionViewLayout:layout];
    collectView.tag = COLLECT_VIEW_TAG;
    [collectView setDataSource:self];
    [collectView setDelegate:self];
    
    [collectView registerClass:[CollectViewCell class] forCellWithReuseIdentifier:@"COLLECT_VIEW_CELL"];
    [collectView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:collectView];
}
#pragma mark -


#pragma mark - TextField Delegate methods
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    textField.text = @"";
    return TRUE;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    if (textField.text.length > 3)
    {
        [self showWebViewByURL:textField.text];

        return TRUE;
    }
    else
        return FALSE;
}
#pragma mark - 


#pragma mark - WebView Delegate methods
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
    screenRect.origin.y = [self getIndent] - 2.0f;

    [self changeViewByRect:screenRect andShowFlag:FALSE];
}
#pragma mark -


#pragma mark - CollectionView Delegate Methods
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return TRUE;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section
{
    return [self.collDataArr count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    CollectViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"COLLECT_VIEW_CELL" forIndexPath:indexPath];
   
    cell.iconImg.image = [UIImage imageNamed:[[self.collDataArr objectAtIndex:indexPath.item] valueForKey:@"logo"]];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(ITEM_WIDTH, ITEM_HEIGHT);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10.0f, 10.0f, 90.0f, 10.0f);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectViewCell *cell = (CollectViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    [UIView animateWithDuration:0.2f
                     animations:^{
                         cell.frame = CGRectMake(cell.frame.origin.x + 1.0f, cell.frame.origin.y + 7.0f, ITEM_WIDTH, ITEM_HEIGHT);
                     }
                     completion:^(BOOL finished) {
                         cell.frame = CGRectMake(cell.frame.origin.x - 1.0f, cell.frame.origin.y - 7.0f, ITEM_WIDTH, ITEM_HEIGHT);
                         
                         [self showWebViewByURL:[[self.collDataArr objectAtIndex:indexPath.item] valueForKey:@"link"]];
                     }];
}
#pragma mark -


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
