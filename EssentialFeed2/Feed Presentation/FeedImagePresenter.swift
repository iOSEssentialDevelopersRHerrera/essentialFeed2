//
//  FeedImagePresenter.swift
//  EssentialFeed2
//
//  Created by Ricardo Herrera Petit on 1/30/21.
//

import Foundation

public struct FeedImageViewModel<Image> {
   public let description: String?
    public  let location: String?
    public let image: Image?
    public let isLoading: Bool
    public let shouldRetry: Bool
}

public protocol FeedImageView {
    associatedtype Image
    func display(_ model: FeedImageViewModel<Image>)
}

public final class FeedImagePresenter<View: FeedImageView, Image> where View.Image == Image  {
    private let view: View
    private let imageTransformer: (Data) -> Image?
    
    public init(view: View, imageTransformer: @escaping (Data) -> Image?) {
        self.view = view
        self.imageTransformer = imageTransformer
    }
    
    public func didStartLoadingImageData(for model: FeedImage) {
        view.display(FeedImageViewModel(
            description: model.description,
            location: model.location,
            image: nil,
            isLoading: true,
            shouldRetry: false))
    }
    
    public func didFinishLoadingImageData(with data: Data, for model:FeedImage) {
        view.display(FeedImageViewModel(
            description: model.description,
            location: model.location,
            image: imageTransformer(data),
            isLoading: false,
            shouldRetry: true))
    }
    
    public func didFinishLoadingImageData(with error: Error, for model: FeedImage) {
        view.display(FeedImageViewModel(
            description: model.description,
            location: model.location,
            image: nil,
            isLoading: false,
            shouldRetry: true))
    }
}