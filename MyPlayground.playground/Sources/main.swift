import Foundation
//위치 좌표
struct CoordinatePoint {
    var x: Int
    var y: Int
    
}

class Position {
    var point: CoordinatePoint?
    let name: String
    
    init (name:String){
        self.name = name
    }
    
}
let yagomPosition:Position = Position(name: "yagom")
//이름은 필수지만 좌표는 모를수있음 > 그래서 옵셔널 처리
yagomPosition.point = CoordinatePoint(x: 12, y: 23)
//좌표 알게되면 그때 대입

//**** 지연 저장 프로퍼티
//지연저장 프로퍼티는 값이 있어야 호출을 합니다(메모리 관리 굳 )

class Position2 {
    lazy var point:CoordinatePoint = CoordinatePoint(x: 1, y: 2)
    let name:String
    
    init(name:String) {
        self.name = name
    }
}
let yagom: Position2 = Position2(name: "good")
print(yagom.point) //접근할때 프로퍼티가 생성댐

//연산 프로퍼티






