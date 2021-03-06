<p align="center" >
  <img src="https://raw.githubusercontent.com/Rifinio/ABObfuscator/develop/Assets/alert-obfuscator-banner.jpg" alt="AlertObfuscator" title="Alert Obfuscator">
</p>

An app that uses an AlertPresenter helper to show Alert controls.
And also includes a XOR Obfuscator to encrypt any type of data.

# How to use AlertPresenter
`AlertPresenter` takes care of showing the alert, you only need to define the actions and call `showAlert`
```swift
// Create alert actions
let action1 = UIAlertAction(title: "Default", style: .default) { _ in
	print("You've pressed default");
}
let action2 = UIAlertAction(title: "Destructive", style: .destructive) { _ in
	print("You've pressed the destructive");
}

// Show the alert
let alertPresenter = AlertPresenter()
alertPresenter.showAlert(from: self, title: "title", message: "message", actions: [action1, action2], completion: nil)
```

# How to use XORObfuscator
A protocol `Obfuscable` contains the contract for any new obfuscating method and only lets the developer to add the implementation specifics.

```swift
protocol Obfuscable {
    var salt: String { get }
    init(salt: String)
    func obfuscate(string: String) -> [UInt8]
    func deobfuscate(key: [UInt8]) -> String
}
```
## Instantiate
```swift
// Create a salt key using a selection of class names so you don't have to risk saving a plain key
let saltKey = "\(String(describing: AppDelegate.self))\(String(describing: NSMutableParagraphStyle.self))"
let obfuscator = XorObfuscator(salt: saltKey)
```

## To Obfuscate a string
```swift
let myString = "hello world"
let encryptedString = obfuscator.obfuscate(string: myString)
```

## To Reveal a string
```swift
let revealedString = obfuscator.deobfuscate(key: encryptedString)
```

# Unit tests
The project contains two test classes `AlertPresenterTests` and `XorObfuscatorTests`

# Demo App
<p align="center" >
  <img src="https://raw.githubusercontent.com/Rifinio/ABObfuscator/master/Assets/demo-alert-obfuscator-gif.gif" alt="AlertObfuscator" title="Alert Obfuscator">
</p>
