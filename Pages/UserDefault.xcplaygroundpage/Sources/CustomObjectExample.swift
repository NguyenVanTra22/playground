import UIKit
//Lưu struct User
struct User: Codable {
    let name: String
    let age: Int
}
//Lưu dữ liệu
let userdefault = UserDefaults.standard
let user = User(name: "chuotfx", age: 22)
let encoder = JSONEncoder()
if let encodedUser = try? encoder.encode(user) {
    userdefault.set(encodedUser, forKey: "user")
}
//Đọc dữ liệu
if let savedUserData = userdefault.object(forKey: "user") as? Data {
    let decoder = JSONDecoder()
    if let savedUser = try? decoder.decode(User.self, from: savedUserData) {
        print("Saved user: \(savedUser)")
    }
}
