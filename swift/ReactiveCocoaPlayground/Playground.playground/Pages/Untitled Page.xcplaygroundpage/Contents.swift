//: Playground - noun: a place where people can play

import ReactiveCocoa
import ReactiveSwift
import Result

let (_signal, observer) = Signal<String, NoError>.pipe()

let (s, _) = Signal<[Int], NoError>.pipe()

let poge = _signal
  .producer
  .flatMap(FlattenStrategy.merge) { (v) in
    SignalProducer<String, NoError>.init({ (o, l) in
      o.send(value: "")
      o.sendCompleted()
    })
}

do {
  let p = poge
    .map {
      $0 + "hoge"
    }
    .producer

//  observer.send(value: "aa")
//
  p.start { (e) in
    print(e)
  }
//
//  p.start { (e) in
//    print(e)
//  }

}

do {

  let a = _signal
    .map {
      $0 + "Singal"
  }

  a.observe { e in
    print(e)
  }

  a.observeValues({ (v) in
    print(v)
  })

  a.observe { e in
    print(e)
  }
}

Property<Int>.init(value: 10)

observer.send(value: "hoge")

