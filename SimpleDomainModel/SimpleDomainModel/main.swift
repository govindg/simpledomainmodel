    //
//  main.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import Foundation

print("Hello, World!")

public func testMe() -> String {
  return "I have been tested"
}

open class TestMe {
  open func Please() -> String {
    return "I have been tested"
  }
}

////////////////////////////////////
// Money
//
public struct Money {
  public var amount : Int
  public var currency : String
  
  public func convert(_ to: String) -> Money {
    if to == self.currency {
        return self
    }
    switch (self.currency, to) {
    case ("USD", "GBP"):
        let newMoney = Money(amount: self.amount / 2, currency: "GBP")
        return newMoney
    case ("USD", "EUR"):
        let newMoney = Money(amount: (3 * self.amount) / 2, currency: "EUR")
        return newMoney
    case ("USD", "CAN"):
        let newMoney = Money(amount: (5 * self.amount) / 4, currency: "CAN")
        return newMoney
    case ("GBP", "USD"):
        let newMoney = Money(amount: self.amount * 2, currency: "USD")
        return newMoney
    case ("EUR", "USD"):
        let newMoney = Money(amount: (2 * self.amount) / 3, currency: "USD")
        return newMoney
    case ("CAN", "USD"):
        let newMoney = Money(amount: (4 * self.amount) / 5, currency: "USD")
        return newMoney
    case ("EUR", "GBP"):
        let newMoney = Money(amount: (3 * self.amount), currency: "GBP")
        return newMoney
    case ("GBP", "EUR"):
        let newMoney = Money(amount: self.amount / 3, currency: "EUR")
        return newMoney
    case ("GBP", "CAN"):
        let newMoney = Money(amount: (self.amount * 5) / 2, currency: "CAN")
        return newMoney
    case ("EUR", "CAN"):
        let newMoney = Money(amount: (self.amount * 5) / 6, currency: "CAN")
        return newMoney
    case ("CAN", "GBP"):
        let newMoney = Money(amount: (self.amount * 5) / 2, currency: "GBP")
        return newMoney
    case ("CAN", "EUR"):
        let newMoney = Money(amount: (self.amount * 6) / 5, currency: "EUR")
        return newMoney
    default:
        return self
    }
  }
  
  public func add(_ to: Money) -> Money {
    let converted = self.convert(to.currency)
    return Money(amount: to.amount + converted.amount, currency: to.currency)
  }
  public func subtract(_ from: Money) -> Money {
    let converted = self.convert(from.currency)
    return Money(amount: from.amount - converted.amount, currency: from.currency)
  }
}

////////////////////////////////////
// Job
//
open class Job {
  fileprivate var title : String
  fileprivate var type : JobType

  public enum JobType {
    case Hourly(Double)
    case Salary(Int)
  }
  
  public init(title : String, type : JobType) {
    self.title = title
    self.type = type
  }
  
  open func calculateIncome(_ hours: Int) -> Int {
    switch self.type {
    case .Hourly(let h):
        return Int(h * Double(hours))
    case .Salary(let sal):
        return sal
    }
  }
  
  open func raise(_ amt : Double) {
    switch self.type {
    case .Hourly(let h):
        self.type = .Hourly(h + amt)
    case .Salary(let sal):
        self.type = .Salary(sal + Int(amt))
    }
  }
}

////////////////////////////////////
// Person
//
open class Person {
  open var firstName : String = ""
  open var lastName : String = ""
  open var age : Int = 0

  fileprivate var _job : Job? = nil
  open var job : Job? {
    get {
        return self._job
    }
    set(value) {
        if self.age <= 21 {
            self._job = nil
        } else {
            self._job = value
        }
    }
  }
  
  fileprivate var _spouse : Person? = nil
  open var spouse : Person? {
    get {
        return self._spouse
    }
    set(value) {
        if (age <= 21) {
            self._spouse = nil
        } else {
            self._spouse = value
        }
    }
  }
  
  public init(firstName : String, lastName: String, age : Int) {
    self.firstName = firstName
    self.lastName = lastName
    self.age = age
  }
  
  open func toString() -> String {
    return "[Person: firstName:\(self.firstName) lastName:\(self.lastName) age:\(self.age) job:\(self.job) spouse:\(self.spouse)]"
  }
}

////////////////////////////////////
// Family
//
open class Family {
  fileprivate var members : [Person] = []
  
  public init(spouse1: Person, spouse2: Person) {
    if spouse1.spouse != nil || spouse2.spouse != nil {
        return
    }
    spouse1.spouse = spouse2
    spouse2.spouse = spouse1
    members.append(spouse1)
    members.append(spouse2)
  }
  
  open func haveChild(_ child: Person) -> Bool {
    if members[0].age > 21 || members[1].age > 21 {
        members.append(child)
        return true
    }
    return false
  }
  
  open func householdIncome() -> Int {
    var totalIncome : Int = 0
    for m in members {
        if m.job != nil {
            totalIncome += (m.job?.calculateIncome(2000))!
        }
    }
    return totalIncome
  }
}





