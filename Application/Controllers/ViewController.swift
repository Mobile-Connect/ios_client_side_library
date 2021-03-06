import UIKit
import WebKit

class ViewController: BaseViewController {
    
    var mcc: String = EMPTY
    var mnc: String = EMPTY
    var isMsisdnRequest: Bool = false
    var isMccMncRequest: Bool = false
    var isWithIP: Bool = false
    
    @IBOutlet weak var msisdnField: UITextField!
    @IBOutlet weak var discoveryRequestParameters: UISegmentedControl!
    
    @IBOutlet weak var ui_scrollView: UIScrollView!
    @IBOutlet weak var mccField: UITextField!
    @IBOutlet weak var mncField: UITextField!
    
    @IBOutlet weak var withIPAddressSwitch: UISwitch!
    @IBOutlet weak var ipAddressField: UITextField!
    
    @IBAction func discoveryParametersTapped(_ sender: Any) {
        if discoveryRequestParameters.selectedSegmentIndex == 0 {
            UIView.transition(with: self.msisdnField, duration: 0.5, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
                self.mccField.isHidden = true
                self.mncField.isHidden = true
                self.msisdnField.isHidden = false
            }, completion: nil)
            isMsisdnRequest = true
            isMccMncRequest = false
        } else if discoveryRequestParameters.selectedSegmentIndex == 1 {
            UIView.transition(with: self.mccField, duration: 0.5, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
                self.mccField.isHidden = false
                self.mncField.isHidden = false
                self.msisdnField.isHidden = true
            }, completion: nil)
            isMccMncRequest = true
            isMsisdnRequest = false
        } else {
            isMsisdnRequest = false
            isMccMncRequest = false
            UIView.transition(with: self.msisdnField, duration: 0.5, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
                self.mccField.isHidden = true
                self.mncField.isHidden = true
                self.msisdnField.isHidden = true
            }, completion: nil)
        }
    }
    
    @IBAction func ipAdressTapped(_ sender: Any) {
        if (withIPAddressSwitch.isOn) {
            self.ipAddressField.isHidden = false
            self.isWithIP = true
        } else {
            self.ipAddressField.isHidden = true
            self.isWithIP = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        msisdnField.setBorders()
        mccField.setBorders()
        mncField.setBorders()
        ipAddressField.setBorders()
        setValues()
        discoveryRequestParameters.selectedSegmentIndex = 2
        self.hideKeyboardWhenTappedAround()
    }
    
    func setValues() {
        if let addr = NetworkUtils.getIPAddress() {
            ipAddressField.text = addr
        } else {
            ipAddressField.text = config.getIpAdress()
        }
        msisdnField.text = self.config.getMsisdn()
        mccField.text = NetworkUtils.getCellularInformation().mcc
        if mccField.text!.isEmpty {
            mccField.text = self.config.getMcc()
        }
        mncField.text = NetworkUtils.getCellularInformation().mnc
        if mncField.text!.isEmpty {
            mncField.text = self.config.getMnc()
        }
    }
  
    @IBAction func getLogin(_ sender: Any) {
        var parameters : [String: String] = [:]
        if(isMsisdnRequest) {
            parameters = NetworkUtils.requestConstructor(msisdn: msisdnField.text, sourceIp: isWithIP ? ipAddressField.text : nil)
        } else if (isMccMncRequest) {
            parameters = NetworkUtils.requestConstructor(mcc: mccField.text, mnc: mncField.text, sourceIp: isWithIP ? ipAddressField.text : nil)
        } else {
            parameters = NetworkUtils.requestConstructor(sourceIp: isWithIP ? ipAddressField.text : nil)
        }
        request = HttpUtils.createRequestWithParams(url:config.getEndpoint(), params:parameters)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowResultSegue" {
            if let destinationVC = segue.destination as? WebViewController {
                    destinationVC.request = request
            }
        }
    }
  
}
