//
//  LaunchesViewController.swift
//  SpaceX Launches
//
//  Created by Matheus  Lima  on 05/08/23.
//

import UIKit

protocol LaunchesViewControllerProtocol {
    func showLaunces(_ launches: LaunchesModel.FetchLaunches.ViewModel)
}

class LaunchesViewController: UIViewController {
    var launches: [LaunchMapped] = []
    
    var interactor: LaunchesInteractorProtocol!
    var router: LaunchesRouterProtocol!
    
    let launchesCollectionView: UICollectionView
    
    init() {
        let layoutFlow = UICollectionViewFlowLayout()
        layoutFlow.scrollDirection = .vertical
        layoutFlow.minimumLineSpacing = 20
        layoutFlow.minimumInteritemSpacing = 20
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
        view.backgroundColor = .white
        
        self.interactor.getLaunches()
        navigationSetup()
        
        launchesCollectionView.translatesAutoresizingMaskIntoConstraints = false
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
        navigationController?.navigationBar.prefersLargeTitles = true
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
        let size = (view.frame.width - 20) / 2
        
        return CGSize.init(width: size, height: size)
    }
}

extension LaunchesViewController: LaunchesViewControllerProtocol {
    func showLaunces(_ launchesViewModel: LaunchesModel.FetchLaunches.ViewModel) {
        launches = launchesViewModel.Launches ?? []
        launchesCollectionView.reloadData()
    }
}

