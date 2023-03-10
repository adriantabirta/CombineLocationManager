# CombineLocationManager

CombineLocationManager - swift `CLLocationManager` & `CLLocationManagerDelegate` exposed as Combine publishers

This package try to solve:

- [x] Avoid system clases that lead to unexpected crashes like `CLBeacon` due to private initializer.
- [x] Replace closures with Combine publishers 
- [x] Ready to use **UseCases** (Clean Arhitecture)
- [x] Public interfaces for mocks
- [] ...

### Swift Package Manager:

```
dependencies: [
    .package(url: "https://github.com/adriantabirta/CombineLocationManager.git", .branch(from: "main"))
]
```
