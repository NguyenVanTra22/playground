import Foundation

//Để thiết lập các giá trị mặc định, tránh việc phải kiểm tra xem key đó có tồn tại không, đối tượng lưu trữ có tồn tại không, thì ta sẽ sử dụng phương thức register()
let userDefaults = UserDefaults.standard
userDefaults.set(false, forKey: "enabledSound") // 1
userDefaults.register(
    defaults: [
        "enabledSound": true, // 2
        "enabledVibration": true
    ]
)
userDefaults.bool(forKey: "enabledSound") // false
