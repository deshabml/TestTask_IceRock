//
//  RepositoriesListTableViewController.swift
//  TestTaskIceRock
//
//  Created by Лаборатория on 21.02.2023.
//

import UIKit

struct Repositoriy {
    var nameRep: String
    var programLanguage: String
    var projectDescription: String
}

class RepositoriesListTableViewController: UIViewController {

    let dataSourse: [Repositoriy] = [
        Repositoriy(nameRep: "moko-web3",
                    programLanguage: "Kotlin",
                    projectDescription: "Ethereum Web3 implementation for mobile (android & ios) Kotlin Multiplatform development"),
        Repositoriy(nameRep: "moko-resources",
                    programLanguage: "Kotlin",
                    projectDescription: "Resources access for mobile (android & ios) Kotlin Multiplatform development"),
        Repositoriy(nameRep: "libs.kmp.icerock.dev",
                    programLanguage: "JavaScript",
                    projectDescription: "Kotlin Multiplatform libraries list with info auto-fetch")
    ]

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.sectionHeaderTopPadding = 0.2
        tableView.backgroundColor = .black
        tableView.register(RepTableViewCell.self, forCellReuseIdentifier: RepTableViewCell.id)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    //    override init(style: UITableView.Style) {
    //        super.init(style: .grouped)
    ////        register(RepositoriesListTableViewCell.self, forCellWithReuseIdentifier: RepositoriesListTableViewCell.id)
    //    }
    //
    //    required init?(coder: NSCoder) {
    //        fatalError("init(coder:) has not been implemented")
    //    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        navigationBarSetting()
        view.addSubview(tableView)
        installingСonstraints()
        //        title = "Repositories"
        //        self.register(RepositoriesListTableViewCell.self, forCellReuseIdentifier: RepositoriesListTableViewCell.id)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }

}

extension RepositoriesListTableViewController {

    private func installingСonstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

extension RepositoriesListTableViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourse.count
    }


//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RepTableViewCell.id, for: indexPath) as! RepTableViewCell
        cell.setupCell(nameRep: dataSourse[indexPath.item].nameRep, programLanguage: dataSourse[indexPath.item].programLanguage, projectDescription: dataSourse[indexPath.item].projectDescription)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.dequeueReusableCell(withIdentifier: RepTableViewCell.id, for: indexPath) as! RepTableViewCell
        cell.backgroundColor = .black

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

extension RepositoriesListTableViewController {

    private func navigationBarSetting() {
//        let navBarAppearance = UINavigationBarAppearance()
        title = "Сегодня"
//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationController?.navigationBar.standardAppearance = navBarAppearance
//        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.tintColor = .white
//        navigationController?.navigationBar.titleTextAttributes = NSAttributedString()
        navigationItem.leftBarButtonItem = .none
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.strokeColor: UIColor.white]
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(buttonPlusAction))
    }

    @objc func buttonPlusAction() {
        print("Plus")
    }

}
