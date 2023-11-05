//
//  PersonalizedRecommendationsViewController.swift
//  State Farm Small Business
//
//  Created by Pramith Prasanna on 11/4/23.
//

import UIKit

class PersonalizedRecommendationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var RecommendedPolicyTable: UITableView!
    
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
    
    var response = [1]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib.init(nibName: "PolicyTableViewCell", bundle: nil)
        RecommendedPolicyTable.register(nib, forCellReuseIdentifier: "policyCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return response.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = RecommendedPolicyTable.dequeueReusableCell(withIdentifier: "policyCell", for: indexPath) as? PolicyTableViewCell
        cell?.commonInit(imageNames[indexPath.row])
        return cell!
    }
    
    

}
