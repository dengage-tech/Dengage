import Foundation
import UIKit
final class TestInAppMessageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.rowHeight = UITableView.automaticDimension
        view.estimatedRowHeight = 200
        view.backgroundColor = .white
        view.register(TestPageTableViewCell.self, forCellReuseIdentifier: "TestPageTableViewCell")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.separatorStyle = .none
        return view
    }()
    
    private var rows = [InAppMessageTest]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        setupViews()
        rows = [Constants.Banner.imageButtonCloseTopRadius,
                Constants.Banner.imageButtonCloseBottomRadius,
                Constants.Image.imageModalButtonMiddle,
                Constants.Image.imageModalButtonMiddleRadius,
                Constants.Image.imageModalTextButtonMiddle,
                Constants.Image.imageModalTextButtonMiddleRadius,
                Constants.Image.fullImageButtonFull,
                Constants.Image.fullImageTextButtonFull]
        tableView.reloadData()
    }
    
    private func setupViews(){
        self.title = "DENGAGE TEST PAGE"
        view.backgroundColor = .white
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {        let cell = tableView.dequeueReusableCell(withIdentifier: "TestPageTableViewCell", for: indexPath) as! TestPageTableViewCell
        cell.populateUI(with: rows[indexPath.row].title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Dengage.manager?.inAppManager.showInAppMessage(inAppMessage: rows[indexPath.row].data)
    }
    
    struct InAppMessageTest{
        let title: String
        let data: InAppMessage
    }
}

extension TestInAppMessageViewController {
    struct Constants {
        struct Banner{
            
            static var imageButtonCloseTopRadius:InAppMessageTest{
                let contentParams = ContentParams(position: .top,
                                                  shouldAnimate: true,
                                                  html: HTML.bannerHTML,
                                                  maxWidth: 450,
                                                  radius: 5,
                                                  marginTop: 5,
                                                  marginBottom: 5,
                                                  marginLeft: 5,
                                                  marginRight: 5,
                                                  dismissOnTouchOutside: true, backgroundColor: "#FFFFFF")
                let message = createInAppMessage(with: contentParams)
                return InAppMessageTest(title: "Banner (image + button + close) (TOP + radius)", data: message)
            }
            
            static var imageButtonCloseBottomRadius: InAppMessageTest {
                let contentParams = ContentParams(position: .bottom,
                                                  shouldAnimate: true,
                                                  html: HTML.bannerHTML,
                                                  maxWidth: 450,
                                                  radius: 5,
                                                  marginTop: 5,
                                                  marginBottom: 5,
                                                  marginLeft: 5,
                                                  marginRight: 5,
                                                  dismissOnTouchOutside: true, backgroundColor: "#FFFFFF")
                let message = createInAppMessage(with: contentParams)
                return InAppMessageTest(title: "Banner (image + button + close) (BOTTOM + radius)", data: message)
            }
        }
        
        struct Image {
            
            static var imageModalButtonMiddle: InAppMessageTest{
                let contentParams = ContentParams(position: .middle,
                                                  shouldAnimate: true,
                                                  html: HTML.imageHTML,
                                                  maxWidth: 450,
                                                  radius: nil,
                                                  marginTop: 5,
                                                  marginBottom: 5,
                                                  marginLeft: 5,
                                                  marginRight: 5,
                                                  dismissOnTouchOutside: true, backgroundColor: "#FFFFFF")
                let message = createInAppMessage(with: contentParams)
                return InAppMessageTest(title: "Image Modal (Button) (MIDDLE)", data: message)
            }
            
            static var imageModalButtonMiddleRadius: InAppMessageTest{
                let contentParams = ContentParams(position: .middle,
                                                  shouldAnimate: true,
                                                  html: HTML.imageHTML,
                                                  maxWidth: 450,
                                                  radius: 5,
                                                  marginTop: 5,
                                                  marginBottom: 5,
                                                  marginLeft: 5,
                                                  marginRight: 5,
                                                  dismissOnTouchOutside: true, backgroundColor: "#FFFFFF")
                let message = createInAppMessage(with: contentParams)
                return InAppMessageTest(title: "Image Modal (Button) (MIDDLE + radius)", data: message)
            }
            
            static var imageModalTextButtonMiddle: InAppMessageTest{
                let contentParams = ContentParams(position: .middle,
                                                  shouldAnimate: true,
                                                  html: HTML.imageTextHTML,
                                                  maxWidth: 300,
                                                  radius: nil,
                                                  marginTop: 5,
                                                  marginBottom: 5,
                                                  marginLeft: 5,
                                                  marginRight: 5,
                                                  dismissOnTouchOutside: true, backgroundColor: "#FFFFFF")
                let message = createInAppMessage(with: contentParams)
                return InAppMessageTest(title: "Image Modal-Text (Button) (MIDDLE)", data: message)
            }
            
            static var imageModalTextButtonMiddleRadius: InAppMessageTest{
                let contentParams = ContentParams(position: .middle,
                                                  shouldAnimate: true,
                                                  html: HTML.imageTextHTML,
                                                  maxWidth: 300,
                                                  radius: 5,
                                                  marginTop: 5,
                                                  marginBottom: 5,
                                                  marginLeft: 5,
                                                  marginRight: 5,
                                                  dismissOnTouchOutside: true, backgroundColor: "#FFFFFF")
                let message = createInAppMessage(with: contentParams)
                return InAppMessageTest(title: "Image Modal-Text (Button) (MIDDLE) (Radius)", data: message)
            }
            
            static var fullImageButtonFull: InAppMessageTest{
                let contentParams = ContentParams(position: .full,
                                                  shouldAnimate: true,
                                                  html: HTML.fullImageHTML,
                                                  maxWidth: 10000,
                                                  radius: nil,
                                                  marginTop: nil,
                                                  marginBottom: nil,
                                                  marginLeft: nil,
                                                  marginRight: nil,
                                                  dismissOnTouchOutside: true, backgroundColor: "#FFFFFF")
                let message = createInAppMessage(with: contentParams)
                return InAppMessageTest(title: "Full Image (Button) (FULL)", data: message)
            }
            
            static var fullImageTextButtonFull: InAppMessageTest{
                let contentParams = ContentParams(position: .full,
                                                  shouldAnimate: true,
                                                  html: HTML.fullImageTextHTML,
                                                  maxWidth: 10000,
                                                  radius: nil,
                                                  marginTop: nil,
                                                  marginBottom: nil,
                                                  marginLeft: nil,
                                                  marginRight: nil,
                                                  dismissOnTouchOutside: true, backgroundColor: "#FFFFFF")
                let message = createInAppMessage(with: contentParams)
                return InAppMessageTest(title: "Full Image Text (Button) (FULL)", data: message)
            }
        }
        
        static func createInAppMessage(with contentParams: ContentParams) -> InAppMessage{
            let content = Content(type: "html",
                                  props: contentParams,
                                  contentId: "")
            let data = InAppMessageData(messageDetailId: "messageDetails",
                                        expireDate: "2030-10-11T12:00:00.000Z",
                                        priority: .high,
                                        content: content,
                                        displayCondition: .init(screenNameFilters: [], screenNameFilterLogicOperator: .AND, ruleSet: nil), displayTiming: .init(delay: 0,
                                                                                                                           showEveryXMinutes: 0,
                                                                                                                           maxShowCount: 1), publicId: nil)
            return InAppMessage(id:"", data: data, nextDisplayTime: 0)
        }
        
        struct HTML{
            static let imageHTML = """
<!DOCTYPE html>\n<html>\n<head>\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n<meta charset=\"UTF-8\">\n<style>\nhtml {\n  box-sizing: border-box;\n  margin: 0;\n  padding: 0;\n}\n*, *:before, *:after {\n  box-sizing: inherit;\n}\nbody {\n  margin: 0;\n  padding: 0;\n  font-family: Arial, Helvetica, sans-serif;\n}\nimg {\n  max-width: 100%;\n  height: auto;\n  display: block;\n}\n\n.container {\n  width: 100%;\n}\n.content {\n    \n}\n.img-c {\n    width: 100%;\n}\n.img-c img {\n    width: 100%;\n}\n.body-c {\n    flex: 1;\n    padding: 14px;\n}\n.title {\n    color: #1C2C48;\n    font-weight: bold;\n    font-size: 16px;\n    line-height: 24px;\n}\n.message {\n    color: #1C2C48;\n    font-weight: normal;\n    font-size: 14px;\n    \n}\n\n.buttons {\n    display: flex;\n    padding: 12px;\n    margin-top: -52px;\n}\n.primaryBtn {\n    display: inline-block;\n    flex: 1;\n    min-width: 60px;\n    font-style: normal;\n    height: 40px;\n    line-height: 24px;\n    background-color: #125CFA;\n    text-align: center;\n    cursor: pointer;\n    color: white;\n    font-size: 14px;\n    font-weight: normal;\n    padding: 8px 16px;\n    border-radius: 8px;\n    border-width: 0px;\n    outline: none;\n    text-decoration:none;\n}\n\n.secondaryBtn {\n    display: inline-block;\n    flex: 1;\n    min-width: 60px;\n    font-style: normal;\n    height: 40px;\n    line-height: 24px;\n    background-color: #EEF2F5;\n    text-align: center;\n    cursor: pointer;\n    color: #125CFA;\n    font-size: 14px;\n    font-weight: normal;\n    padding: 8px 16px;\n    border-radius: 8px;\n    border-width: 0px;\n    outline: none;\n    margin-left: 12px;\n    text-decoration:none;\n}\n.closeBtn {\n    position: absolute;\n    right: 12px;\n    top: 4px;\n    font-size: 22px;\n    display: inline-block;\n    text-decoration:none;\n    outline: none;\n    color: white;\n}\n</style>\n</head>\n<body>\n    <div class=\"container\">\n        <div class=\"content\">\n            <div class=\"img-c\">\n                <img src=\"http://sc04.alicdn.com/kf/HTB1.qF_jtknBKNjSZKPq6x6OFXaR.jpg\" alt=\"\">\n            </div>\n        </div>\n        <div class=\"buttons\">\n            <button type=\"button\" class=\"primaryBtn\" onclick=\"Dn.androidUrl('https://example.com'); Dn.iosUrl('https://example.com'); Dn.sendClick('primary'); Dn.close();\">\n                Primary\n            </button>\n            <button type=\"button\" class=\"secondaryBtn\" onclick=\"Dn.androidUrl('https://example.com'); Dn.iosUrl('https://example.com'); Dn.sendClick('secondary'); Dn.close();\">\n                Secondary\n            </button>\n        </div>\n        <a href=\"#\" class=\"closeBtn\" onclick=\"Dn.dismiss()\">\n            &times;\n        </a>\n    </div>\n</body>\n</html>\n
"""
            
           static let imageTextHTML = """
<!DOCTYPE html>\n<html>\n<head>\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n<meta charset=\"UTF-8\">\n<style>\nhtml {\n  box-sizing: border-box;\n  margin: 0;\n  padding: 0;\n}\n*, *:before, *:after {\n  box-sizing: inherit;\n}\nbody {\n  margin: 0;\n  padding: 0;\n  font-family: Arial, Helvetica, sans-serif;\n}\nimg {\n  max-width: 100%;\n  height: auto;\n  display: block;\n}\n\n.container {\n  width: 100%;\n}\n.content {\n    \n}\n.img-c {\n    width: 100%;\n}\n.img-c img {\n    width: 100%;\n}\n.body-c {\n    flex: 1;\n    padding: 14px;\n}\n.title {\n    color: #1C2C48;\n    font-weight: bold;\n    font-size: 16px;\n    line-height: 24px;\n}\n.message {\n    color: #1C2C48;\n    font-weight: normal;\n    font-size: 14px;\n    \n}\n\n.buttons {\n    display: flex;\n    padding: 12px;\n    padding-top: 0;\n}\n.primaryBtn {\n    display: inline-block;\n    flex: 1;\n    min-width: 60px;\n    font-style: normal;\n    height: 40px;\n    line-height: 24px;\n    background-color: #125CFA;\n    text-align: center;\n    cursor: pointer;\n    color: white;\n    font-size: 14px;\n    font-weight: normal;\n    padding: 8px 16px;\n    border-radius: 8px;\n    border-width: 0px;\n    outline: none;\n    text-decoration:none;\n}\n\n.secondaryBtn {\n    display: inline-block;\n    flex: 1;\n    min-width: 60px;\n    font-style: normal;\n    height: 40px;\n    line-height: 24px;\n    background-color: #EEF2F5;\n    text-align: center;\n    cursor: pointer;\n    color: #125CFA;\n    font-size: 14px;\n    font-weight: normal;\n    padding: 8px 16px;\n    border-radius: 8px;\n    border-width: 0px;\n    outline: none;\n    margin-left: 12px;\n    text-decoration:none;\n}\n.closeBtn {\n    position: absolute;\n    right: 12px;\n    top: 4px;\n    font-size: 22px;\n    display: inline-block;\n    text-decoration:none;\n    outline: none;\n    color: white;\n}\n</style>\n</head>\n<body>\n    <div class=\"container\">\n        <div class=\"content\">\n            <div class=\"img-c\">\n                <img src=\"https://ccn.waag.org/drupal/sites/default/files/2018-03/campaign-blog-graphic-01-1080x675.jpg\" alt=\"\">\n            </div>\n            <div class=\"body-c\">\n                <div class=\"title\">\n                    Title goes here\n                </div>\n                <div class=\"message\">\n                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text\n                </div>\n            </div>\n        </div>\n        <div class=\"buttons\">\n            <button type=\"button\" class=\"primaryBtn\" onclick=\"Dn.androidUrl('https://example.com'); Dn.iosUrl('https://example.com'); Dn.sendClick('primary'); Dn.close();\">\n                Primary\n            </button>\n            <button type=\"button\" class=\"secondaryBtn\" onclick=\"Dn.androidUrl('https://example.com'); Dn.iosUrl('https://example.com'); Dn.sendClick('secondary'); Dn.close();\">\n                Secondary\n            </button>\n        </div>\n        <a href=\"#\" class=\"closeBtn\" onclick=\"Dn.dismiss()\">\n            &times;\n        </a>\n    </div>\n</body>\n</html>\n
"""
            static let fullImageHTML = """
<!DOCTYPE html>\n<html>\n<head>\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n<meta charset=\"UTF-8\">\n<style>\nhtml {\n  box-sizing: border-box;\n  margin: 0;\n  padding: 0;\n  height: 100%;\n}\n*, *:before, *:after {\n  box-sizing: inherit;\n}\nbody {\n  margin: 0;\n  padding: 0;\n  font-family: Arial, Helvetica, sans-serif;\n  height: 100%;\n}\nimg {\n  max-width: 100%;\n  height: auto;\n  display: block;\n}\n\n.container {\n  width: 100%;\n  height: 100%;\n  display: flex;\n  flex-direction: column;\n}\n.content {\n    flex: 1;\n    display: flex;\n    flex-direction: column;\n}\n.img-c {\n    width: 100%;\n    flex: 1;\n    background-image: url(\"https://thumbs.dreamstime.com/b/financial-growth-graph--sales-increase-marketing-strategy-concept-abstract-cover-design-vertical-format-financial-growth-graph-130410421.jpg\");\n    background-color: #cccccc; /* Used if the image is unavailable */\n    background-position: center; \n    background-repeat: no-repeat;\n    background-size: cover;\n}\n.img-c img {\n    width: 100%;\n}\n.body-c {\n    padding: 14px;\n    flex: 1;\n}\n.title {\n    color: #1C2C48;\n    font-weight: bold;\n    font-size: 16px;\n    line-height: 24px;\n}\n.message {\n    color: #1C2C48;\n    font-weight: normal;\n    font-size: 14px;\n    \n}\n\n.buttons {\n    display: flex;\n    padding: 12px;\n    padding-top: 0;\n    margin-top: -52px;\n}\n.primaryBtn {\n    display: inline-block;\n    flex: 1;\n    min-width: 60px;\n    font-style: normal;\n    height: 40px;\n    line-height: 24px;\n    background-color: #125CFA;\n    text-align: center;\n    cursor: pointer;\n    color: white;\n    font-size: 14px;\n    font-weight: normal;\n    padding: 8px 16px;\n    border-radius: 8px;\n    border-width: 0px;\n    outline: none;\n    text-decoration:none;\n}\n\n.secondaryBtn {\n    display: inline-block;\n    flex: 1;\n    min-width: 60px;\n    font-style: normal;\n    height: 40px;\n    line-height: 24px;\n    background-color: #EEF2F5;\n    text-align: center;\n    cursor: pointer;\n    color: #125CFA;\n    font-size: 14px;\n    font-weight: normal;\n    padding: 8px 16px;\n    border-radius: 8px;\n    border-width: 0px;\n    outline: none;\n    margin-left: 12px;\n    text-decoration:none;\n}\n.closeBtn {\n    position: absolute;\n    right: 12px;\n    top: 4px;\n    font-size: 22px;\n    display: inline-block;\n    text-decoration:none;\n    outline: none;\n    color: black;\n}\n</style>\n</head>\n<body>\n    <div class=\"container\">\n        <div class=\"img-c\">\n            <!--<img src=\"https://ccn.waag.org/drupal/sites/default/files/2018-03/campaign-blog-graphic-01-1080x675.jpg\" alt=\"\">-->\n        </div>\n        <div class=\"buttons\">\n            <button type=\"button\" class=\"primaryBtn\" onclick=\"Dn.androidUrl('https://example.com'); Dn.iosUrl('https://example.com'); Dn.sendClick('primary'); Dn.close();\">\n                Primary\n            </button>\n            <button type=\"button\" class=\"secondaryBtn\" onclick=\"Dn.androidUrl('https://example.com'); Dn.iosUrl('https://example.com'); Dn.sendClick('secondary'); Dn.close();\">\n                Secondary\n            </button>\n        </div>\n        <a href=\"#\" class=\"closeBtn\" onclick=\"Dn.dismiss()\">\n            &times;\n        </a>\n    </div>\n</body>\n</html>\n
"""
            
            static let fullImageTextHTML = """
<!DOCTYPE html>\n<html>\n<head>\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n<meta charset=\"UTF-8\">\n<style>\nhtml {\n  box-sizing: border-box;\n  margin: 0;\n  padding: 0;\n  height: 100%;\n}\n*, *:before, *:after {\n  box-sizing: inherit;\n}\nbody {\n  margin: 0;\n  padding: 0;\n  font-family: Arial, Helvetica, sans-serif;\n  height: 100%;\n}\nimg {\n  max-width: 100%;\n  height: auto;\n  display: block;\n}\n\n.container {\n  width: 100%;\n  height: 100%;\n  display: flex;\n  flex-direction: column;\n}\n.content {\n    flex: 1;\n    display: flex;\n    flex-direction: column;\n}\n.img-c {\n    width: 100%;\n    flex: 1;\n    background-image: url(\"https://ccn.waag.org/drupal/sites/default/files/2018-03/campaign-blog-graphic-01-1080x675.jpg\"); /* The image used */\n    background-color: #cccccc; /* Used if the image is unavailable */\n    background-position: center; \n    background-repeat: no-repeat;\n    background-size: cover;\n}\n.img-c img {\n    width: 100%;\n}\n.body-c {\n    padding: 14px;\n    flex: 1;\n}\n.title {\n    color: #1C2C48;\n    font-weight: bold;\n    font-size: 16px;\n    line-height: 24px;\n}\n.message {\n    color: #1C2C48;\n    font-weight: normal;\n    font-size: 14px;\n    \n}\n\n.buttons {\n    display: flex;\n    padding: 12px;\n    padding-top: 0;\n}\n.primaryBtn {\n    display: inline-block;\n    flex: 1;\n    min-width: 60px;\n    font-style: normal;\n    height: 40px;\n    line-height: 24px;\n    background-color: #125CFA;\n    text-align: center;\n    cursor: pointer;\n    color: white;\n    font-size: 14px;\n    font-weight: normal;\n    padding: 8px 16px;\n    border-radius: 8px;\n    border-width: 0px;\n    outline: none;\n    text-decoration:none;\n}\n\n.secondaryBtn {\n    display: inline-block;\n    flex: 1;\n    min-width: 60px;\n    font-style: normal;\n    height: 40px;\n    line-height: 24px;\n    background-color: #EEF2F5;\n    text-align: center;\n    cursor: pointer;\n    color: #125CFA;\n    font-size: 14px;\n    font-weight: normal;\n    padding: 8px 16px;\n    border-radius: 8px;\n    border-width: 0px;\n    outline: none;\n    margin-left: 12px;\n    text-decoration:none;\n}\n.closeBtn {\n    position: absolute;\n    right: 12px;\n    top: 4px;\n    font-size: 22px;\n    display: inline-block;\n    text-decoration:none;\n    outline: none;\n    color: white;\n}\n</style>\n</head>\n<body>\n    <div class=\"container\">\n        <div class=\"img-c\">\n            <!--<img src=\"https://ccn.waag.org/drupal/sites/default/files/2018-03/campaign-blog-graphic-01-1080x675.jpg\" alt=\"\">-->\n        </div>\n        <div class=\"content\">\n            <div class=\"body-c\">\n                <div class=\"title\">\n                    Title goes here\n                </div>\n                <div class=\"message\">\n                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text\n                </div>\n            </div>\n            <div class=\"buttons\">\n                <button type=\"button\" class=\"primaryBtn\" onclick=\"Dn.androidUrl('https://example.com'); Dn.iosUrl('https://example.com'); Dn.sendClick('primary'); Dn.close();\">\n                    Primary\n                </button>\n                <button type=\"button\" class=\"secondaryBtn\" onclick=\"Dn.androidUrl('https://example.com'); Dn.iosUrl('https://example.com'); Dn.sendClick('secondary'); Dn.close();\">\n                    Secondary\n                </button>\n            </div>\n        </div>\n        <a href=\"#\" class=\"closeBtn\" onclick=\"Dn.dismiss()\">\n            &times;\n        </a>\n    </div>\n</body>\n</html>\n
"""
            static let bannerHTML = """
<!DOCTYPE html>\n<html>\n<head>\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n<meta charset=\"UTF-8\">\n<style>\nhtml {\n  box-sizing: border-box;\n  margin: 0;\n  padding: 0;\n}\n*, *:before, *:after {\n  box-sizing: inherit;\n}\nbody {\n  margin: 0;\n  padding: 0;\n  font-family: Arial, Helvetica, sans-serif;\n}\nimg {\n  max-width: 100%;\n  height: auto;\n  display: block;\n}\n\n.container {\n  width: 100%;\n  padding: 12px;\n}\n.content {\n    display: flex;\n}\n.img-c {\n    width: 22%;\n    max-width: 100px;\n}\n.img-c img {\n    width: 100%;\n}\n.body-c {\n    flex: 1;\n    padding-left: 12px;\n}\n.title {\n    color: #1C2C48;\n    font-weight: bold;\n    font-size: 16px;\n    line-height: 24px;\n}\n.message {\n    color: #1C2C48;\n    font-weight: normal;\n    font-size: 14px;\n    \n}\n\n.buttons {\n    display: flex;\n    margin-top: 12px;\n}\n.primaryBtn {\n    display: inline-block;\n    flex: 1;\n    min-width: 60px;\n    font-style: normal;\n    height: 40px;\n    line-height: 24px;\n    background-color: #125CFA;\n    text-align: center;\n    cursor: pointer;\n    color: white;\n    font-size: 14px;\n    font-weight: normal;\n    padding: 8px 16px;\n    border-radius: 8px;\n    border-width: 0px;\n    outline: none;\n    text-decoration:none;\n}\n\n.secondaryBtn {\n    display: inline-block;\n    flex: 1;\n    min-width: 60px;\n    font-style: normal;\n    height: 40px;\n    line-height: 24px;\n    background-color: #EEF2F5;\n    text-align: center;\n    cursor: pointer;\n    color: #125CFA;\n    font-size: 14px;\n    font-weight: normal;\n    padding: 8px 16px;\n    border-radius: 8px;\n    border-width: 0px;\n    outline: none;\n    margin-left: 12px;\n    text-decoration:none;\n}\n.closeBtn {\n    position: absolute;\n    right: 12px;\n    top: 4px;\n    font-size: 22px;\n    display: inline-block;\n    text-decoration:none;\n    outline: none;\n    color: #1C2C48;\n}\n</style>\n</head>\n<body>\n    <div class=\"container\">\n        <div class=\"content\">\n            <div class=\"img-c\">\n                <img src=\"https://play-lh.googleusercontent.com/IeNJWoKYx1waOhfWF6TiuSiWBLfqLb18lmZYXSgsH1fvb8v1IYiZr5aYWe0Gxu-pVZX3\" alt=\"\">\n            </div>\n            <div class=\"body-c\">\n                <div class=\"title\">\n                    Title goes here\n                </div>\n                <div class=\"message\">\n                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text\n                </div>\n            </div>\n        </div>\n        <div class=\"buttons\">\n            <button type=\"button\" class=\"primaryBtn\" onclick=\"Dn.androidUrl('https://example.com'); Dn.iosUrl('https://example.com'); Dn.sendClick('primary'); Dn.close();\">\n                Primary\n            </button>\n            <button type=\"button\" class=\"secondaryBtn\" onclick=\"Dn.androidUrl('https://example.com'); Dn.iosUrl('https://example.com'); Dn.sendClick('secondary'); Dn.close();\">\n                Secondary\n            </button>\n        </div>\n        <a href=\"#\" class=\"closeBtn\" onclick=\"Dn.dismiss()\">\n            &times;\n        </a>\n    </div>\n</body>\n</html>\n
"""
        }
    }
}
