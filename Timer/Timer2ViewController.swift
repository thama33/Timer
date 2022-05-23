//
//  Timer2ViewController.swift
//  Timer
//
//  Created by 濱上卓也 on 2022/05/16.
//

import UIKit
import RealmSwift

class Timer2ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    
    let realm = try! Realm()
    var task:Timers!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //背景をタップしたらdismissKeyboardメソッドを呼ぶように設定する
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        try! realm.write{
            let data = Kotei()
            data.kotei = "工程１"
            task.workTime.append(data)
            realm.add(self.task,update: .modified)
            
        }
        
        
        textField.text = task.title
        print(task.workTime.count)

        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        //カスタムセルの登録
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CustomCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.workTime.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! TableViewCell
       
       // cell.kouteiLabel.text = task.workTime[indexPath.row].kotei
        
        return cell
        
    }
    
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        try! realm.write{
            self.task.title = self.textField.text!
            
            self.realm.add(self.task, update: .modified)
        }
        super.viewWillDisappear(animated)
    }
    

  

}
