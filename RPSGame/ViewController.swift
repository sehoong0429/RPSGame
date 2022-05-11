//
//  ViewController.swift
//  RPSGame
//
//  Created by Seoyeon Hong on 2022/05/09.
//

import UIKit

class ViewController: UIViewController {

    //변수 / 속성
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    var comChoice: Rps = Rps(rawValue: Int.random(in: 0...2))!
    var myChoice: Rps = Rps.rock
    
    //함수 /메서드
    //앱의 화면에 들어오면 처음 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1) 첫번째 두번째 이미지 뷰에 준비 이미지를 띄워야 함
        comImageView.image = #imageLiteral(resourceName: "rock")
        myImageView.image = UIImage(named:"ready.png")
        // 2) 첫번째 두번째 레이블에 "준비" 라고 문자열을 띄워야 함
        comChoiceLabel.text = "READY"
        myChoiceLabel.text = "READY"
        
        
    }
    
    //가위, 바위,보 버튼
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        //가위 바위 보(enum)를 선택해서 그 정보를 저장해야됨
//        guard let title = sender.currentTitle else {
//            return
//        }
        //버튼의 문자를 가져옴
        let title = sender.currentTitle!
        switch title{
        case "SCISSORS":
            myChoice = Rps.scissors
        case "ROCK":
            myChoice = Rps.rock
        case "PAPER":
            myChoice = Rps.paper
        default:
            break
        }
    }
    
    //선택 버튼
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        // 1. 컴퓨터가 랜덤 선택한 것을 이미지 뷰에 표시
        // 2. 컴퓨터가 랜덤 선택한 것을 레이블에 표시
        switch comChoice {
        case Rps.rock:
            comImageView.image = #imageLiteral(resourceName: "rock")
            comChoiceLabel.text = "rock"
        case Rps.paper:
            comImageView.image = #imageLiteral(resourceName: "paper")
            comChoiceLabel.text = "paper"
        case Rps.scissors:
            comImageView.image = #imageLiteral(resourceName: "scissors")
            comChoiceLabel.text = "scissors"
        }
        // 3. 내가 선택한 것을 이미지 뷰에 표시
        // 4. 내가 선택한 것을 레이블에 표시
        switch myChoice {
        case Rps.rock:
            myImageView.image = #imageLiteral(resourceName: "rock")
            myChoiceLabel.text = "rock"
        case Rps.paper:
            myImageView.image = #imageLiteral(resourceName: "paper")
            myChoiceLabel.text = "paper"
        case Rps.scissors:
            myImageView.image = #imageLiteral(resourceName: "scissors")
            myChoiceLabel.text = "scissors"
        }
        // 5. 컴퓨터가 선택한 것과 내가 선택한 것을 비교해서 이겼는지/ 졌는지 판단 /표시
        
        if comChoice == myChoice {
            mainLabel.text = "DRAW"
        } else if comChoice == .rock && myChoice == .paper {
            mainLabel.text = "WIN"
        } else if comChoice == .paper && myChoice == .scissors {
            mainLabel.text = "WIN"
        } else if comChoice == .scissors && myChoice == .rock {
            mainLabel.text = "WIN"
        } else {
            mainLabel.text = "LOSE"
        }
    
    
    }
    
    //Reset 버튼
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 1. 컴퓨터가 다시 준비 이미지 뷰에 표시
        // 2. 컴퓨터가 다시 준비 레이블에 표시
        comImageView.image = #imageLiteral(resourceName: "ready")
        comChoiceLabel.text = "ready"
        // 3. 내 선택 이미지 뷰에도 준비 이미지를 표시
        // 4. 내가 선택 레이블에도 준비 문자열 표시
        comImageView.image = #imageLiteral(resourceName: "ready")
        comChoiceLabel.text = "ready"
        // 5. 메인 레이블 "선택하세요" 표시
        mainLabel.text = "PLEADE CHOOSE ONE"
        
        // 6. 컴퓨터가 다시 랜덤 가위/바위/보를 선택하고 저장
        comChoice = Rps(rawValue: Int.random(in: 0...2))!
    }
    
    

}

