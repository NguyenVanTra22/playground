import UIKit
//Tạo đối tượng
let userDefault = UserDefaults.standard
//Đọc 1 key
let data = userDefault.string(forKey: "data") ?? "Empty String"
// Lấy dữ liệu có key là data, nếu không tồn tại thì gán giá trị Empty String cho biến
// Ngoài ra còn có các thuộc tính như .integer(), .bool(), .array()
// Lưu dữ liệu có key là age, tuổi là 22
userDefault.set(22, forKey: "age")
var isDarkModeEnable = true
// Lưu dữ liệu có key là darkModeEnable, giá trị là true
userDefault.set(isDarkModeEnable, forKey: "darkModeEnable")
// Lưu cài đặt của người dùng
let settings = ["wifi": true, "bluetooth": false, "screen_brightness": 50]
userDefault.set(setting, forKey: "userSetting")
