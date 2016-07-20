# Enumerations

![NameOfPerson](http://i.imgur.com/Oa3eJLw.jpg?1)  

> Tweet -[Bird](https://en.wikipedia.org/wiki/Bird) 
 

## Learning Objectives

* 



## Outline / Notes

* Unless you can think of something more exciting, I'm thinking we step into explaining Enumerations talking about Direction.
* Have them in the mind-set of creating a game, and the player can move in one of four direction, Up, Down, Left, Right. They could solve this problem by creating a function that takes in a "String" type.

```swift
func playerDidMove(direction: String) {
    // handle player movement
}

playerDidMove("Up")
```

* Except.. now every time we call on this method, we have to MAKE SURE we typed in the correct `String` representation of a player movement. What if we miss-spelled it. The function might be checking to see that we typed "UP" where the p must be upper-case.

* Enums!

```swift
enum Direction {
    case Up
    case Down
    case Left
    case Right
}
```

* Apples definition = An enumeration defines a common type for a group of related values and enables you to work with those values in a type-safe way within your code.

![EnumSS](http://i.imgur.com/KytnR0x.png?1)

![type](http://i.imgur.com/iIAopr9.png?1)

```swift
func playerDidMove(direction: Direction) {
    var moveDescrip = "Player has moved "
    
    switch direction {
    case .Up: moveDescrip += "up"
    case .Down: moveDescrip += "down"
    case .Left: moveDescrip += "left"
    case .Right: moveDescrip += "right"
    }
    
    moveDescrip += " 👑."
    
    print(moveDescrip)
}

playerDidMove(.Right)
// prints "Player has moved right 👑."
```

* I think we should show them how Enum's can have functions and computed properties but NOT Stored properties stressing the point that we're just making another type like a Class.. except it can't do all the things a class can do. Maybe separate out the logic from that global function created above to be part of the `Direction` enum itself.

* Should we show them that enum's can be backed by Raw Values... is that too much to cover in one reading? Maybe we direct them to read Apples chapter on ENums or direct them to check out documentation to explore the topic more deeply or is that a cop out? Willing to discuss.



<a href='https://learn.co/lessons/Enumerations' data-visibility='hidden'>View this lesson on Learn.co</a>
