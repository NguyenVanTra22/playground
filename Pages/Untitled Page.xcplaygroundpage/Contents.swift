import UIKit
import Security

let query = [
  kSecValueData: "abcd1234".data(using: .utf8)!,
  kSecAttrAccount: "admin",
  kSecAttrServer: "fxstudio.dev",
  kSecClass: kSecClassInternetPassword,
  kSecReturnData: true,
  kSecReturnAttributes: true
] as CFDictionary
var ref: AnyObject?
let status = SecItemAdd(query, &ref)
let result = ref as! NSDictionary
print("Operation finished with status: \(status)")
print("Username: \(result[kSecAttrAccount] ?? "")")
let passwordData = result[kSecValueData] as! Data
let passwordString = String(data: passwordData, encoding: .utf8)
print("Password: \(passwordString ?? "")")
