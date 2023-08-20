//
//  ReviseWordViewModel.swift
//  QRevise_English
//
//  Created by quang.duong on 20/08/2023.
//

import Foundation

class ReviseWordViewModel: ViewModelType {
    private var router: Router<LearningRoute>?
    
    init(router: Router<LearningRoute>?) {
        self.router = router
    }
}
