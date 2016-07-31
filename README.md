# Enumerations

![NameOfPerson](http://i.imgur.com/Oa3eJLw.jpg?1)  

> Tweet ~[Bird](https://en.wikipedia.org/wiki/Bird)
 

## Learning Objectives

* FILL IN!

## Directions

Imagine you're creating a simple top-down game where the player controls a little character that can move around a map. It's a pretty simple game, so the character can only move up, down, left, or right. You probably have some sort of game controller that includes a method that could look something like this:

```swift
func playerDidMove(direction: String) {
    print("Player moved \(direction)")
}

playerDidMove("up")
// prints "Player moved up"
```

Great! The problem is, some directions are invalid. What if a player tries to move diagonally?

```swift
func playerDidMove(direction: String) {
    print("Player moved \(direction)")
}

playerDidMove("diagonally up")
// prints "Player moved diagonally up"
```

Oh no! The game doesn't actually support diagonal movement, so in your game, you probably haven't handled this movement direction. It would make sense, then, to check the `direction` parameter to make sure the directions are valid. You could modify `playerDidMove(_:)` to check the `String` that is passed in:

```swift
func playerDidMove(direction: String) {
    if direction == "up" ||
       direction == "down" ||
       direction == "left" ||
       direction == "right" {
        print("Player moved \(direction)")
    } else {
        print("Oops! That direction doesn't make sense: \(direction)")
    }
}

playerDidMove("up")
// prints "Player moved up"
playerDidMove("diagonally left")
// prints "Oops! That direction doesn't make sense: diagonally left
```

Perfect! Let's ship the code.

Except...what if you call `playerDidMove(_:)` with the wrong case?

```swift
playerDidMove("Up")
// prints "Oops! That direction doesn't make sense: Up
```

Or what if you make a typo when you call `playerDidMove(_:)`?

```swift
playerDidMove("dwn")
// prints "Oops! That direction doesn't make sense: dwn
```

It's a little bit ridiculous for `playerDidMove(_:)` to handle possible typos, even the most common ones, but it's also going to be time-consuming—not to mention error-prone—to ensure that you _always_ call `playerDidMove(_:)` with the correct strings.

Luckily, Swift has a solution to this problem: Enumerations (or enums for short).

## Enumerations

Instead of using strings, it would be nice to create your own _type_ in which you can specify the allowed values: left, up, down, or right. That, in fact, is exactly what Swift's enums allow you to do. Given a specific, finite set of values, you can create your own type, through enums, to ensure that one of those values is always used. Selecting only one of a limited number of possible values is ensured through Swift's type system, so you can never specify an incorrect value (like you can if you just use plain strings).

Creating an enum to specify directions is pretty easy:

```swift
enum Direction {
    case Up
    case Down
    case Left
    case Right
}
```

That looks a bit like a class definition, doesn't it? The main difference is that the type is declared using the `enum` keyword instead of `class`. Furthermore, in the body, the allowed types are specified using the `case` keyword.

This declaration introduces a new type called `Direction`. `Direction` constants and variables can have one of four values: `Up`, `Down`, `Left`, and `Right`. It cannot contain _any_ other values, which ensures that you never use an invalid `Direction` anywhere.

Declaring constants and values of type `Direction` isn't different from any other declaration. Here's how you can declare a constant called `direction1` and assign the `Direction` value `Up`:

```swift
let direction1 = Direction.Up
```

Notice that `direction1` is assigned the value `Direction.Up`. `Direction.Up` is the full name of the `Up` value.

That's a lot to type, so Swift allows a shorthand: If you explicitly declare the type of the constant or variable, you can leave off the enum's name (`Direction`) when assigning that value:

```swift
let direction2: Direction = .Down
```

Since Swift knows `direction2` is of type `Direction`, you can simply assign the value `.Down`.

You can see how this works in the playground file included in this repo. Start creating a constant. You can see as you type `Direction.`, the valid values will pop up in Xcode's autocomplete:

![Enum autocomplete](https://s3.amazonaws.com/learn-verified/enum-autocomplete.png)

<kbd>Option</kbd>-clicking on the constant also shows that the type is inferred to be `Direction`:

![Enum type popup](https://s3.amazonaws.com/learn-verified/enum-type.png)

### Using Enums

Let's rewrite `playerDidMove(_:)` so it takes a `Direction` parameter, instead of a string. Your new function definition might look like this:

```swift
func playerDidMove(direction: Direction) {
    print("Player moved \(direction)")
}
```

That's much less code! Thanks to the `Direction` enum, you _know_ you won't be getting an invalid value. The Swift compiler won't even let you write code that passes an invalid `Direction`.

Calling this function is pretty easy:

```swift
playerDidMove(.Left)
// prints "Player moved Left"
```

Notice, again, that you can just pass `.Left` instead of `Direction.Left`, since Swift knows that the parameter is of type `Direction`.

You can also pass constants and variables of type `Direction` as you'd expect:

```swift
let direction1 = Direction.Up
let direction2: Direction = .Down
var direction3: Direction = .Right

playerDidMove(direction1)
// prints "Player moved Up"
playerDidMove(direction2)
// prints "Player moved Down"
playerDidMove(direction3)
// prints "Player moved Right"
```

### Properties and Methods

Enums can have methods and properties, just like classes. One gotcha, though: Enums can only have _computed_ properties, not stored properties.

Properties and methods on enums can be useful. Imagine you wanted `playerDidMove(_:)` to print a more exciting message, like "Player moved RIGHT!" By default, the string that represents an enum is just the name of the value, but you can add a property to make it look more exciting, like an all-caps version.

Adding a computed property or method to an enum is the same as adding a property or method to a class:

```swift
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
```

The above block of code added a computed property called `excited` to `Direction`. `excited` returns a string that describes the direction in all capitals. Let's break down what that property is doing.

First of all, you should notice that it uses a switch statement to _enumerate_ all the values of the enum (see why it's called an enumeration now?). It switches on `self`, which is the enum value on which the property is being called. The cases of the switch statement are each possible value of the enum. Notice that there isn't a default case: Since the Swift compiler knows what all the possible values of the `Direction` enum are, it also knows that all possible enum values have been accounted for, so a default case is unnecessary and superfluous.

You can then modify `playerDidMove(_:)` to call the `excited` property:

```swift
func playerDidMove(direction: Direction) {
    print("Player moved \(direction.excited)")
}

playerDidMove(.Left)
// prints "Player moved LEFT"
```

Enums are very useful in Swift programming when you have a limited set of values that you want to deal with. Enums introduce a new type, and the Swift compiler will ensure that you only use the possible values of that type.

<a href='https://learn.co/lessons/Enumerations' data-visibility='hidden'>View this lesson on Learn.co</a>
