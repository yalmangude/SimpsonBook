//
//  ViewController.swift
//  SimpsonBook
//
//  Created by YALMAN GÜDE on 16.08.2023.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var mySimpsons = [Simpson]() // boş dizi oluşturmak için () yazmamız gerek
    var chosenSimpson : Simpson?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        //simpson Object
        let homer = Simpson(nameInit: "Homer Simpson",jobInit: "Nuclear Safety",ImageInit: UIImage(named: "homer")!)
       // burada onun fotoğrafını buluyoruz hangi isimle yazdıysak ve böyle bir fotoğrafın varlığını ! ile koruyoruz yoksa hata alırız
        let marge = Simpson(nameInit: "Marge Simpson",jobInit: "Housewife",ImageInit: UIImage(named: "marge")!)
        let bart = Simpson(nameInit: "Bart Simpson",jobInit: "Student",ImageInit: UIImage(named: "bart")!)
        let lisa = Simpson(nameInit: "Lisa Simpson",jobInit: "Student",ImageInit: UIImage(named: "lisa")!)
        let maggie = Simpson(nameInit: "Maggie Simpson",jobInit: "Baby",ImageInit: UIImage(named: "maggie")!)
        
        mySimpsons.append(homer) //bütün bir yukarıdaki objeleri alıp bir diziye yerleştiriyoruz sonrada numberofrows a gidip yazıyoruz listeyi yazıyoruz
        mySimpsons.append(marge)
        mySimpsons.append(bart)
        mySimpsons.append(lisa)
        mySimpsons.append(maggie)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // num yazarak ulaşabiliriz
        return mySimpsons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //cell yazarak ulaş
        //ne gösterceğimizi soruyor
        //cell burada döndürmemiz gerekir
        
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimpsons[indexPath.row].name
        return cell
    }
    //tableview seçilince diğer tarafa gitmesini istiyoruz bu yüzden didselectrowat dicez
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = mySimpsons[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil) //böylece ekrana geçiş yapıyoruz
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! detailsVC // bu hedefteki şeyleri alıyoruz ve artık burada kullanabiliriz
            destinationVC.selectedSimpson = chosenSimpson
        }
    }
}

