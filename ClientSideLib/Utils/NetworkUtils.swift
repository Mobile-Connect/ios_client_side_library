import Foundation

class NetworkUtils {
    // use this code if you need to get the Ip address
    static func getIPAddress() -> String? {
        var address: String?
//        var ifaddr: UnsafeMutablePointer<ifaddrs>? = nil
//        if getifaddrs(&ifaddr) == 0 {
//            var ptr = ifaddr
//            while ptr != nil {
//                defer { ptr = ptr?.pointee.ifa_next }
//                let interface = ptr?.pointee
//                let addrFamily = interface?.ifa_addr.pointee.sa_family
//                if addrFamily == UInt8(AF_INET) {
//                    if let name: String = String(cString: (interface?.ifa_name)!), name == AddrType.wifi.rawValue {
//                        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
//                        getnameinfo(interface?.ifa_addr, socklen_t((interface?.ifa_addr.pointee.sa_len)!), &hostname, socklen_t(hostname.count), nil, socklen_t(0), NI_NUMERICHOST)
//                        address = String(cString: hostname)
//                        break
//                    }
//                    if let name: String = String(cString: (interface?.ifa_name)!), name == AddrType.cellular.rawValue {
//                        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
//                        getnameinfo(interface?.ifa_addr, socklen_t((interface?.ifa_addr.pointee.sa_len)!), &hostname, socklen_t(hostname.count), nil, socklen_t(0), NI_NUMERICHOST)
//                        address = String(cString: hostname)
//                        break
//                    }
//                }
//            }
//            freeifaddrs(ifaddr)
//        }
        return address
    }
}
