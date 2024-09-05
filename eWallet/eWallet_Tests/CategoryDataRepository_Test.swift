//
//  CategoryDataRepository_Test.swift
//  eWallet_Tests
//
//  Created by Habibur Rahman on 4/9/24.
//

@testable import eWallet
import Foundation
import XCTest

final class CategoryDataRepository_Test: XCTestCase {

    let manager = CoreDataManager.instance
    let categoryRepo = CategoryDataRepository.shared(categoryRepo:  CDCategoryRepository())
    let categoryUtils = CategoryUtility()
    
    override func setUpWithError() throws {
        manager.deleteFullDB()
    }
    
    
    func test_addCategory_WillReturnCorrectNumberOfCategoryList(){
        _ = addCategoryInDB(categoryData: categoryUtils.catagory1)
        XCTAssertEqual(getCategoryList().count, 1)
        
        _ = addCategoryInDB(categoryData: categoryUtils.catagory2)
        XCTAssertEqual(getCategoryList().count, 2)
        
        _ = addCategoryInDB(categoryData: categoryUtils.catagory3)
        XCTAssertEqual(getCategoryList().count, 3)
    }
    
    
    func test_getCategoryEntityById_WillReturnCorrectCategoryId(){
        let category = categoryUtils.catagory1
        _ = addCategoryInDB(categoryData: category)
        let fetchedCategory = getCategory(id: category.id)
        XCTAssertEqual(fetchedCategory?.id, category.id)
        XCTAssertEqual(fetchedCategory?.convertToCategory().id, category.id)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    // Healper

    func addCategoryInDB(categoryData : CategoryData) -> Bool{
        return categoryRepo.addCategory(categoryData: categoryData)
    }
    
    func getCategory(id : String) -> CategoryEntity? {
        return categoryRepo.getCategoryEntityFromId(id: id)
    }
    
    func getCategoryList() -> [CategoryData] {
        return categoryRepo.getCategories()
    }

}
