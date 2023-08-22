//
//  FakeData.swift
//  QRevise_Vocabulary
//
//  Created by quang.duong on 22/08/2023.
//

import Foundation

struct ListItem {
    let title: String
    let url: String
}

enum ListSection {
    case wordType([ListItem])
    case history([ListItem])
    
    var items: [ListItem] {
        switch self {
        case .history(let items),
                .wordType(let items):
            return items
        }
    }
    
    var count: Int {
        return items.count
    }
    
    var title: String {
        switch self {
        case .history:
            return "Your history"
        case .wordType:
            return "Your categories"
        }
    }
}

struct MockData {
    static let shared = MockData()
    
    private let wordType: ListSection = {
        .wordType([.init(title: "", url: "https://img.freepik.com/free-photo/purple-osteospermum-daisy-flower_1373-16.jpg?w=2000"),
                   .init(title: "", url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOfSku1nxN5AEsMJosIRzQewJefbCBR-7pEwk-yI2sNjT5m1fFbdOdWm6regG8Dj5159E&usqp=CAU"),
                   .init(title: "", url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSq_PgLPmVETbnj6Y6UEgzIyYw81BnmkeWPxHgd7FRDNYQGZODkFmS-_ZVYxkKRfpQqBHY&usqp=CAU"),
                   .init(title: "", url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZDWoVELmILPAtDQpM8fGsTwhZJ1l_50wlRN3mzk3cmwbyUXWSpFfYZM2t4gJNBgz7CwI&usqp=CAU"),
                   .init(title: "", url: "https://static.pexels.com/photos/36753/flower-purple-lical-blosso.jpg"),
                   .init(title: "", url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbe9-gXjhFwuFbX4SHADn_tYFBKxY72y1mKpGjmBiENcw9NytpaSAGxsMS5SULtDSFvgs&usqp=CAU")])
        
    }()
    
    private let history: ListSection = {
        .history([.init(title: "", url: "https://img.freepik.com/free-photo/purple-osteospermum-daisy-flower_1373-16.jpg?w=2000"),
                   .init(title: "", url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOfSku1nxN5AEsMJosIRzQewJefbCBR-7pEwk-yI2sNjT5m1fFbdOdWm6regG8Dj5159E&usqp=CAU"),
                   .init(title: "", url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSq_PgLPmVETbnj6Y6UEgzIyYw81BnmkeWPxHgd7FRDNYQGZODkFmS-_ZVYxkKRfpQqBHY&usqp=CAU"),
                   .init(title: "", url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZDWoVELmILPAtDQpM8fGsTwhZJ1l_50wlRN3mzk3cmwbyUXWSpFfYZM2t4gJNBgz7CwI&usqp=CAU"),
                   .init(title: "", url: "https://static.pexels.com/photos/36753/flower-purple-lical-blosso.jpg"),
                   .init(title: "", url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbe9-gXjhFwuFbX4SHADn_tYFBKxY72y1mKpGjmBiENcw9NytpaSAGxsMS5SULtDSFvgs&usqp=CAU")])
    }()
    
    var pageData: [ListSection] {
        [wordType, history]
    }
    
}
