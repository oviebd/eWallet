//
//  AllRecordsVM.swift
//  eWallet
//
//  Created by Habibur Rahman on 1/9/24.
//

import Combine
import Foundation

class AllRecordsVM: ObservableObject {
    var recordRepo: RecordDataRepository
    @Published var recordsList: [RecordData] = [RecordData]()

    @Published var recordListByDateData: RecordListByDateData = RecordListByDateData()

    @Published var filteredData: RecordFilterData = RecordFilterData()

    @Published var goRecordScreen: Bool = false
    @Published var selectedRecordData: RecordData?

    @Published var searchText: String = ""
    private var cancellables = Set<AnyCancellable>()

    init() {
        recordRepo = RecordDataRepository.shared(recordRepo: CDRecordRepository())

        recordRepo.$isRecordDbChanged.sink { _ in
            DispatchQueue.main.async {
                self.fetchDataFrom(filterData: self.filteredData)
            }
            
        }.store(in: &cancellables)

        $searchText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink { [weak self] _ in
                if self?.searchText.isEmptyString() == false {
                    self?.filteredData.searchText = self?.searchText
                } else {
                    self?.filteredData.searchText = nil
                }
            }
            .store(in: &cancellables)

        $filteredData.sink { [weak self] value in
            DispatchQueue.main.async {
                self?.fetchDataFrom(filterData: value)
            }
        }.store(in: &cancellables)
    }

    private func fetchDataFrom(filterData: RecordFilterData) {
        recordsList = recordRepo.getFilteredDatas(recordFilterData: filterData)
        recordListByDateData.prepareDatas(datas: recordsList)
    }

    deinit {
        cancellables.removeAll()
    }
}
