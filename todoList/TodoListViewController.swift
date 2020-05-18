//
//  ViewController.swift
//  todoList
//
//  Created by osakamiseri on 2020/05/18.
//  Copyright © 2020 osakamiseri. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    // アイテムの型
    class Item {
        var title : String
        var done: Bool = false
        
        init(title: String) {
            self.title = title
        }
    }
    
    // この配列に作ったアイテムを追加していく
    var itemArray: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // NaviBarのタイトルを大きく表示させる
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // あらかじめ3つアイテムを作っておく
        let item1: Item = Item(title: "宿題をする")
        let item2: Item = Item(title: "牛乳を買う")
        let item3: Item = Item(title: "手紙を書く")
        
        // 配列に追加
        itemArray.append(item1)
        itemArray.append(item2)
        itemArray.append(item3)
        
    }
    
    // MARK - セルの数を指定
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
        
    }
    
    // MARK - セルのカスタマイズ
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        return cell
        
    }
    
    // MARK - チェックマーク機能
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 選択されたセルに実行される処理

        let item = itemArray[indexPath.row]

        // チェックマーク
        item.done = !item.done

        // リロードしてUIに反映
        self.tableView.reloadData()

        // セルを選択した時の背景の変化を遅くする
        tableView.deselectRow(at: indexPath, animated: true)

    }
}

