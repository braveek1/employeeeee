//
//  ViewController.swift
//  employeeeee
//
//  Created by YONGKI LEE on 2019/12/07.
//  Copyright © 2019 Brave Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var members: [Member] = []
    
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var employWorld: UILabel!
    @IBOutlet weak var ageInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func selectButton(_ sender: UIButton) {
        textArea.text = "사원 일람입니다.\n"
        if members.count == 0 { textArea.text = "사원이 존재하지 않습니다."}
        for member in members {
            textArea.text += "name: \(member.name), age: \(member.age)\n"
        }
        hideKeyboard()
        
    }
    
    @IBAction func insertButton(_ sender: UIButton) {
        
        guard nameInput.text != nil else { return }
        guard ageInput.text != nil else { return }
        let member = Member.init(name: nameInput.text!, age: ageInput.text!)
        members.append(member)
        textArea.text =
        """
        아래의 사원정보가 추가되었습니다.
        name: \(member.name), age: \(member.age)
        """
        
//        let member = Member(name: name, age: age)
//        members.append(member)
//
//        textArea.text = "이름: \(member.name), 나이: \(member.age)\n"
//        hideKeyboard()
    }
    @IBAction func deleteButton(_ sender: UIButton) {
        
        switch members.count {
        case 0:
            textArea.text =
            """
            사원이 존재하지 않습니다.
            """
            break
        default:
            let membersEndIndex: Int = members.count - 1
            textArea.text =
            """
            아래의 사원정보가 삭제되었습니다.
            name: \(members[membersEndIndex].name), age: \(members[membersEndIndex].age)
            """
            members.remove(at: membersEndIndex)

            
//            name: \(members[members.endIndex].name), age: \(members[members.endIndex].age)
            break
        }
        
        hideKeyboard()
    }
    

    @IBOutlet weak var textArea: UITextView!
    

    class Member {
        var name: String
        var age: String
        init(name: String, age:String){
            self.name = name
            self.age = age
        }
    }
    
    func hideKeyboard() {
        nameInput.resignFirstResponder()
        ageInput.resignFirstResponder()
    }
    
}

