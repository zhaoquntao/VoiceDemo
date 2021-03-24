//
//  TTTextPlayer.h
//  VoiceDemo
//
//  Created by TT on 2021/3/24.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface TTTextPlayer : NSObject<AVSpeechSynthesizerDelegate>


@property(nonatomic,assign)float rate;   //语速

@property(nonatomic,assign)float volume; //音量

@property(nonatomic,assign)float pitchMultiplier;  //音调

@property(nonatomic,assign)BOOL  autoPlay;  //自动播放

@property (nonatomic,copy) void (^stop)(); //结束


@property(nonatomic,strong) AVSpeechSynthesizer *qPlayer;


//类方法实例出对象

+ (instancetype)sharedInstance;

//基础设置

-(void)setDefaultWithVolume:(float)aVolume rate:(CGFloat)aRate pitchMultiplier:(CGFloat)aPitchMultiplier;

//播放并给出文字

-(void)play:(NSString *)string;


@end

NS_ASSUME_NONNULL_END
