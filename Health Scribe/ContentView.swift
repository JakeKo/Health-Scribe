//
//  ContentView.swift
//  Health Scribe
//
//  Created by Jake Koperski on 5/27/23.
//

import SwiftUI

struct ContentView: View {
    @State var routines: [Routine]
    @State private var currentDate = Date()
    
    var currentRoutine: Routine? {
        get {
            routines.first(where: { isSameDay(date1: $0.date, date2: currentDate) })
        }
    }
    
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        let m1 = calendar.component(.month, from: date1)
        let m2 = calendar.component(.month, from: date2)
        let d1 = calendar.component(.day, from: date1)
        let d2 = calendar.component(.day, from: date2)
        
        return m1 == m2 && d1 == d2
    }
    
    var body: some View {
        VStack {
            Text("Workouts").font(.title)
            DatePicker(
                "Start Date",
                selection: $currentDate,
                displayedComponents: [.date]
            ).datePickerStyle(.graphical)
            
            currentRoutine == nil
                ? AnyView(List(routines, id: \.name) { r in
                    NavigationLink(r.name, value: r)
                })
            : AnyView(Text(currentRoutine!.name))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    @State static var routines: [Routine] = [
        Routine(name: "Legs", date: Date(), exercises: [
            Exercise(name: "Squats", sets: 4, reps: 8, weight: 115),
            Exercise(name: "Leg Extensions", sets: 3, reps: 8, weight: 45),
            Exercise(name: "Leg Curls", sets: 3, reps: 8, weight: 45),
            Exercise(name: "Leg Press", sets: 3, reps: 8, weight: 180),
            Exercise(name: "Calf Press", sets: 3, reps: 8, weight: 180)
        ]),
        Routine(name: "Biceps", date: Date(), exercises: [
            Exercise(name: "Lat Pulldown", sets: 4, reps: 8, weight: 100),
            Exercise(name: "Barbell Row", sets: 4, reps: 12, weight: 55),
            Exercise(name: "Barbell Curl", sets: 3, reps: 8, weight: 55),
            Exercise(name: "Preacher Curl", sets: 3, reps: 8, weight: 20),
            Exercise(name: "Hammer Curl", sets: 3, reps: 8, weight: 20),
            Exercise(name: "Dumbbell Shrug", sets: 3, reps: 12, weight: 25)
        ]),
        Routine(name: "Core", date: Date(), exercises: [
            Exercise(name: "Deadlift", sets: 3, reps: 8, weight: 85),
            Exercise(name: "Kettlebell Swing", sets: 3, reps: 12, weight: 45),
            Exercise(name: "Ab Wheel", sets: 3, reps: 8, weight: 0),
            Exercise(name: "Back Extension", sets: 3, reps: 8, weight: 25),
            Exercise(name: "Russian Twist", sets: 4, reps: 12, weight: 15)
        ]),
        Routine(name: "Triceps", date: Date(), exercises: [
            Exercise(name: "Bench Press", sets: 4, reps: 8, weight: 105),
            Exercise(name: "Incline Press", sets: 4, reps: 8, weight: 65),
            Exercise(name: "Tricep Pulldown", sets: 3, reps: 8, weight: 65),
            Exercise(name: "Decline Cable", sets: 3, reps: 8, weight: 60),
            Exercise(name: "Incline Cable", sets: 3, reps: 8, weight: 60),
            Exercise(name: "Pushups", sets: 3, reps: 8, weight: 0),
            Exercise(name: "Arnold Press", sets: 3, reps: 8, weight: 20)
        ]),
    ]

    static var previews: some View {
        ContentView(routines: routines)
    }
}
