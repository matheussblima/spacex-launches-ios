//
//  LaunchesViewController.swift
//  SpaceX Launches
//
//  Created by Matheus  Lima  on 05/08/23.
//

import UIKit

protocol LaunchesViewControllerProtocol {
    func showLaunces(_ launches: LaunchesModel.FetchLaunches.ViewModel)
    func showError(_ error: LaunchesModel.FetchLaunches.ViewModelError)
}

class LaunchesViewController: UIViewController {
    let MINIMUM_SPACING = 20.0
    let NUMBER_OF_COLUMNS = 2.0
    
    var launches: [LaunchMapped] = []
    
    var interactor: LaunchesInteractorProtocol!
    var router: LaunchesRouterProtocol!
    
    let launchesCollectionView: UICollectionView
    
    init() {
        let layoutFlow = UICollectionViewFlowLayout()
        layoutFlow.scrollDirection = .vertical
        layoutFlow.minimumLineSpacing = MINIMUM_SPACING
        layoutFlow.minimumInteritemSpacing = MINIMUM_SPACING
        launchesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layoutFlow)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        layout()
    }
}

extension LaunchesViewController {
    func initialSetup() {
        view.backgroundColor = .systemIndigo
        
        self.interactor.getLaunches()
        navigationSetup()
        
        launchesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        launchesCollectionView.backgroundColor = .white
        launchesCollectionView.dataSource = self
        launchesCollectionView.delegate = self
        launchesCollectionView.register(LaunchesCellView.self, forCellWithReuseIdentifier: LaunchesCellView.identification)
    }
    
    func layout() {
        view.addSubview(launchesCollectionView)
        
        NSLayoutConstraint.activate([
            launchesCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            launchesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            launchesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            launchesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func navigationSetup() {
        title = Constants.appName
        
        let search = UISearchController(searchResultsController: nil)
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.tintColor = .white
        search.searchBar.searchTextField.backgroundColor = .white
        search.searchBar.placeholder = Constants.searchPlaceholder
        search.searchResultsUpdater = self
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemIndigo
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationItem.searchController = search
        navigationController?.navigationItem.searchController = search
    }
}


extension LaunchesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return launches.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LaunchesCellView.identification, for: indexPath) as! LaunchesCellView
        let data = launches[indexPath.row]
        
        cell.update(item: data)
        
        return cell
    }
}

extension LaunchesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (view.frame.width - MINIMUM_SPACING) / NUMBER_OF_COLUMNS
        
        return CGSize.init(width: size, height: size)
    }
}

extension LaunchesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        interactor.searchLaunches(query: text)
    }
}

extension LaunchesViewController: LaunchesViewControllerProtocol {
    func showError(_ error: LaunchesModel.FetchLaunches.ViewModelError) {
        print(error)
    }
    
    func showLaunces(_ launchesViewModel: LaunchesModel.FetchLaunches.ViewModel) {
        launches = launchesViewModel.Launches
        launchesCollectionView.reloadData()
    }
}

