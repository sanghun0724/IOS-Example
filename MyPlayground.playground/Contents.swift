import UIKit
var person:(String,Int,Double) = ("HI",1,1.0)
//print(person) //튜플
//print(person.2)
//print("인사:\(person.0)")
var human: (name: String,age: Int ,height: Double) = ("kimchman",14,180.2)
//print(human)
var attitude:(power:Int,name:String,kimchipower:Int)
// 튜플별칭지정 더깔끔 안전데스요~
//이제부터 컬렉션형 데이터 관리 하는 것들 3개 배열 딕셔너리 세트
//배열먼저 들어갑니다
var names:Array<String> = ["kimchi","kkk","black"]
var kimchiman:[String] = ["no.1","www"]
var emptyArray:[Any] = [Any]()
//var ematy:[Any] = Array<Any>()
var ematy:[Any] = []
//print(ematy.isEmpty); print(ematy.count)
//딕셔너리 갑시다
var hey:Dictionary<String,Int> = Dictionary<String,Int>()
var qey:[String:Int] = [String:Int]()
//타입별칭 상요해서 딕셔너리 만들어보리기
typealias StringIntDictionary = [String:Int]
var Three: StringIntDictionary = StringIntDictionary()

var another:[String:Int] = [:]
var insidesometihing:[String:Int] = ["kimch":100,"black":2]
print(insidesometihing["kimch"] ?? <#default value#>)

