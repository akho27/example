//
//  SkeletonLoadingTableView.swift
//  NavigationController
//
//  Created by Akingson Chun on 12/07/2019.
//

import UIKit

class SkeletonLoadingViewController: UIViewController {
    
    // MARK: Constants
    
    let game1 = SegmentedControlModel(title: "Dota 2",
                                      description: "Dota 2 is a multiplayer online battle arena video game developed and published by Valve Corporation. The game is a sequel to Defense of the Ancients, which was a community-created mod for Blizzard Entertainment's Warcraft III: Reign of Chaos and its expansion pack, The Frozen Throne.",
                                      image: #imageLiteral(resourceName: "dota2"))
    
    let game2 = SegmentedControlModel(title: "Dota Underlord",
                                      description: "Dota Underlords is a stand-alone game based on Dota Auto Chess.",
                                      image: #imageLiteral(resourceName: "dotaUnderlord"))
    
    let game3 = SegmentedControlModel(title: "Auto Chess",
                                      description: "Dota Auto Chess is a strategy video game mod for the video game Dota 2. Developed by Drodo Studio and released in January 2019, the game supports up to eight players playing a modified version of chess, with characters and gameplay elements from Dota 2",
                                      image: #imageLiteral(resourceName: "autochess"))
    
    let tvShow1 = SegmentedControlModel(title: "Stranger Things",
                                        description: "This thrilling Netflix original drama stars Golden Globe-winning actress Winona Ryder as Joyce Byers, who lives in a small Indiana town in 1983 -- inspired by a time when tales of science fiction captivated audiences. ",
                                        image: #imageLiteral(resourceName: "strangerThings"))
    
    let tvShow2 = SegmentedControlModel(title: "Admiral Bulldog",
                                        description: "Henrik Ahnberg, better known as AdmiralBulldog, is a Swedish streamer and former professional Dota 2 player for Alliance, with whom he won The International 2013. Ahnberg has dedicated himself to streaming in Twitch TV, and is one of the most famous Dota2 Twitch steamers.",
                                        image: #imageLiteral(resourceName: "admiralBdog"))
    
    lazy var games = [game1, game2, game3]
    lazy var tvShows = [tvShow1, tvShow2]
    lazy var rowToDisplay = games
    
    let tvShowCellIdentifier = "TVShowCell"
    
    // MARK: UI Properties
    
    let customTableView: IntrinsicTableView = {
        let tableView = IntrinsicTableView()
        return tableView
    }()
    
    let normalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    let paddedStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.layoutMargins = .init(top: 0, left: 0, bottom: 3, right: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.isUserInteractionEnabled = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let customSegmentedControlView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let customSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.tintColor = .clear
        segmentedControl.backgroundColor = .clear
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18),
                                                 NSAttributedString.Key.foregroundColor: UIColor.lightGray],
                                                for: .normal)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18),
                                                 NSAttributedString.Key.foregroundColor: UIColor.red],
                                                for: .highlighted)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18),
                                                 NSAttributedString.Key.foregroundColor: UIColor.red],
                                                for: .selected)
        segmentedControl.addTarget(self, action: #selector(handleCustomSegmentChange), for: .valueChanged)
        return segmentedControl
    }()
    
    let segmentBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Segmented Table View"
        setupCustomView()
        setupCustomConstraints()
        registerCell()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setInitialSelectedSegment()
    }
    
    // MARK: Methods
    
    private func setupCustomView() {
        view.backgroundColor = .white
        view.addSubview(normalStackView)
        
        paddedStackView.addArrangedSubview(customSegmentedControlView)
        
        normalStackView.addArrangedSubview(paddedStackView)
        normalStackView.addArrangedSubview(customTableView)
        
        setupCustomSegmentedControlView()
        
        customTableView.dataSource = self
        customTableView.delegate = self
    }
    
    private func setupCustomSegmentedControlView() {
        customSegmentedControlView.addSubview(customSegmentedControl)
        customSegmentedControlView.addSubview(segmentBarView)
        
        customSegmentedControl.topAnchor.constraint(equalTo: customSegmentedControlView.topAnchor).isActive = true
        customSegmentedControl.widthAnchor.constraint(equalTo: customSegmentedControlView.widthAnchor).isActive = true
        customSegmentedControl.heightAnchor.constraint(equalTo: customSegmentedControlView.heightAnchor).isActive = true
        
        customSegmentedControl.insertSegment(withTitle: "One", at: 0, animated: true)
        customSegmentedControl.insertSegment(withTitle: "Two", at: 1, animated: true)
        
        segmentBarView.topAnchor.constraint(equalTo: customSegmentedControl.bottomAnchor).isActive = true
        segmentBarView.leftAnchor.constraint(equalTo: customSegmentedControl.leftAnchor).isActive = true
        segmentBarView.widthAnchor.constraint(equalTo: customSegmentedControl.widthAnchor,
                                              multiplier: 1 / CGFloat(customSegmentedControl.numberOfSegments)).isActive = true
        segmentBarView.heightAnchor.constraint(equalToConstant: 3).isActive = true
    }
    
    private func setupCustomConstraints() {
        normalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        normalStackView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        normalStackView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        paddedStackView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    @objc private func handleCustomSegmentChange() {
        let selectedSegmentIndex = customSegmentedControl.selectedSegmentIndex
        moveSegmentBarView(index: selectedSegmentIndex)
        reloadTableView(index: selectedSegmentIndex)
    }
    
    private func reloadTableView(index selectedSegmentIndex: Int) {
        switch selectedSegmentIndex {
        case 0:
            rowToDisplay = games
        case 1:
            rowToDisplay = tvShows
        default:
            rowToDisplay = games
            break
        }
        customTableView.reloadData()
    }
    
    private func moveSegmentBarView(index selectedSegmentIndex: Int) {
        let segmentControlWidth = customSegmentedControl.frame.width
        let numberOfSegments = customSegmentedControl.numberOfSegments
        
        UIView.animate(withDuration: 0.3) {
            self.segmentBarView.frame.origin.x = (segmentControlWidth / CGFloat(numberOfSegments)) * CGFloat(selectedSegmentIndex)
        }
    }
    
    private func registerCell() {
        customTableView.register(TVShowCell.self, forCellReuseIdentifier: tvShowCellIdentifier)
    }
    
    private func setInitialSelectedSegment() {
        let initialSegmentIndex = 1
        customSegmentedControl.selectedSegmentIndex = initialSegmentIndex
        moveSegmentBarView(index: initialSegmentIndex)
        reloadTableView(index: initialSegmentIndex)
    }
    
}

extension SkeletonLoadingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tvShowCellIdentifier,
                                                 for: indexPath) as! TVShowCell
        
        cell.cellImageView.image = rowToDisplay[indexPath.row].image
        cell.cellTitleLabel.text = rowToDisplay[indexPath.row].title
        cell.cellDescriptionLabel.text = rowToDisplay[indexPath.row].description
        return cell
    }
    
}

class IntrinsicTableView: UITableView {
    
    override var contentSize: CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
    
}

