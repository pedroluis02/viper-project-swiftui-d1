//
//  SampleBookRepository.swift
//  ViperProjectSwiftUI1
//
//  Created by Pedro Luis on 22/06/23.
//

class SampleBookRepository: BookRepository {
    func getAll() -> [Book] {
        return [
            Book(id: 1, title: "The Pragmatic Programmer", authors: [Author(id: 1, name: "Andrew Hunt"), Author(id: 2, name: "David Thomas")], description: "The Pragmatic Programmer is one of those rare tech books you’ll read, re-read, and read again over the years. Whether you’re new to the field or an experienced practitioner, you’ll come away with fresh insights each and every time."),
            Book(id: 2, title: "Code Complete", authors: [Author(id: 3, name: "Steve McConnell")], description: "Widely considered one of the best practical guides to programming, Steve McConnell’s original CODE COMPLETE has been helping developers write better software for more than a decade. Now this classic book has been fully updated and revised with leading-edge practices—and hundreds of new code samples—illustrating the art and science of software construction."),
            Book(id: 3, title: "Refactoring: Improving the Design of Existing Code", authors: [Author(id: 4, name: "Martin Fowler")], description: "For more than twenty years, experienced programmers worldwide have relied on Martin Fowler’s Refactoring to improve the design of existing code and to enhance software maintainability, as well as to make existing code easier to understand."),
            Book(id: 4, title: "Test Driven Development: By Example", authors: [Author(id: 5, name: "Kent Beck")], description: "Clean code that works--now. This is the seeming contradiction that lies behind much of the pain of programming. Test-driven development replies to this contradiction with a paradox--test the program before you write it."),
            Book(id: 5, title: "Clean Architecture", authors: [Author(id: 6, name: "Robert C. Martin")], description: "Practical Software Architecture Solutions from the Legendary Robert C. Martin (“Uncle Bob”). By applying universal rules of software architecture, you can dramatically improve developer productivity throughout the life of any software system. Now, building upon the success of his best-selling books Clean Code and The Clean Coder, legendary software craftsman Robert C. Martin (“Uncle Bob”) reveals those rules and helps you apply them.")
        ]
    }
}
