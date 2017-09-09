/*:
 # RxSwift
 #### Is the implementation of Rx concepts in Swift.
 
 > pod 'RxSwift',    '~> 3.0'

 # RxCocoa
 #### Helps in making Cocoa APIs used in iOS and macOS easier to use with reactive techniques.
 
 > pod 'RxCocoa',    '~> 3.0'
 */
import RxSwift
//import RxCocoa

playgroundShouldContinueIndefinitely()

example("Intro") {
    // Thread safe bag that disposes added disposables on deinit.
    let disposeBag = DisposeBag()
    
    var numbers = Variable(700)
    
    numbers.asObservable()
        .filter { value in
            return value > 200
        }
        //.debug()
        .map{ value in
            return "$\(value)"
        }
        .subscribe(
            onNext: { value in
                print(value)
        },
            onError: { error in
                print(error)
        },
            onCompleted: {
                print("Completed")
        },
            onDisposed: {
                print("Disposed")
        })
    //.disposed(by: disposeBag)
    
    
//        delay(2.0, closure: {
//            numbers.value = 300
//            numbers.value = 500
//        })
}

example("merge") {
    let disposeBag = DisposeBag()
    
    let subject1 = Variable("S1") //PublishSubject<String>()
    let subject2 = Variable("S2") //PublishSubject<String>()
    
    
    Observable.of(subject1.asObservable(), subject2.asObservable())
        .merge()
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
    
    subject1.value = "🅰️"
    
    subject1.value = ("🅱️")
    
    subject2.value = ("①")
    
    subject2.value = ("②")
    
    subject1.value = "🆎"
    
    subject2.value = "③"
}
//// Calculator buttons example
//
//example("combineLatest") {
//    let disposeBag = DisposeBag()
//    
//    let stringSubject = Variable("ABC")
//    let intSubject = Variable(123)
//    
//    Observable.combineLatest(stringSubject.asObservable(), intSubject.asObservable()) { stringElement, intElement in
//        "\(stringElement) \(intElement)"
//        }
//        .subscribe(onNext: { print($0) })
//        .disposed(by: disposeBag)
//    
//    stringSubject.value = "🅰️"
//    
//    stringSubject.value = "🅱️"
//    intSubject.value = 1
//    
//    intSubject.value = 2
//    
//    stringSubject.value = "🆎"
//}
// Login example


//: > A very good resource to analyze and under stand these tansformations is rxmarbles.com

//: > For more examples of swift implementation of these trandormations, refer the Rx Playground in the RxSwift Repository
