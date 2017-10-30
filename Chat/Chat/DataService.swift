//
//  DataService.swift
//  Chat
//
//  Created by Aditya Verma on 29/09/17.
//  Copyright © 2017 Aditya Verma. All rights reserved.
//

import Foundation
import Kanna
import Alamofire
import HTMLString

class DataService {
    static public let instance = DataService()
    
    private var username: String!
    private var password: String!
    private var cookies: HTTPCookie!
    
    private var headers: HTTPHeaders = [
        "host": "amizone.net",
        "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36",
        "Content-Type": "application/x-www-form-urlencoded",
        "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
        "Accept-Language": "en-US,en;q=0.5",
        "Accept-Encoding": "gzip, deflate, br",
        "Referer": "https://amizone.net/amizone/",
        "Connection": "keep-alive"
    ]
   
    
    
    public func amizoneConnector(username: String, password: String) -> Void {
        self.username = username
        self.password = password
        Alamofire.request("https://amizone.net/amizone/index.aspx").responseString { response in
            if let html = response.result.value {
                self.parseHTML(html: html)
                let headerFields = response.response?.allHeaderFields as? [String: String],
                link = response.request?.url
                if headerFields != nil {
                    let cookies = HTTPCookie.cookies(withResponseHeaderFields: headerFields!, for: link!)
                    for cookie in cookies {
                        let name = cookie.name
                        if name == "ASP.NET_SessionId" {
                            self.headers["Cookie"] = cookie.name + "=" + cookie.value
                        }
                    }
                }
            }
        }
    }
    
    private func parseHTML(html: String) -> Void {
        var loginData = Dictionary<String, String>()
        loginData["__EVENTTARGET"] = ""
        loginData["__EVENTARGUMENT"] = ""
        var credentials = [String]()
        if let doc = Kanna.HTML(html: html, encoding: String.Encoding.utf8) {
            for show in doc.css("input") {
                loginData[show["name"]!] = ""
            }
            
            for word in doc.css("input[id='__VIEWSTATEGENERATOR']") {
                loginData.updateValue(word["value"]!, forKey: "__VIEWSTATEGENERATOR")
            }
            
            for word in doc.css("input[id='__VIEWSTATE']") {
                loginData.updateValue(word["value"]!, forKey: "__VIEWSTATE")
            }
            
            for word in doc.css("input[id^='__EVENTVALIDATION']") {
                let hash = word["value"]!
                
                loginData.updateValue(hash, forKey: "__EVENTVALIDATION")
            }

            
            for form in doc.xpath("//div[@class='form-elements']/input") {
                if form["style"] == nil {
                    credentials.append(form["name"]!)
                }
            }
            loginData.updateValue(self.username, forKey: credentials[0])
            loginData.updateValue(self.password, forKey: credentials[1])
            loginData.removeValue(forKey: "ImgBttn_Login")
            loginData.removeValue(forKey: "Remember Me")
            loginData["ImgBttn_Login.x"] = "0"
            loginData["ImgBttn_Login.y"] = "0"
        }
        initLogin(loginData: loginData)
    }
    
    private func initLogin(loginData: Dictionary<String, String>) -> Void {
//            if let doc = Kanna.HTML(html: response.result.value!, encoding: String.Encoding.utf8) {
//                for show in doc.xpath("//span[@id='ctl00_lblUser']") {
//                    print(show.text!)
//                }
//            }
//        }
        
        Alamofire.request("https://amizone.net/amizone/Index.aspx/", method: .post, parameters: loginData, headers: self.headers).response { response in
            let cookie = String(describing: response)
            let lowerIndex = cookie.range(of: "UserId=")?.upperBound
            let higherIndex = cookie.range(of: "; path=/")?.lowerBound
            let range = Range(uncheckedBounds: (lower: lowerIndex!, upper: higherIndex!))
            self.headers["Cookie"] = self.headers["Cookie"]! + "; UserId=" + cookie[range] + ";"
            
            self.listOfCourse()
        }
    }
    
    private func listOfCourse() {
        Alamofire.request("https://amizone.net/Amizone/WebForms/Academics/MyCourses.aspx", method: .get, headers: self.headers).responseString {
            response in
            print(response.result.value!)
        }
    }
    
}
