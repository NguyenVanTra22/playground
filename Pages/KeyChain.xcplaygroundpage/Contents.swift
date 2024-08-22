import UIKit
import Security
//Thêm Item
//Function SecItemAdd sẽ trả về một OSStatus.Nếu giá trị trả về là 0 hoặc errSecSuccess tức là bạn đã thêm item mới thành công
let query = [
    kSecValueData: "FxStudio".data(using: .utf8)!,
    kSecClass: kSecClassGenericPassword
] as CFDictionary
let status = SecItemAdd(query, nil)
print("Status: \(status)")

//Lấy item vừa thêm
let query = [
    kSecValueData: "hello_keychain".data(using: .utf8)!,
    kSecAttrAccount: "chuotfx1",
    kSecAttrServer: "fxstudio.dev",
    kSecClass: kSecClassInternetPassword,
    kSecReturnAttributes: true //để nhận lại đầy đủ các thuộc tính của Item lưu trong KeyChain
] as CFDictionary
var ref: AnyObject?
let status = SecItemAdd(query, &ref) //& để khai báo con trỏ tới biến
print("Status: \(status)")
print("Result:")
let result = ref as! NSDictionary //ta sẽ ép kiểu ref về một NSDictionary
result.forEach { key, value in
    print("\(key) : \(value)")
}

//kSecReturn
//kSecReturnRef: Khi được gán là true, kết quả sẽ trỏ đến SecKeychainItem, SecKey, SecCertificate, SecIdentity hoặc CFData,
let query = [
  kSecValueData: "abcd1234".data(using: .utf8)!,
  kSecAttrAccount: "admin",
  kSecAttrServer: "fxstudio.dev",
  kSecClass: kSecClassInternetPassword,
  kSecReturnData: true, //sẽ trả về dữ liệu nhạy cảm thực tế được lưu trữ trong keychain.
  kSecReturnAttributes: true //sẽ trả về tất cả các thuộc tính được sử dụng để tạo Item trong CFDictionary.
] as CFDictionary
var ref: AnyObject?
let status = SecItemAdd(query, &ref)
let result = ref as! NSDictionary
print("Operation finished with status: \(status)")
print("Username: \(result[kSecAttrAccount] ?? "")")
let passwordData = result[kSecValueData] as! Data
let passwordString = String(data: passwordData, encoding: .utf8)
print("Password: \(passwordString ?? "")")

//Update Items
let query = [
  kSecClass: kSecClassInternetPassword, //xác định các item có Item Class là kSecClassInternetPassword
  kSecAttrServer: "fxstudio.dev", //xác định domain cụ thể là fxstudio.dev
  kSecAttrAccount: "admin" //xác định tài khoản mà chúng ta muốn cập nhật password là admin
] as CFDictionary
let updateFields = [
  kSecValueData: "admin".data(using: .utf8)! //chứa dữ liệu dùng để cập nhật cho data đang lưu trong KeyChain
] as CFDictionary
let status = SecItemUpdate(query, updateFields)
print("Operation finished with status: \(status)")

//Delete Items
let query = [
  kSecClass: kSecClassInternetPassword,
  kSecAttrServer: "fxstudio.dev",
  kSecAttrAccount: "admin"
  //Nếu bạn không cung cấp kSecAttrAccount trong query, thì mọi tài khoản của máy chủ có tên fxstudio.dev lưu trong KeyChain sẽ bị xóa
] as CFDictionary
SecItemDelete(query)
