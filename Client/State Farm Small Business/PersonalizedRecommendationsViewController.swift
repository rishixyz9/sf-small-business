//
//  PersonalizedRecommendationsViewController.swift
//  State Farm Small Business
//
//  Created by Pramith Prasanna on 11/4/23.
//

import UIKit

struct goodPolicies {
    static var listOfPolicies = [String]()
    static var policyStuff = PolicyResponse.self
}

class PersonalizedRecommendationsViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var policyResponse: PolicyResponse?
    
    var receivedMessage: String?
    
    var globdata = ""
    
    var imageNames = ["Business Owners Policies", "Contractor Policies", "Farm and Ranch Insurance", "Surety and Fidelity Bonds", "Workers' Compensation", "Group Life Insurance", "Small Business Life Insurance", "Business Continuity Plans with Buy-sell Agreements", "Key Employee Insurance", "Employee Incentive Programs", "Commercial Auto Insurance", "Inland Marine Insurance", "Professional Liability Insurance (Errors and Omissions)", "Commercial Liability Umbrella Policy", "Employment Practices Liability Insurance", "Not-for-profit Organizations Insurance", "Condominium and Homeowners Associations Insurance", "Small Business Retirement Plans", "Individual 401(k)", "Simplified Employee Pension (SEP IRA)", "Simple IRA", "Estate Planning", "Overview", "Checking, Savings and Money Market", "Payment Solutions", "Lending", "Credit Cards"]
    
    let policyDict: [String: String] = ["Business Owners Policies": "Also known as BOP insurance, combines property and liability coverage.",
                                        "Contractor Policies": "Protect your business with insurance designed for contractors.",
                                        "Farm and Ranch Insurance": "Protect your home, livestock, equipment, and income for farm and ranch owners.",
                                        "Surety and Fidelity Bonds": "Guarantees your work for licensing requirements and adds peace of mind.",
                                        "Workers' Compensation": "Protects employees against work-related injuries or illness. Varies by state.",
                                        "Group Life Insurance": "Get group life benefit for employee groups of five or more.",
                                        "Small Business Life Insurance": "Plan for the unexpected with life insurance for small businesses.",
                                        "Business Continuity Plans": "Ensure your business lands in the right hands when an owner passes away.",
                                        "Key Employee Insurance": "Protect your key employees with life insurance.",
                                        "Employee Incentive Programs": "Reward and retain key employees with life insurance policies.",
                                        "Commercial Auto Insurance": "Covers vehicles used between or on jobsites.",
                                        "Inland Marine Insurance": "Coverage for transportable business property, like mobile tools or photo equipment.",
                                        "Professional Liability Insurance": "Get covered against lawsuits for acts of error, libel or slander.",
                                        "Commercial Liability Umbrella Policy": "Provides extra financial protection against costly lawsuits.",
                                        "Employment Practices Liability Insurance": "Covers lawsuits due to employment-related issues, like wrongful termination, discrimination, sexual harassment.",
                                        "Not-for-profit Organizations Insurance": "Protects your organization from covered claims for legal defense costs.",
                                        "Condominium and HOA Insurance": "Protects against property damage and lawsuits related to ownership and management of your condo association and HOA property.",
                                        "Small Business Retirement Plans": "Retire comfortably and receive tax deductions for contributions to employee retirement funds.",
                                        "Individual 401(k)": "Designed for owner-only businesses, this retirement plan helps you plan thoughtfully for your future.",
                                        "Simplified Employee Pension (SEP IRA)": "Help employees get a head start on retirement savings with a SERP Investment Retirement Account (IRA).",
                                        "Simple IRA": "Designed for businesses with less than 100 employees, this benefits package helps plan for successful futures.",
                                        "Estate Planning": "Set up a simple estate plan, such as a will, trust, or business continuation plans."]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let sampleJSON = """
//            {
//                "policies": [
//                    {
//                        "score": 1,
//                        "tag": "Small Business Retirement Plans"
//                    },
//                    {
//                        "score": 0.8,
//                        "tag": "Inland Marine Insurance"
//                    },
//                    {
//                        "score": 0.7,
//                        "tag": "Commercial Liability Umbrella Policy"
//                    },
//                    {
//                        "score": 0.5,
//                        "tag": "Commercial Auto Insurance"
//                    },
//                    {
//                        "score": 0.4,
//                        "tag": "Contractor Policies"
//                    }
//                ]
//            }
//        """
//
//        if let jsonData = sampleJSON.data(using: .utf8) {
//            do {
//                let decoder = JSONDecoder()
//                policyResponse = try decoder.decode(PolicyResponse.self, from: jsonData)
//            } catch {
//                print("Error decoding JSON: \(error)")
//            }
//        }
        
