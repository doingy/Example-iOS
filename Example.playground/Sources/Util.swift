import Foundation

public func description(_ description: String, enable: Bool = true, action: () -> ()) -> Void {
    guard enable else {
        return
    }
    print("\n")
    print("=====\(description) begin =====")
    action()
    print("=====\(description)  end  =====")
}
