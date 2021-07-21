//
//  TextAddViewModel.swift
//  Demo1
//
//  Created by Hoang Anh Tuan on 21/07/2021.
//

import Foundation

class TextAddViewModel {
    
    func addText(text: String) {
        UseCaseModule.saveOrUpdateTextUseCase.execute(param: SaveOrUpdateTextUseCase.Param(text: text))
    }
}
