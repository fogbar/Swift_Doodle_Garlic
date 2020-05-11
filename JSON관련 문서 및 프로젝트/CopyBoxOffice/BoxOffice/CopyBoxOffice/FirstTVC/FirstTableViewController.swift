//
//  FirstTableViewController.swift
//  CopyBoxOffice
//
//  Created by garlic on 2020/05/06.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class FirstTableViewController: UITableViewController {
    
    @IBOutlet weak var categorySC: UISegmentedControl!
    
    let categoryList : [String] = ["예매율", "큐레이션", "개봉일"]
    var movieList : [MovieInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.view.backgroundColor = UIColor(red: 86/255, green: 107/255, blue: 196/255, alpha: 1.0)
        
        let nibCell = UINib(nibName: "FirstCell", bundle: nil)
        self.tableView.register(nibCell, forCellReuseIdentifier: "movieInfoCell")
        
        // Mark: Setting categorySC
        categorySC.removeAllSegments()
        for list in categoryList {
            categorySC.insertSegment(withTitle: list, at: categoryList.count, animated: false)
        }
        categorySC.selectedSegmentIndex = 0
        
        parseJson(by: 0)
    }
    
    func parseJson(by index:Int) {
        //Parse Json
        let urlString = "https://connect-boxoffice.run.goorm.io/movies?order_type=\(index)"
        guard let url = URL(string: urlString) else {return}
        
        let session : URLSession = URLSession(configuration: .default)
        let dataTask : URLSessionDataTask = session.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else {return}
            
            do {
                let movieList = try JSONDecoder().decode(MovieList.self, from: data)
                print(movieList)
                self.movieList = movieList.movies
                print(self.movieList)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch let jsonErr {
                debugPrint(jsonErr)
            }
            
        }
        dataTask.resume()
    }
    
    @IBAction func changeSC(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        parseJson(by: index)
        self.tableView.reloadData()
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.movieList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieInfoCell", for: indexPath) as? FirstCell else {return UITableViewCell()}
        
        let movie = movieList[indexPath.row]
        // get imageUrl and change it into data
        if let imageUrl = URL(string: movie.thumb) {
            do {
                let data = try Data(contentsOf: imageUrl)
                cell.movieImageView.image = UIImage(data: data)
            } catch let err {
                print(err)
            }
        }
        
        cell.titleLabel.text = movie.title
        cell.gradeLabel.text = String(movie.grade)
        cell.userRatingLabel.text = "평점: \(String(movie.userRating))"
        cell.reservationGraderLabel.text = "예매순위: \(String(movie.reservationGrade))"
        cell.reservationRateLabel.text = "예매율: \(String(movie.reservationRate))"
        cell.dateLabel.text = "개봉일: \(movie.date)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height : CGFloat
        height = 170.0
        return height
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
