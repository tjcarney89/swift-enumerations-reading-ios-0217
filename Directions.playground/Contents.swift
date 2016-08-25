func playerDidMove_String(direction: String) {
    if direction == "up" ||
       direction == "down" ||
       direction == "left" ||
       direction == "right" {
        print("Player moved \(direction)")
    } else {
        print("Oops! That direction doesn't make sense: \(direction)")
    }
}

playerDidMove_String("up")
playerDidMove_String("left")
playerDidMove_String("dwn")
playerDidMove_String("Up")



enum Direction {
    case Up
    case Down
    case Left
    case Right

    var excited: String {
        switch self {
        case .Up:
            return "UP"
        case .Down:
            return "DOWN"
        case .Left:
            return "LEFT"
        case .Right:
            return "RIGHT"
        }
    }
}

let direction1 = Direction.Up
let direction2: Direction = .Down
var direction3: Direction = .Right

let direction = Direction.Left

func playerDidMove(direction: Direction) {
    print("Player moved \(direction.excited)")
}

playerDidMove(direction1)
playerDidMove(direction2)
playerDidMove(direction3)

playerDidMove(.Left)
