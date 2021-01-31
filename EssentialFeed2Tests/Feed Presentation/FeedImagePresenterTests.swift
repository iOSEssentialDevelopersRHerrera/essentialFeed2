//
//  FeedImagePresenterTests.swift
//  EssentialFeed2Tests
//
//  Created by Ricardo Herrera Petit on 1/30/21.
//

import XCTest
import EssentialFeed2



struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool
    
    var hasLocation: Bool {
        return location != nil
    }
}

protocol FeedImageView {
    associatedtype Image
    func display(_ model: FeedImageViewModel<Image>)
}

final class FeedImagePresenter<View: FeedImageView, Image> where View.Image == Image  {
    private let view: View
    private let imageTransformer: (Data) -> Image?
    
    init(view: View, imageTransformer: @escaping (Data) -> Image?) {
        self.view = view
        self.imageTransformer = imageTransformer
    }
    func didStartLoadingImageData(for model: FeedImage) {
        view.display(FeedImageViewModel(
            description: model.description,
            location: model.location,
            image: nil,
            isLoading: true,
            shouldRetry: false))
    }
    
    func didFinishLoadingImageData(with data: Data, for model:FeedImage) {
        view.display(FeedImageViewModel(
            description: model.description,
            location: model.location,
            image: imageTransformer(data),
            isLoading: false,
            shouldRetry: true))
    }
}


class FeedImagePresenterTests: XCTestCase {
    func test_init_doesNotSendsMessagesToView() {
        
        let (_, view ) = makeSUT()
        
        XCTAssertTrue(view.messages.isEmpty, "Feed Image Presneter does not send messages to the view")
    }
    
  
    
    func test_didFinishLoadingImageData_displaysRetryOnFailedImageTransformation() {
            let (sut, view) = makeSUT(imageTransformer: fail)
            let image = uniqueImage()
            let data = Data()
            
            sut.didFinishLoadingImageData(with: data, for: image)
            
            let message = view.messages.first
            XCTAssertEqual(view.messages.count, 1)
            XCTAssertEqual(message?.description, image.description)
            XCTAssertEqual(message?.location, image.location)
            XCTAssertEqual(message?.isLoading, false)
            XCTAssertEqual(message?.shouldRetry, true)
            XCTAssertNil(message?.image)
        }
    
    func test_didFinishLoadingImageData_displaysImageOnSuccessfulTransformation() {
            
            let image = uniqueImage()
            let data = Data()
            let transformedData = AnyImage()
            let (sut, view) = makeSUT(imageTransformer: { _ in transformedData})
            
            sut.didFinishLoadingImageData(with: data, for: image)
            
            let message = view.messages.first
            XCTAssertEqual(view.messages.count, 1)
            XCTAssertEqual(message?.description, image.description)
            XCTAssertEqual(message?.location, image.location)
            XCTAssertEqual(message?.isLoading, false)
            XCTAssertEqual(message?.shouldRetry, true)
            XCTAssertEqual(message?.image, transformedData)
        }
    
    //MARK: - Helpers

    private func makeSUT(imageTransformer: @escaping (Data) -> AnyImage? = { _ in nil}, file: StaticString = #filePath, line: UInt = #line) -> (sut: FeedImagePresenter<ViewSpy, AnyImage>, view: ViewSpy) {
        let view = ViewSpy()
        let sut = FeedImagePresenter(view: view, imageTransformer: imageTransformer)
        trackForMemoryLeaks(sut, file: file, line: line)
        trackForMemoryLeaks(view, file: file, line: line)
        return (sut, view)
       
    }
    
    private class ViewSpy: FeedImageView {
        enum Message: Equatable {
            case display(description: String?)
        }
        
        var messages = [FeedImageViewModel<AnyImage>]()
        
        func display(_ model: FeedImageViewModel<AnyImage>) {
            messages.append(model)
        }
        
    }
    
    private struct AnyImage: Equatable {}
    
    private var fail: (Data) -> AnyImage? {
        return { _ in nil }
    }
   
}






