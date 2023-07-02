//
//  Health_ScribeApp.swift
//  Health Scribe
//
//  Created by Jake Koperski on 5/27/23.
//

import SwiftUI

struct Exercise {
    var name: String
    var sets: Int
    var reps: Int
    var weight: Int
}

struct Routine : Hashable {
    var name: String
    var date: Date
    var exercises: [Exercise]

    static func == (lhs: Routine, rhs: Routine) -> Bool {
        return lhs.name == rhs.name && lhs.date == rhs.date
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(date)
    }
}

struct CompletedRoutine {
    var originalRoutine: Routine
    var duration: Int
    var startTime: Date
    var notes: String
    var difficulty: Int
    var attitude: Int
}

@main
struct Health_ScribeApp: App {
    @State var routines: [Routine] = [
        Routine(name: "Legs", date: Date(), exercises: [
            Exercise(name: "Squats", sets: 4, reps: 8, weight: 45),
            Exercise(name: "Leg Extensions", sets: 3, reps: 8, weight: 45),
            Exercise(name: "Leg Curls", sets: 3, reps: 8, weight: 45),
            Exercise(name: "Leg Press", sets: 3, reps: 8, weight: 90),
            Exercise(name: "Calf Press", sets: 3, reps: 8, weight: 90)
        ]),
        Routine(name: "Biceps", date: Date(), exercises: [
            Exercise(name: "Lat Pulldown", sets: 4, reps: 12, weight: 90),
            Exercise(name: "Barbell Row", sets: 4, reps: 12, weight: 55),
            Exercise(name: "Barbell Curl", sets: 3, reps: 8, weight: 55),
            Exercise(name: "Preacher Curl", sets: 3, reps: 8, weight: 20),
            Exercise(name: "Hammer Curl", sets: 3, reps: 8, weight: 20),
            Exercise(name: "Dumbbell Shrug", sets: 3, reps: 12, weight: 25)
        ]),
        Routine(name: "Core", date: Date(), exercises: [
            Exercise(name: "Deadlift", sets: 3, reps: 8, weight: 85),
            Exercise(name: "Kettlebell Swing", sets: 3, reps: 8, weight: 20),
            Exercise(name: "Ab Wheel", sets: 3, reps: 8, weight: 0),
            Exercise(name: "Back Extension", sets: 3, reps: 8, weight: 25),
            Exercise(name: "Russian Twist", sets: 3, reps: 8, weight: 15)
        ]),
        Routine(name: "Triceps", date: Date(), exercises: [
            Exercise(name: "Bench Press", sets: 4, reps: 8, weight: 95),
            Exercise(name: "Incline Press", sets: 4, reps: 8, weight: 65),
            Exercise(name: "Tricep Pulldown", sets: 3, reps: 8, weight: 65),
            Exercise(name: "Bench Dips", sets: 3, reps: 5, weight: 0),
            Exercise(name: "Arnold Press", sets: 3, reps: 8, weight: 20)
        ]),
    ]
    
    var body: some Scene {
        WindowGroup {
            ContentView(routines: routines)
        }
    }
}
