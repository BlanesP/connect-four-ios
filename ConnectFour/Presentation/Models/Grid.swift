//
//  Grid.swift
//  ConnectFour
//
//  Created by Pau Blanes on 25/11/21.
//

import Foundation

struct Grid<T> {
    private var items: [[T]]
    
    init(with items: [[T]]) {
        self.items = items
    }
    
    init() {
        self.items = [[T]]()
    }
    
    mutating func addNewColumnItem(_ item: T, at columnIndex: Int) {
        items[columnIndex].append(item)
    }
    
    mutating func addNewColumn(with rows: [T]) {
        items.append(rows)
    }
    
    mutating func setValue(_ value: T, for slot: BoardPosition) {
        guard slot.column < items.count, slot.row < items[slot.column].count else { return }
        items[slot.column][slot.row] = value
    }
    
    func getValue(for slot: BoardPosition) -> T? {
        guard slot.column < items.count, slot.row < items[slot.column].count else { return nil }
        return items[slot.column][slot.row]
    }
    
    func getColumn(at columnIndex: Int) -> [T]? {
        guard columnIndex < items.count else { return nil }
        return items[columnIndex]
    }
}
