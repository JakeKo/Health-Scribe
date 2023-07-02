//
//  WorkoutView.swift
//  Health Scribe Watch App
//
//  Created by Jake Koperski on 5/27/23.
//

import SwiftUI

struct WorkoutView: View {
    @State var routine: Routine
    @Binding var activeRoutineName: String?
    
    func updateActiveRoutineName() {
        activeRoutineName = routine.name
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(routine.name).font(.title2)
                Spacer(minLength: 10)
                Button(action: updateActiveRoutineName) {
                    Text("Start").foregroundColor(Color.green)
                }
            }
            List(routine.exercises, id: \.name) { e in
                Text(e.name)
            }
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    @State static var routine = Routine(name: "Legs", exercises: [
        Exercise(name: "Squats", sets: 4, reps: 8, weight: 45),
        Exercise(name: "Leg Extensions", sets: 3, reps: 8, weight: 45),
        Exercise(name: "Leg Curls", sets: 3, reps: 8, weight: 45),
        Exercise(name: "Leg Press", sets: 3, reps: 8, weight: 90),
        Exercise(name: "Calf Press", sets: 3, reps: 8, weight: 90)
    ])
    @State static var activeRoutineName: String? = nil
    
    static var previews: some View {
        WorkoutView(routine: routine, activeRoutineName: $activeRoutineName)
    }
}
