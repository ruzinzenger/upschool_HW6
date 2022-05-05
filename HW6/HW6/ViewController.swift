//
//  ViewController.swift
//  HW6
//
//  Created by Irmak Zenger on 5/4/22.
//
/*
 Kaynaklar
 https://www.youtube.com/watch?v=fSSUkPSBx1g
 https://www.ioscreator.com/tutorials/customize-navigation-bar-ios-tutorial
 https://stackoverflow.com/questions/31521187/uisearchbar-custom-corners
 https://stackoverflow.com/questions/27499998/how-to-set-image-for-bar-button-with-swift/51060353
 */

import UIKit

class ViewController: UIViewController {
    @IBOutlet var mySearchBar: UISearchBar!
    
    
    @IBOutlet weak var kitaplarTableView: UITableView!
    
    
    @IBOutlet weak var internalView: UIView!
    
    var kitapList = [Kitap]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // NAVIGATION BAR
        
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "navbar_color")
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        
        // search bar in nav bar
        mySearchBar.searchTextField.layer.cornerRadius = 20
        mySearchBar.searchTextField.layer.masksToBounds = true
        mySearchBar.searchTextField.backgroundColor = UIColor.white
        mySearchBar.placeholder = "Title, author or ISBN"
        
        navigationItem.titleView = mySearchBar
        
        // alert bell button in nav bar
        let alert_button: UIButton = UIButton(type: UIButton.ButtonType.custom)
        alert_button.setImage(UIImage(named: "alert"), for: UIControl.State.normal)
        alert_button.frame = CGRect(x: 0, y: 0, width: 1, height: 1)
        
        let barButton = UIBarButtonItem(customView: alert_button)

        self.navigationItem.rightBarButtonItem = barButton
        
        

        // TABLE VIEW
        
        kitaplarTableView.delegate = self
        kitaplarTableView.dataSource = self
        
        let k1 = Kitap(kitap_id: 1, kitap_adi: "Dead Poets Society", kitap_yazar_adi: "by N.H. Kleinbaum", kitap_kategori_adi: "Classics", kitap_resim_adi: "book1")
        
        let k2 = Kitap(kitap_id: 2, kitap_adi: "Feline Philosophy: Cats and the Meaning of Life", kitap_yazar_adi: "by John N. Gray", kitap_kategori_adi: "Philosophy", kitap_resim_adi: "book2")
        
        let k3 = Kitap(kitap_id: 3, kitap_adi: "The Last Rose of Shanghai", kitap_yazar_adi: "by Weina Dai Randel", kitap_kategori_adi: "Historical Fiction", kitap_resim_adi: "book3")
        
        kitapList.append(k1)
        kitapList.append(k2)
        kitapList.append(k3)
        
        kitaplarTableView.separatorColor = UIColor(named: "tableview_background")
        
        
        
        // TAB BAR
        
        let appereance = UITabBarAppearance()
        appereance.backgroundColor = UIColor(named: "tabbar_color")
        
        itemRenkDegistir(itemAppereance: appereance.stackedLayoutAppearance)
        itemRenkDegistir(itemAppereance: appereance.inlineLayoutAppearance)
        itemRenkDegistir(itemAppereance: appereance.compactInlineLayoutAppearance)
        
        tabBarController?.tabBar.standardAppearance = appereance
        tabBarController?.tabBar.scrollEdgeAppearance = appereance
        
        

    }
    
    
    func itemRenkDegistir(itemAppereance : UITabBarItemAppearance){
        // when it is not selected
        itemAppereance.selected.iconColor = UIColor(named: "tabicon_color")
        itemAppereance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor(named: "tabicon_color") ?? UIColor.white]
        
        // when it is selected
        itemAppereance.selected.iconColor = UIColor.black
        itemAppereance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
    }


}




extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kitapList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // the next book whose properties will be used to populate the upcoming cell
        let kitap = kitapList[indexPath.row]
        
        // getting the next cell to be populated and converting the type to KitapTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "kitapHucre", for: indexPath) as! KitapTableViewCell
        
        
        cell.kitapKapakImageView.image = UIImage(named: kitap.kitap_resim_adi!)
        cell.kitapAdLabel.text = kitap.kitap_adi
        cell.kitapYazarLabel.text = kitap.kitap_yazar_adi
        cell.kategoriLabel.text = kitap.kitap_kategori_adi
        
        
        cell.backgroundColor = UIColor(named: "tableview_background")
        
        
        return cell
    }
}
