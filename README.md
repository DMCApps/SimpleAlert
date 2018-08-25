# Introduction

`SimpleAlert` is a very light weight, simplified version of iOS `UIAlertController` and `UIAlertAction`. These two Classes are clunky and lead to lengthy code. This library is intended to clean up the implementation and improve readability.

# Current Implementation

iOS current implementation using `UIAlertController` and `UIAlertAction` you end up with this lengthy code for something simple.

```
let alert = UIAlertController(title: "Old Alert", message: "This is an old style alert.", preferredStyle: .alert)

alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

present(alert, animated: true, completion: nil)
```

# SimpleAlert Implementation

The above's equivalent with Simple alert

```
self.alert.with(
    .title("New Alert"),
    .message("This is a new style Alert."),
    .action(.default("OK"), nil),
    .action(.cancel("Cancel"), nil)
)
.show()
```

# SimpleAlert Advanced

`SimpleAlert` helps to solve some problems that other libraries have. `SimpleAlert` doesn't use a wrapper around `UIAlertController`, but is a `UIAlertController` directly.

You can call `build()` and grab the `UIAlertController` directly.

```
let uiAlertController = self.alert.with(
        .title("New Alert"),
        .message("This is a new style Alert."),
        .action(.default("OK"), nil),
        .action(.cancel("Cancel"), nil)
    )
    .build()
```

If statements have always been annoying to use with the Builder Pattern that other alert helpers use and leads to weird looking code to resolve warnings with "Result of call to 'function' is unused". You can solve this by using `_ = builder.function()`

```
let alertBuilder = self.alert.with(
    .title("New Alert"),
    .message("This is a new style Alert.")
)

if numberOfButtons > 0 {
    _ = alertBuilder.with(.action(.default("Option 1"), { _ in
        self.didClickOption1()
    }))
}

if numberOfButtons > 1 {
    _ = alertBuilder.with(.action(.default("Option 2"), { _ in
        self.didClickOption2()
    }))
}

if numberOfButtons > 2 {
    _ = alertBuilder.with(.action(.destructive("Option 3"), { _ in
        self.didClickOption3()
    }))
}

_ = alertBuilder.with(.action(.cancel("Cancel"), nil))

alertBuilder.show()
```

or you can use the build in `.if` and `.ifelse` which and can be chained together

```
self.alert.with(
    .title("New Alert"),
    .message("This is a new style Alert."),
    .if(numberOfButtons > 0, .action(.default("Option 1"), { _ in
        self.didClickOption1()
    })),
    .if(numberOfButtons > 1, .action(.default("Option 2"), { _ in
        self.didClickOption2()
    })),
    .if(numberOfButtons > 2, .action(.destructive("Option 3"), { _ in
        self.didClickOption3()
    })),
    .action(.cancel("Cancel"), nil)
)
.show()
```
