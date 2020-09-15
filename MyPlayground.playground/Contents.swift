import UIKit
//MARK: tuple
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
//MARK: Array
var names:Array<String> = ["kimchi","kkk","black"]
var kimchiman:[String] = ["no.1","www"]
var emptyArray:[Any] = [Any]()
//var ematy:[Any] = Array<Any>()
var ematy:[Any] = []
//print(ematy.isEmpty); print(ematy.count)
//딕셔너리 갑시다
//MARK: Dictionary
var hey:Dictionary<String,Int> = Dictionary<String,Int>()
var qey:[String:Int] = [String:Int]()
//타입별칭 상요해서 딕셔너리 만들어보리기
typealias StringIntDictionary = [String:Int]
var Three: StringIntDictionary = StringIntDictionary()

var another:[String:Int] = [:]
var insidesometihing:[String:Int] = ["kimch":100,"black":2]
print(insidesometihing["kimch"] ?? <#default value#>)
// 딕셔너리 사용
//딕셔너리에 없는거 추가
insidesometihing["myung"] = 100
print(insidesometihing["myung"])
var deletee = insidesometihing.removeValue(forKey: "myung")
print(deletee)
print(insidesometihing["myung",default: 0]) // 기본값.  (만약 값이 없으면 디폴트 제공
//  SET 갑시다 . 순서 지맘대로 각요소는 하나씩만
//MARK: Set
var name:Set<String> = Set<String>();    var wames: Set<String> = []
name = ["kimchi","yagom","vividly"]
var 임의의요소 = name.randomElement()
var 뒤죽박죽섞어버려 = name.shuffled()
//열거형 갑시다 = 정해준값 이외의 추가/ 수정 불가능!
//열거형은 열거형 자체로 고유타입으로 인정되기 때문에 타입으로인한 버그가 업써영
//MARK: enum
enum school {
    case priamry
    case elementary
    case middle
    case high
    case colleage
    case university
    case graduate
}
enum number:Int { case zero,one,two,ten }
print("\(number.ten.rawValue)")
//연관값
enum MainDish {
    case pasta(taste: String)
    case pizza(taste: String , topping:String)
    case chicken(menu: String)
}
var dinner:MainDish = MainDish.chicken(menu: "양념")
print(dinner)
dinner = .pasta(taste: "크림")
dinner = .pizza(taste: "dd", topping: "dd")
//P108
 




