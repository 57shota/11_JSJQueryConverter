//
//  ViewController.swift
//  11_JSJQueryConverter
//
//  Created by shota ito on 14/10/2018.
//  Copyright © 2018 shota ito. All rights reserved.
//

/*
 
 INCOMPLETED!!!
 
 -  search condition is too strict. just make it able to match with a part of word
 -  not enough info. create the user-custom place
 
 */

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    var inList: [[String]] = [[],[]]
    var outList: [[String]] = [[],[]]
    
    
    var JQList: [[String]] = [
        
        // jQuery expression
        [".text()", ".html()", ".prepend()", ".append()", ".after()", ".before()", ".wrap()", ".unwrap()", ".replaceWith()", ".remove()", ".reverse()", ".makeArray()", ".is()", ".filter()", ".has()", ".insertAfter()", ".insertBefore()", ".parent()", ".find()", ".children()", ".eq()", ".clone()", ".sort()", ".not()", ".end()", ".empty()", ".toggleClass()", ".scrollTop()", ".scrollLeft()", ".show()", ".hide()", ".toggle()", ".get()", ".prev()", ".prevAll()", ".prevUntil()", ".next()", ".nextAll()", ".nextUntil()", ".siblings()", ".closest()", ".contents()", ".addBack()", ".val()", ".attr(属性名)", ".attr(属性名)", ".prop(プロパティ名)", ".prop(プロパティ名)", ".removeAttr(属性名)", ".removeProp(プロパティ名)", ".addClass()", ".removeClass()", ".toggleClass()", ".css()", "$.merge()", ".select()", ".focus()", "$.each()", ".every()", ".noop()", "$.type()", "$.get()", "$.post()", "$.getScript()", "$.isNumeric()", "$.isArray()", "$.isPlainObject()", "$.isEmptyObject()", "$.isFunction()", "$.isWindow()", ".slideUp()", ".slideDown()", ".slideToggle()"
        ],
        
        
        // jQuery meaning
        ["要素の値をテキストとして取得する", "要素の値をHTMLとして取得する", "要素内の先頭にタグを追加する", "要素内の末尾にタグを追加する", "要素の後ろにタグを追加する", "要素の前にタグを追加する", "要素を指定したタグで囲う", "要素を囲んでいるタグを削除する", "要素を別の要素に置き換える", "要素を削除する", "順序を逆順にする", "要素から配列を作成する", "セレクタに一致するか判定する", "要素を条件指定して取得する", "子要素に指定した要素を持っているか判定する", "要素を要素の後ろに移動する", "要素を要素の前に移動する", "親要素を取得する", "子要素を取得する（配下全て）", "子要素を取得する（直下のみ）", "子要素を取得する（インデックス指定）", "要素のコピーを作成する", "要素をソートする", "指定したセレクタの要素を除外する", "適用したメソッドを戻す", "要素を削除する", "classの適用・非適用を切り替える", "縦スクロールした座標を取得する", "横スクロールした座標を取得する", "要素を表示する", "要素を非表示にする", "要素の表示非表示を交互に切り替える", "要素のオブジェクトを取得する", "指定した要素の直前にある兄弟要素を取得する", "指定した要素の前にある兄弟要素を全て取得する", "指定した要素の直前にある兄弟要素から、指定した要素までの兄弟要素を取得する", "指定要素の次の要素を取得する", "指定した要素の次以降にある兄弟要素を全て取得する", "指定した要素の次以降にある兄弟要素から指定した要素までを取得する", "指定した要素の兄弟要素を全て取得する", "要素から指定した要素の最も近い親要素を取得する", "テキストやコメントも対象とした全子要素を取得する", "マッチした要素に加えて、１つ前にマッチした要素を加える", "valueの値を取得/設定する", "属性を取得する", "属性の値を取得する", "プロパティ値を設定する", "プロパティを取得する", "属性を削除する", "プロパティを削除する", "classを追加する", "classを削除する", "classの適用/非適用を切り替える", "スタイルを取得する", "配列を結合する", "文字を全選択状態にする", "フォーカスを当てる", "要素に対して繰り返し処理を行う", "配列の要素を順番にチェックする", "処理を行わない事を明示する", "型を判定して結果を文字列で取得する", "GETリクエストを送信する", "POSTリクエストを送信する", "JavaScriptファイルを非同期で読み込む", "数値かどうか判定する", "配列かどうか判定する", "オブジェクトかどうか判定する", "空かどうか判定する", "関数かどうか判定する", "windowオブジェクトかどうか判定する", "スライドアップ処理を行う", "スライドダウン処理を行う", "スライドアップ/スライドダウン処理を交互に行う"]
    
    ]
    
    
    var JSList: [[String]] = [
        
            // js expression
            [".innerText", ".innerHTML", " ", ".appendChild/push()", " ", ".insertBefore()", " ", " ", " ", ".remove()", ".reverse()", " ", ".is()", " ", ".has()", " ", " ", ".parent", " ", ".children", "", " ", " ", " ", ".end()", " ", " ", ".scrollTop", ".scrollLeft", " ", " ", ".toggle()", ".getElementById/.getElementsByClass", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", ".value", ".getAttribute()", ".setAttribute()", " ", " ", ".removeAttr()", " ", ".classList.add()", ".classList.remove()", ".classList.toggle()", " ", " ", ".select()", ".focus()", ".forEach()", ".every()", " ", ".type", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
            
            // js meaning
            ["要素の値をテキストとして取得する", "要素の値をHTMLとして取得する", " ", "要素内の末尾にタグを追加する", " ", "要素の前にタグを追加する", " ", " ", " ", "要素を削除する", "順序を逆順にする", " ", "セレクタに一致するか判定する", " ", "子要素に指定した要素を持っているか判定する", " ", " ", "親要素を取得する", " ", "子要素を取得する", " ", " ", " ", " ", "適用したメソッドを戻す", " ", " ", "縦スクロールした座標を取得する", "横スクロールした座標を取得する", " ", " ", "要素の表示非表示を交互に切り替える", "要素のオブジェクトを取得する", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", "valueの値を取得/設定する", "属性を取得する", "属性の値を取得する", " ", " ", "属性を削除する", " ", "classを追加する", "classを削除する", "classの適用/非適用を切り替える", " ", " ", "文字を全選択状態にする", "フォーカスを当てる", "要素に対して繰り返し処理を行う", "配列の要素を順番にチェックする", " ", "型を判定して結果を文字列で取得する", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "]
    
    
    ]
    
    
    
    
    @IBAction func convertSeg(_ sender: Any) {
        
        switch (sender as AnyObject).selectedSegmentIndex {
        case 0:
            inList = JSList
            outList = JQList
        case 1:
            inList = JQList
            outList = JSList
        default:
            print("non-selected")
        }
        
        
    }
    
    
    
    @IBAction func convertBtn(_ sender: Any) {
        
        guard var input = inList[0].index(of: inputField.text!) else {return}
        
        if inList[0][input] != " "{
            outputLabel.text = outList[0][input]
            descLabel.text = outList[1][input]
        }else{
            outputLabel.text = "-"
            descLabel.text = "Not found! Create yourself!"
        }
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputField.placeholder = "Please start \" . \""

    }


}

