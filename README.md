# CombineLocationManager

CombineLocationManager - swift `CLLocationManager` & `CLLocationManagerDelegate` exposed as Combine publishers

[read medium post about](https://medium.com/@adriantabirta_80636/ios-cllocationmanager-well-done-4d8c1e8185f9)

This package try to solve:

- [x] Avoid system clases that lead to unexpected crashes like `CLBeacon` due to private initializer.
- [x] Replace closures with Combine publishers 
- [x] Ready to use **UseCases** (Clean Arhitecture)
- [x] Public interfaces for mocks
- [x] Generic methods & protocols
- [ ] Test coverage (partial)


## Instalation
### Swift Package Manager:
```
dependencies: [
    .package(url: "https://github.com/adriantabirta/CombineLocationManager.git", .branch(from: "main"))
]
```


## Usage
### Combinse stream of locations example
1. Create own domain model & conform it to already defined protocol, in this case SystemLocation
```swift
import CombineLocationManager

struct CoordinateDomainModel: SystemCoordinate {

    private(set) var latitude: Double
    
    private(set) var longitude: Double
    
    init() {
        latitude = .zero
        longitude = .zero
    }
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

struct LocationDomainModel: SystemLocation {
    
    typealias Coordinate = CoordinateDomainModel
    
    var horizontalAccuracy: Double
    
    var direction: Double
    
    var timestamp: Date
    
    var coordinate: SystemCoordinateStub
    
    init() {
        self.horizontalAccuracy = .zero
        self.direction = .zero
        self.timestamp = .init()
        self.coordinate = .init()
    }
    
    init(coordinate: SystemCoordinateStub, horizontalAccuracy: Double, direction: Double, timestamp: Date) {
        self.horizontalAccuracy = horizontalAccuracy
        self.direction = direction
        self.timestamp = timestamp
        self.coordinate = coordinate
    }
}
```

2. Use into your domain usecase like:
```swift
func locationStream() {

    let stream = RealSystemGetLocationsStreamUseCase()

    (stream.execute() as AnyPublisher<[LocationDomainModel], Error>)
        .map { ... }
        .sink({ ... })
        .store(in: &cancellables)
}
```

## Contribution
This repo is in active development state, so feel free to open PR, issues & missing features.
Future SPM targets that may be useful:
* LocationManagerAsync - for async await 
* LocationManagerRx - for RxSwift

