//
//  ExerciseView.swift
//  Health Scribe Watch App
//
//  Created by Jake Koperski on 5/28/23.
//

import SwiftUI

struct ActiveRoutineView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State var routine: Routine
    @State var exerciseIndex: Int = 0
    @Binding var activeRoutine: Routine?
    
    var currentExercise: Exercise {
        get {
            routine.exercises[exerciseIndex]
        }
    }
    
    var body: some View {
        let exerciseString = "\(currentExercise.sets) × \(currentExercise.reps) × \(currentExercise.weight)"
        let drag = DragGesture().onEnded({ g in
            let newIndex = exerciseIndex - Int(sign(g.translation.width))
            self.exerciseIndex = min(max(0, newIndex), routine.exercises.count - 1)
        })
        print(activeRoutine)
        
        
        return VStack {
            Spacer(minLength: 20)
            VStack {
                Text(currentExercise.name).font(.title.bold())
                Text(exerciseString).font(.title2.bold()).foregroundColor(Color.green)
            }.gesture(drag)
            Spacer(minLength: 10)
            activeRoutine == nil ? AnyView(Button(action: { activeRoutine = routine }) {
                Text("Start").font(.title3.bold())
            }) :
            
            HStack {
                VStack {
                    ButtonTimer(duration: 1 * 60)
                    ButtonTimer(duration: 5 * 60)
                }
                Button(role: .destructive, action: { dismiss() }) {
                        Text("End").font(.title3.bold())
                    }
            }
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    @State static var routine: Routine = Routine(name: "Legs", exercises: [
        Exercise(name: "Squats", sets: 4, reps: 8, weight: 45),
        Exercise(name: "Leg Extensions", sets: 3, reps: 8, weight: 45),
        Exercise(name: "Leg Curls", sets: 3, reps: 8, weight: 45),
        Exercise(name: "Leg Press", sets: 3, reps: 8, weight: 90),
        Exercise(name: "Calf Press", sets: 3, reps: 8, weight: 90)
    ])
    @State static var activeRoutine: Routine?
    
    static var previews: some View {
        ActiveRoutineView(routine: routine, activeRoutine: $activeRoutine)
    }
}
