import XCTest
import Combine
@testable import Laps

class StopwatchTest: XCTestCase {
    private var subscribers: [AnyCancellable?] = []

    override func tearDown() {
        for subscriber in subscribers {
            subscriber?.cancel()
        }
    }

    func testStart() {
        let stopwatch = Stopwatch()

        stopwatch.start()

        let isRunningExp = expectation(description: "is running should emit")
        subscribers.append(stopwatch.$isRunning.sink { isRunning in
            isRunningExp.fulfill()
        })

        XCTAssertTrue(stopwatch.isRunning)

        let timeExp = expectation(description: "elapsed time should emit")
        subscribers.append(stopwatch.$time.sink { time in
            timeExp.fulfill()
        })

        waitForExpectations(timeout: 10)
    }

    func testStop() {
        let stopwatch = Stopwatch()

        stopwatch.start()
        stopwatch.stop()

        XCTAssertFalse(stopwatch.isRunning)
    }
//
    func testReset() {
        let stopwatch = Stopwatch()

        // test reset when runnin, should not work
        stopwatch.start()
        stopwatch.reset()

        XCTAssertTrue(stopwatch.isRunning)

        // test when not running, ass intended
        stopwatch.stop()
        stopwatch.reset()


        XCTAssertFalse(stopwatch.isRunning)
    }
}
