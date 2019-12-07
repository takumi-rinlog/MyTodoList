//
//  ViewController.swift
//  MyTodoList
//
//  Created by takumi on 2019/12/07.
//  Copyright © 2019 takumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var todoList = [String]()
    
      // デバック用
//    var todoList = ["rrrr", "reefr", "hyh"]
    
    
    // 画面リロード用のアウトレット設定
    @IBOutlet weak var tvList: UITableView!
    
    @IBOutlet weak var tfAddTodo: UITextField!
    
    
    // MARK: テーブルビュー設定
    
    // 必須１　セクションの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return todoList.count
        
    }
    
    // 必須２　セルの設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cel =
            tableView.dequeueReusableCell(
                withIdentifier: "list",
                for: indexPath)
        
        cel.textLabel?.text = todoList[indexPath.row]
        
        
        return cel
        
    }
    
    // セル選択時
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        
        let cel = tableView.cellForRow(at: indexPath)
        _ = cel?.textLabel?.text ?? ""
        
    }
    
    // セルの編集許可
    func tableView(_ tableView: UITableView,
                   canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    // セルの削除（スワイプしたら）
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        
        
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            
            todoList.remove(at: indexPath.row)
            tableView.deleteRows(
                at: [indexPath as IndexPath],
                with: UITableView.RowAnimation.middle)
            
        }
    }

    // セクションタイトル
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "やることリスト"
    }
    
    // MARK: - アクションメソッド

    // +ボタン押下処理
    @IBAction func btAddTodo(_ sender: Any) {
        
        
        // TFが空文字なら追加しない
        if tfAddTodo.text != "" {
            todoList.append("\(tfAddTodo.text!)")
            tfAddTodo.text = ""
        } else {
            return
        }
        
        // キーボード非表示
        view.endEditing(true)
        
        // 追加し終わったらTableView再読み込み
        tvList.reloadData()
    }
    
    @IBAction func btAdd(_ sender: Any) {
    }
    
}

