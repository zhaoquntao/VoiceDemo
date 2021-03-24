//
//  ViewController.m
//  VoiceDemo
//
//  Created by TT on 2021/3/24.
//

#import "ViewController.h"
#import "TTTextPlayer.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *testTextView;
@property (weak, nonatomic) IBOutlet UIButton *playerBtn;
@property (weak, nonatomic) IBOutlet UIButton *stopBtn;
@property (weak, nonatomic) IBOutlet UIButton *suspendBtn;
@property (weak, nonatomic) IBOutlet UIButton *continueSpeakingBtn;
@property (weak, nonatomic) IBOutlet UISlider *rateSlider;
@property (weak, nonatomic) IBOutlet UISlider *volumeSlider;
@property(nonatomic,strong) TTTextPlayer *textPlayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.testTextView.text = @"App到账1亿元";
}

- (IBAction)playText:(UIButton *)sender {
    [self playText];
}
- (IBAction)stopBtnClick:(id)sender {
    [self.textPlayer.qPlayer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
}
- (IBAction)suspendBtnClick:(id)sender {
    [self.textPlayer.qPlayer pauseSpeakingAtBoundary:AVSpeechBoundaryImmediate];
//    [self stopTimer];
}
- (IBAction)continueSpeakingBtnClick:(id)sender {
    [self.textPlayer.qPlayer continueSpeaking];
}



- (IBAction)rateSlider:(id)sender {
    UISlider *slider = (UISlider *)sender;

    self.textPlayer.rate=slider.value;
}

- (IBAction)volumeSlider:(id)sender {
    UISlider *slider = (UISlider *)sender;
    
    self.textPlayer.volume=slider.value;
}


#pragma mark -btnClick
-(void)playText{
    
    TTTextPlayer *textPlayer = [TTTextPlayer sharedInstance];
    textPlayer.rate=self.rateSlider.value;
    textPlayer.volume=self.volumeSlider.value;
    textPlayer.pitchMultiplier=1;
    self.textPlayer=textPlayer;
    //语音播报结束回调
    
    [self.textPlayer setStop:^{
    }];
    
    [textPlayer play:self.testTextView.text];

}


@end
