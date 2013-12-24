//
//  RootViewController.m
//  SimpleBrowser
//
//  Created by rost on 23.12.13.
//  Copyright (c) 2013 rost. All rights reserved.
//

#import "RootViewController.h"


@interface RootViewController ()
@property (strong, nonatomic) UIWebView *browserView;
@property (strong, nonatomic) UIButton *backBtn;
@end


@implementation RootViewController

@synthesize browserView;
@synthesize backBtn;


- (id)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    [self createUI];
}

- (void)createUI
{
    CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
    
    self.title = @"Browser";
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                                                   [UIColor colorWithRed:255/255.0f green:155/255.0f blue:31/255.0f alpha:1.0f],
                                                                   UITextAttributeTextColor,
                                                                   [UIColor whiteColor],
                                                                   UITextAttributeTextShadowColor,
                                                                   [NSValue valueWithUIOffset:UIOffsetMake(0, 0)],
                                                                   UITextAttributeTextShadowOffset,
                                                                   [UIFont fontWithName:@"QuicksandBold-Regular" size:40.0],
                                                                   UITextAttributeFont,
                                                                   nil];    
    
    UIView *bgBarView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 20.0f, self.view.bounds.size.width, 44.0f)];
    bgBarView.backgroundColor = [UIColor colorWithRed:59/255.0f green:191/255.0f blue:234/255.0f alpha:0.1f];
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
    [self.view addSubview:fieldView];
    [self.view addSubview:urlField];
    
    float browserIndent = screenRect.origin.y + urlField.frame.origin.y + urlField.frame.size.height + 5.0f;
    
    self.browserView  = [[UIWebView alloc] initWithFrame:CGRectMake(0.0f, browserIndent, screenRect.size.width, screenRect.size.height)];
    self.browserView.delegate = self;
    [self.view addSubview:self.browserView];
}


- (float)getIndent
{
    return [[UIScreen mainScreen] applicationFrame].origin.y + 47.0f;
}

- (void)changeViewByRect:(CGRect)newRect andShowFlag:(BOOL)btnFlag
{
    NSString *titleStr = [self.browserView stringByEvaluatingJavaScriptFromString: @"document.title"];
    
    if (btnFlag)
    {
        CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
        screenRect.origin.y = [self getIndent] + 30.0f;
        
        btnFlag = TRUE;
        
        titleStr = @"Browser";
        
        self.browserView.backgroundColor = [UIColor colorWithRed:255/255.0f green:244/255.0f blue:240/255.0f alpha:1.0f];
    }
    
    self.backBtn.hidden = btnFlag;
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.browserView.frame = newRect;
                     }
                     completion:nil];

    self.title = titleStr;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.text.length > 3)
    {
        [textField resignFirstResponder];

        dispatch_async(dispatch_get_main_queue(),
                       ^{
                           NSURL *webURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@", textField.text]];
                           [self.browserView loadRequest:[NSURLRequest requestWithURL:webURL]];
                       });
        return YES;
    }
    else
        return NO;
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
    screenRect.origin.y = [self getIndent] - 2.0f;
    
    [self changeViewByRect:screenRect andShowFlag:FALSE];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
