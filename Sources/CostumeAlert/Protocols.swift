//
//  Protocols.swift
//  CostumeAlert
//
//  Created by Miguel Carlos Elizondo Martinez on 27/04/25.
//
import SwiftUI


public protocol AlertViewProtocol {
    var title: String { get }
    var image: Image? { get }
    var description: String { get }
    var titleFont: Font { get }
    var descriptionFont: Font { get }
    var textAlignment: TextAlignment { get }
    var minimumScaleFactor: CGFloat { get }
    var lineLimit: Int? { get }
    var backgroundColor: Color { get }
    var titleColor: Color { get }
    var descriptionColor: Color { get }
    var shadowRadius: CGFloat { get }
    var spacer: CGFloat { get }
    var verticalorhorizontal: Bool { get }
    var clipshape: AnyShape { get }
    var imageMaxWidth: CGFloat { get }
    var imageMaxHeight: CGFloat { get }
}

public protocol ButtonAlertProtocol {
    var title: String { get }
    var action: () -> Void { get }
    var font: Font { get }
    var lineLimit: Int? { get }
    var minimumScaleFactor: CGFloat { get }
    var backgroundColor: Color { get }
    var titleColor: Color { get }
    var clipShape: AnyShape { get }
    var padding: CGFloat { get }
}


