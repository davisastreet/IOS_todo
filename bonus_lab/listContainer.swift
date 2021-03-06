//
//  listContainer.swift
//  bonus_lab
//
//  Created by davis street on 3/28/22.
//

import Foundation
import SwiftUI
import Combine

struct Task : Identifiable, Codable
{
    var id = String()
    var taskItem = String()
}

class storeTask : ObservableObject, Codable
{
    @Published var tasks = [Task]()
}
