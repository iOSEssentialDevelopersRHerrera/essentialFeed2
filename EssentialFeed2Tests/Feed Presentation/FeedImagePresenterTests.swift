//
//  FeedImagePresenterTests.swift
//  EssentialFeed2Tests
//
//  Created by Ricardo Herrera Petit on 1/30/21.
//

import XCTest
import EssentialFeed2

class FeedImagePresenterTests: XCTestCase {
    func test_init_doesNotSendsMessagesToView() {
        
        let (_, view ) = makeSUT()
        
        XCTAssertTrue(view.messages.isEmpty, "Feed Image Presneter does not send messages to the view")
    }
    
  
    
    func test_didFinishLoadingImageData_displaysRetryOnFailedImageTransformation() {
            let (sut, view) = makeSUT(imageTransformer: fail)
            let image = uniqueImage()
            
            sut.didFinishLoadingImageData(with: Data(), for: image)
            
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
            let (sut, view) = makeSUT()
            
            sut.didFinishLoadingImageData(with: anyNSError(), for: image)
            
            let message = view.messages.first
            XCTAssertEqual(view.messages.count, 1)
            XCTAssertEqual(message?.description, image.description)
            XCTAssertEqual(message?.location, image.location)
            XCTAssertEqual(message?.isLoading, false)
            XCTAssertEqual(message?.shouldRetry, true)
            XCTAssertNil(message?.image)
        }
    
    func test_didFinishLoadingImageDataWithError_displaysRetry() {
            
            let image = uniqueImage()
            let transformedData = AnyImage()
            let (sut, view) = makeSUT(imageTransformer: { _ in transformedData})
            
            sut.didFinishLoadingImageData(with: Data(), for: image)
            
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






