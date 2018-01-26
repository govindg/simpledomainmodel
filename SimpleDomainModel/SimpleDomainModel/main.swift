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
        var newMoney = Money(amount: self.amount * 2, currency: "GBP")
        return newMoney
    case ("USD", "EUR"):
        var newMoney = Money(amount: (3 * self.amount) / 2, currency: "EUR")
        return newMoney
    case ("USD", "CAN"):
        var newMoney = Money(amount: (4 * self.amount) / 5, currency: "CAN")
        return newMoney
    case ("GBP", "USD"):
        var newMoney = Money(amount: self.amount / 2, currency: "USD")
        return newMoney
    case ("EUR", "USD"):
        var newMoney = Money(amount: (2 * self.amount) / 3, currency: "USD")
        return newMoney
    case ("CAN", "USD"):
        var newMoney = Money(amount: (5 * self.amount) / 4, currency: "USD")
        return newMoney
    case ("EUR", "GBP"):
        var newMoney = Money(amount: (3 * self.amount), currency: "GBP")
        return newMoney
    case ("GBP", "EUR"):
        var newMoney = Money(amount: self.amount / 3, currency: "EUR")
        return newMoney
    case ("GBP", "CAN"):
        var newMoney = Money(amount: (self.amount * 5) / 2, currency: "CAN")
        return newMoney
    case ("EUR", "CAN"):
        var newMoney = Money(amount: (self.amount * 5) / 6, currency: "CAN")
        return newMoney
    default:
        return self
    }
  }
  
  public func add(_ to: Money) -> Money {
  }
  public func subtract(_ from: Money) -> Money {
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
  }
  
  open func calculateIncome(_ hours: Int) -> Int {
  }
  
  open func raise(_ amt : Double) {
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
    get { }
    set(value) {
    }
  }
  
  fileprivate var _spouse : Person? = nil
  open var spouse : Person? {
    get { }
    set(value) {
    }
  }
  
  public init(firstName : String, lastName: String, age : Int) {
    self.firstName = firstName
    self.lastName = lastName
    self.age = age
  }
  
  open func toString() -> String {
  }
}

////////////////////////////////////
// Family
//
open class Family {
  fileprivate var members : [Person] = []
  
  public init(spouse1: Person, spouse2: Person) {
  }
  
  open func haveChild(_ child: Person) -> Bool {
  }
  
  open func householdIncome() -> Int {
  }
}





