import Dispatch
// Custom queue
let queue1 = DispatchQueue(label: "queue 1", qos: .userInitiated)
let queue2 = DispatchQueue(label: "queue 2", qos: .userInitiated)
queue1.async {
    for i in 0...10 {
        print("🔴", i)
    }
}

queue2.async {
    for i in 0...10 {
            print("🔶", i)
        }
}
