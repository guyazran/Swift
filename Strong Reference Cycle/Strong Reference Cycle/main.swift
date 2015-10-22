//
//  main.swift
//  Strong Reference Cycle
//
//  Created by Guy Azran on 10/19/15.
//  Copyright © 2015 Guy Azran. All rights reserved.
//

import Foundation

//when two objects that have pointers that point on one another, while there is other reference to them, they will not be deinitialized. this is a strong reference cycle.
//the pointer that points on object a, points to object b, that points to object a... and so on.

class Project{
    var name = "";
    var listOfTasks = [Task]();
    
    deinit{
        print("\(self.name) project is being deinitialized")
    }
    
    func areTasksDone() -> Bool{
        var isDone = true;
        for task in listOfTasks{
            if !task.done{
                isDone = false;
                break;
            }
        }
        return isDone;
    }
    
    func projectComplete(){
        if areTasksDone(){
            print("\(self.name) project is completed");
        }
    }
}

class Task{
    var name = "";
    private var _done = false{
        didSet{
            if let theParent = parent{
                theParent.projectComplete()
            }
        }
    }
    weak var parent:Project?; //a weak variable does not count as a pointer to a project as far as the garbage collector is concerned, thus breaking the reference cycle
    
    var done:Bool{
        get{
            return _done;
        }
    }
    
    deinit{
        print("\(self.name) task is being deinitialized")
    }
    
    func taskCompleted(){
        print("\(self.name) task is complete")
        _done = true;
        
    }
}

var p:Project? = Project();
p!.name = "Cook Dinner";

let taskNames = ["Choose Menu", "Buy Groceries", "Prepare Ingredients", "Cook Food"];

for name in taskNames{
    var t = Task();
    t.name = name;
    t.parent = p;
    p!.listOfTasks.append(t);
}

for task in p!.listOfTasks{
    task.taskCompleted();
}



//the weak variable will allow the project to deinitialize;
p = nil;
print("done");





