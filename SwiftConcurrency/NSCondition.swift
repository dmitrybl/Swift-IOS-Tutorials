import UIKit

var state = "ping"
let condition = NSCondition()

class Ping : Thread {
    override func main() {
        while(true) {
            condition.lock()
            while(state != "ping") {
                condition.wait()
            }
            print("ping")
            Thread.sleep(forTimeInterval: 1)
            state = "pong"
            condition.signal()
            condition.unlock()
        }
    }
}

class Pong : Thread {
    override func main() {
        while(true) {
            condition.lock()
            while(state != "pong") {
                condition.wait()
            }
            print("pong")
            Thread.sleep(forTimeInterval: 1)
            state = "ping"
            condition.signal()
            condition.unlock()
        }
    }
}

let pingThread = Ping()
let pongThread = Pong()

pingThread.start()
pongThread.start()


