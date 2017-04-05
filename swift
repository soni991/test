struct Point {
    let x: Int
    let y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    /// Return the surrounding point in range of
    /// the current one
    func points(inRange range: Int = 1) -> [Point] {
        
        var results = [Point]()
        
        let lowerBoundOfXRange = x - range
        let upperBoundOfXRange = x + range
        
        let lowerBoundOfYRange = y - range
        let upperBoundOfYRange = y + range
        
        for xCoordinate in lowerBoundOfXRange...upperBoundOfXRange {
            for yCoordinate in lowerBoundOfYRange...upperBoundOfYRange{
                
                
                let coordinatePoint = Point(x: xCoordinate, y: yCoordinate)
                results.append(coordinatePoint)
                
            }
            
        }
        
        
        return results
        
    }
}
class Enemy {
    var life: Int = 2
    let position : Point
    
    init(x: Int, y:Int) {
        self.position = Point(x: x, y: y)
    }
    
    func decreaseLife(by Factor: Int) {
        life -= Factor
    }
    
}
class Tower {
    let position: Point
    var range: Int = 1
    var strength: Int = 1
    
    init(x: Int, y:Int) {
        self.position = Point(x: x, y: y)
    }
    func fire (at enemy: Enemy) {
        if isInRange(of: enemy){
            enemy.decreaseLife(by: strength)
            print("Gotcha")
        }else {
            print("Darn Out of Range")
        }
    }
    func isInRange (of enemy: Enemy) -> Bool {
        let availablePositions = position.points(inRange: range )
        for point in availablePositions {
            if point.x == enemy.position.x && point.y == enemy.position.y {
                return true
            }
        }
        return false
    }
}


let towerNo1 = Tower(x: 0, y: 0)

let enemyNo1 = Enemy(x: 1, y: 1)

towerNo1.fire(at: enemyNo1)
