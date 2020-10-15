//
//  ViewController.swift
//  Clock
//
//  Created by Shailesh Aher on 14/10/20.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var timeLabel: NSTextField!
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timeLabel.stringValue = "Test"
        timeLabel.font = NSFont.boldSystemFont(ofSize: 100)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateLabel), userInfo: nil, repeats: true)
        timer?.fire()
    }
    
    @objc func updateLabel() {
        let date = Date()
        let components = Calendar.current.dateComponents([.hour, .minute, .second], from: date)
        let hour =  (components.hour ?? 0).twoDigitValue()
        let min = (components.minute ?? 0).twoDigitValue()
        let seconds = (components.second ?? 0).twoDigitValue()
        timeLabel.stringValue = "\(hour):\(min):\(seconds)"
    }

    override var representedObject: Any? {
        didSet {
        
        }
    }
}

extension Int {
    func twoDigitValue() -> String {
        return self < 10 ? "0\(self)" : self.description
    }
}
