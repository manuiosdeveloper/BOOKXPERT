//
//  MainViewControl.swift
//  BOOKXPERT_taskManu
//
//  Created by Aritipamula Kotaiah on 06/04/25.
//

import UIKit
import PDFKit

class MainViewControl: UIViewController {
    @IBOutlet weak var apiLoadingButton: UIButton!
    @IBOutlet weak var pdfViewerButton: UIButton!
    @IBOutlet weak var imageselection: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiLoadingButton.layer.cornerRadius = 15
        pdfViewerButton.layer.cornerRadius = 15
        imageselection.layer.cornerRadius = 15
    }
      
    
    @IBAction func apiLoadingButton(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        self.present(nextViewController, animated:true, completion:nil)
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    
    @IBAction func pdfViewerButton(_ sender: Any) {
        
        if let url = URL(string: "https://fssservices.bookxpert.co/GeneratedPDF/Companies/nadc/2024-2025/BalanceSheet.pdf") {
            let pdfVC = PDFViewerViedControl()
            pdfVC.pdfURL = url
            navigationController?.pushViewController(pdfVC, animated: true)
        }
        
    }
    
    
    @IBAction func ImagepickFromgalary(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "PickImageFromGalary") as! PickImageFromGalary
//        self.present(nextViewController, animated:true, completion:nil)
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
