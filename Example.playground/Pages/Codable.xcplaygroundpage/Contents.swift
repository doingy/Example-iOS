import Foundation

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
    return formatter
}()

description("Example Decode") {
    // 一般情况
    struct Response<T: Decodable>: Decodable, CustomStringConvertible {
        let status: Int
        let message: String?
        let data: T?
        
        enum CodingKeys: String, CodingKey {
            case status
            case message
            case data
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            status = try container.decode(Int.self, forKey: .status)
            message = try container.decodeIfPresent(String.self, forKey: .message)
            data = try container.decodeIfPresent(T.self, forKey: .data)
        }
        
        var description: String {
            return "{status: \(status), message: \(String(describing: message)), data: \(String(describing: data))}"
        }
    }
    
    do {
        let example1 = """
        {"status":200, "message":null, "data":"is string data"}
        """
        let resp1 = try JSONDecoder().decode(Response<String>.self, from: example1.data(using: .utf8)!)
        print("\(resp1)")
        
        let example2 = """
        {"status": 401, "message": "Auth failed", "data": null}
        """
        let resp2 = try JSONDecoder().decode(Response<String>.self, from: example2.data(using: .utf8)!)
        print("\(resp2)")
        
        let example3 = """
        {
            "status":200,
            "message":null,
            "data": ["A", "B", "C", "D"]
        }
        """
        let resp3 = try JSONDecoder().decode(Response<[String]>.self, from: example3.data(using: .utf8)!)
        print("\(resp3)")
        
        let example4 = "{\"status\":200,\"message\":null,\"data\":[{\"name\":\"Eric\",\"tel\":18888888888,\"enrollment_time\":1635136842,\"score\":\"[{\\\"subject\\\":\\\"Math\\\",\\\"score\\\":100},{\\\"subject\\\":\\\"Art\\\",\\\"score\\\":90}]\",\"other\":\"\"},{\"name\":\"Eric\",\"enrollment_time\":1635116842,\"score\":\"\",\"other\":\"\"}]}"

        struct Student: Decodable, CustomStringConvertible {
            let name: String
            let tel: String?
            let enrollmentTime: Date
            let scores: [Score]
            
            enum CodingKeys: String, CodingKey {
            case name
            case enrollmentTime = "enrollment_time"
            case tel
            case scores = "score"
            }
            
            init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                name = try container.decode(String.self, forKey: .name)
                if let temp = try container.decodeIfPresent(Int.self, forKey: .tel) {
                    tel = "\(temp)"
                } else {
                    tel = nil
                }
                
                // 日期，手动解析，JSONDecoder 不需要额外配置
//                let timeInterval = try container.decode(Double.self, forKey: .enrollmentTime)
//                enrollmentTime = Date(timeIntervalSince1970: timeInterval)
                
                // 日期，自动解析，JSONDecoder 需要配置日期格式
                // decoder.dateDecodingStrategy = .secondsSince1970
                enrollmentTime = try container.decode(Date.self, forKey: .enrollmentTime)
                
                let score = try container.decode(String.self, forKey: .scores)
                if score.count > 0 {
                    scores = try JSONDecoder().decode([Score].self, from: score.data(using: .utf8)!)
                } else {
                    scores = []
                }
            }
            
            var description: String {
                let date = dateFormatter.string(from: enrollmentTime)
                return "{name: \(name), tel: \(String(describing: tel)), enrollment_time: \(date), scores: \(scores)}"
            }
        }
        
        struct Score: Decodable, CustomStringConvertible {
            let subject: String
            let score: Double
            
            var description: String {
                "{subject: \(subject), score:\(score)}"
            }
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let resp4 = try decoder.decode(Response<[Student]>.self, from: example4.data(using: .utf8)!)
        print("\(resp4)")
        
    } catch {
        print("\(error)")
    }
} // end of Example Decode
