//
//  TimerName.swift
//  Timer
//
//  Created by 濱上卓也 on 2022/05/17.
//

import RealmSwift

class Timers: Object{
    
    //管理用ID。プライマリーキー
    @objc dynamic var id = 0
    
    //タイトル
    @objc dynamic var title = ""
    
    
    //各工程のタイム 秒数

    var workTime = List<Kotei>
    
    //idをプライマリーキーとして設定
    override static func primaryKey() -> String? {
        return "id"
    }
    
    
}

class Kotei: Object{
    
    @objc dynamic var kotei = ""
   // @objc dynamic var koteiTime:Float = 30.0
   // @objc dynamic var sw = true
    
}
