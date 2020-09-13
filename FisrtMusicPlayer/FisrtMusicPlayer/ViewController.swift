//
//  ViewController.swift
//  FisrtMusicPlayer
//
//  Created by sangheon on 2020/09/13.
//  Copyright © 2020 sangheon. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController , AVAudioPlayerDelegate{
    // MARK: - properties
    var player: AVAudioPlayer!
    var timer: Timer!
    
    //MARK: IBOulet
    @IBOutlet var playPauseButton:UIButton!
    @IBOutlet var timeLabel:UILabel!
    @IBOutlet var progressSlider:UISlider!
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
     
    //MARK: - Methods
    //MARK: Custom Method
    func initializePlayer() {
        guard let soundAsset:NSDataAsset = NSDataAsset(name:"sound") else {
            print("음원 파일 에셋을 가져올수 업성용")
            return
        }
        
        do{
            try self.player = AVAudioPlayer(data: soundAsset.data)
        self.player.delegate = self //2장에서 자세한 설명 굳뜨~
        } catch let error as NSError {
            print("플레이어 초기화 실패ㅠ")
            print("코드 : \(error.code), 메세지 : \(error.localizedDescription)")
            
        }
        self.progressSlider.maximumValue = Float(self.player.duration)
        self.progressSlider.maximumValue = 0
        self.progressSlider.value = Float(self.player.currentTime)
    }
    
    func updateTimeLabelText(time: TimeInterval){
        let minute: Int = Int(time / 60)
        let second: Int = Int(time.truncatingRemainder(dividingBy: 60))
        let milisecond: Int = Int(time.truncatingRemainder(dividingBy: 1) * 100)
        
        let timeText: String = String(format: "%02ld:%02ld%:02ld",minute,second,milisecond)
        
        self.timeLabel.text = timeText
    }

    func makeAndFireTimer() {  //타이머 만드는 메소드
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block:{
            [unowned self] (timer: Timer) in
            
            if self.progressSlider.isTracking {return}
            
            self.updateTimeLabelText(time: self.player.currentTime)
            self.progressSlider.value = Float(self.player.currentTime)
        })
        self.timer.fire()
    }
    func invalidateTimer(){
        self.timer.invalidate()
        self.timer = nil
    }
    func addViewWithCode(){
    
    }
    
    func addplayPauseButton(){
        let button: UIButton = UIButton(type:UIButton.ButtonType.custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(button)
        
        button.setImage(UIImage(named: "button_play"), for: UIControl.State.normal)
        button.setImage(UIImage(named: "button_pause"), for: UIControl.State.selected)
        
        button.addTarget(self, action: #selector(self.touchupPlayPauseButton(_:)), for: UIControl.Event.touchUpInside)
        
        let centerX: NSLayoutConstraint
        centerX = button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        
        let centerY: NSLayoutConstraint
        centerY = NSLayoutConstraint(item: button, attribute:NSLayoutConstraint.Attribute.centerY relatedBy: <#T##NSLayoutConstraint.Relation#>, toItem: <#T##Any?#>, attribute: <#T##NSLayoutConstraint.Attribute#>, multiplier: <#T##CGFloat#>, constant: <#T##CGFloat#>)
    }
    
    
    
    
    
    
    //MARK: IBAction
    @IBAction func touchupPlayPauseButton(_ sender:UIButton){
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            self.player?.play()
            self.makeAndFireTimer()//bool 타입들
        }else {
            self.player?.pause()
            self.invalidateTimer()
        }
    }
    @IBAction func sliderValueChanged(_ sender:UISlider){
        self.updateTimeLabelText(time: TimeInterval(sender.value))
        if sender.isTracking{return}
        self.player.currentTime = TimeInterval(sender.value)
    }
    
    //MARK: AVaudioPlayerDelegate
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        guard let error:Error = error else {
            print("오디오 플레이어 디코드 오류 발생 ")
            return
        }
        
        let message: String
        message = "오디오 플레이어 오류 발생 \(error.localizedDescription)"
        
        let alert:UIAlertController = UIAlertController(title: "알림", message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okAction: UIAlertAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default){
            (action: UIAlertAction) -> Void in
            
            self.dismiss(animated: true, completion: nil)
    
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    
    }
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.playPauseButton.isSelected = false
        self.progressSlider.value = 0
        self.updateTimeLabelText(time: 0)
        self.invalidateTimer()
    }
}


