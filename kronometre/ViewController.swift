//
//  ViewController.swift
//  kronometre
//
//  Created by Recep Akkoyun on 28.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var baslaButton: UIButton!
    @IBOutlet weak var lblSayac: UILabel!
    @IBOutlet weak var lblDakika: UILabel!
    @IBOutlet weak var lblSaat: UILabel!
    
    var  timer = Timer()
    var sayac = 0
    var dakika = 0
    var saat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        }
    

    
    @IBAction func btnBasla(_ sender: Any) {
    
        lblDakika.text = String(dakika)
        lblSaat.text = String(saat)
        lblSayac.text = String(sayac)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(sayacBaslat), userInfo: nil, repeats: true)
       baslaButton.isEnabled = false
        

    }
    
    @IBAction func btnDurdur(_ sender: Any) {
        timer.invalidate()
        sayac = sayac + 0
       baslaButton.isEnabled = true
    }
    
    
    @IBAction func btnSifirla(_ sender: Any) {
        sayac=0
        dakika=0
        lblDakika.text = "\(dakika)"
        saat=0
        lblSaat.text = "\(saat)"
        lblSayac.text = String(sayac)
        timer.invalidate()
       baslaButton.isEnabled = true
    }
    
    @objc func sayacBaslat(){
        sayac = sayac + 1
        if sayac == 5{
            dakika = dakika + 1
            lblDakika.text = "\(dakika)"
            sayac = 0
            if dakika == 3{
                saat = saat + 1
                lblSaat.text = "\(saat)"
                dakika = 0
            }
            lblDakika.text = "\(dakika)"
        }
        lblSayac.text = "\(sayac)"
    }
}