//        for policy in policyResponse!.policies {
//            if (policy.score >= 0.7) {
//                goodPolicies.listOfPolicies.append(policy.tag)
//            }
//        }
        
        
        
        let nib = UINib.init(nibName: "PolicyTableViewCell", bundle: nil)
        //tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        var msg: String = ""
        
        if let message = receivedMessage {
            print(message)
            msg = message
        }
        
        
        var array = SharedArrayManager.shared.sharedArray
        
        let parameters = ["message": msg]
        
        print("help help help" + msg)// Replace with your JSON data
        
        // Convert the dictionary to JSON data
        guard let jsonData = try? JSONSerialization.data(withJSONObject: parameters) else {
            print("Error creating JSON data")
            return
        }
        
        // Prepare the URL and URLRequest for the POST request
        let urlString = "http://127.0.0.1:5000/getweights"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        // Perform the POST request
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: (error)")
            } else if let data = data {
                
                // Handle the response data here
                if let responseString = String(data: data, encoding: .utf8) {
                    print("Response: \(responseString)")
                    self.globdata = responseString
                    
                }

                

                
            }
        }.resume()
        
        sleep(45)
        
        if let jsonData = globdata.data(using: .utf8) {
            print(jsonData)
            let decoder = JSONDecoder()
            do {
                            let decoder = JSONDecoder()
                            policyResponse = try decoder.decode(PolicyResponse.self, from: jsonData)
                            print("works mofo")
                        } catch {
                            print("Error decoding JSON: \(error)")
                        }
                
        }
        
        tableView.dataSource = self
        tableView.rowHeight = 100
        
        for policy in policyResponse!.policies {
                    if (policy.score >= 0.7) {
                        goodPolicies.listOfPolicies.append(policy.tag)
                    }
                }
        
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        for policy in policyResponse!.policies {
            if (policy.score >= 0.7) {
                count += 1
            }
        }
        return count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        let policy = policyResponse!.policies[indexPath.row]

        cell.image.image = UIImage(named: policy.tag)
        cell.title.text = policy.tag
        cell.desc.text = policyDict[policy.tag]
        return cell
    }

}

class CustomCell: UITableViewCell {
    let image = UIImageView()
    let title = UILabel()
    let desc = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layer.borderWidth = 1
            layer.cornerRadius = 8
            layer.masksToBounds = true
        addSubview(image)
        addSubview(title)
        addSubview(desc)
        
        let imageSize = 80
        
        title.numberOfLines = 0
        desc.numberOfLines = 0
        
        // Title label
        title.font = UIFont.boldSystemFont(ofSize: 17)
        title.textColor = .white

        // Description label
        desc.font = UIFont.systemFont(ofSize: 10, weight: .light)
        desc.textColor = .lightGray
        
        

        image.frame = CGRect(x: 0,
                             y: (100 - imageSize) / 2,
                             width: imageSize,
                             height: imageSize)
        
        // Title
        title.frame = CGRect(x: 100, y: 10, width: 200, height: 50)

        // Description
        desc.frame = CGRect(x: 100, y: 50, width: 200, height: 50)
        
        
        self.backgroundColor = UIColor.darkGray
    }
    
    override func prepareForReuse() {
      super.prepareForReuse()
      
      image.image = nil
      title.text = nil
      desc.text = nil
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
