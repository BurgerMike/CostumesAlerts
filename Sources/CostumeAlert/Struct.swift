//
//  Struct.swift
//  CostumeAlert
//
//  Created by Miguel Carlos Elizondo Martinez on 27/04/25.
//

import AVFoundation
import SwiftUI

public struct AlertsCostume: View, AlertViewProtocol {
    public var title: String
    public var image: Image?
    public var description: String
    public var titleFont: Font
    public var descriptionFont: Font
    public var textAlignment: TextAlignment
    public var minimumScaleFactor: CGFloat
    public var lineLimit: Int?
    public var backgroundColor: Color
    public var titleColor: Color
    public var descriptionColor: Color
    public var shadowRadius: CGFloat
    public var buttons: [CustomAlertButton]
    public var spacer: CGFloat
    public var verticalorhorizontal: Bool
    public var clipshape: AnyShape
    public var imageMaxWidth: CGFloat
    public var imageMaxHeight: CGFloat

    public init(
        title: String,
        image: Image?,
        description: String,
        titleFont: Font = .headline,
        descriptionFont: Font = .body,
        textAlignment: TextAlignment = .center,
        minimumScaleFactor: CGFloat = 0.7,
        lineLimit: Int? = nil,
        backgroundColor: Color = .white,
        titleColor: Color = .black,
        descriptionColor: Color = .gray,
        shadowRadius: CGFloat = 10,
        buttons: [CustomAlertButton],
        spacer: CGFloat,
        verticalorhorizontal: Bool,
        clipshape: AnyShape,
        imageMaxWidth: CGFloat = 100,
        imageMaxHeight: CGFloat = 100
    ) {
        self.title = title
        self.image = image
        self.description = description
        self.titleFont = titleFont
        self.descriptionFont = descriptionFont
        self.textAlignment = textAlignment
        self.minimumScaleFactor = minimumScaleFactor
        self.lineLimit = lineLimit
        self.backgroundColor = backgroundColor
        self.titleColor = titleColor
        self.descriptionColor = descriptionColor
        self.shadowRadius = shadowRadius
        self.buttons = buttons
        self.spacer = spacer
        self.verticalorhorizontal = verticalorhorizontal
        self.clipshape = clipshape
        self.imageMaxWidth = imageMaxWidth
        self.imageMaxHeight = imageMaxHeight
    }

    public var body: some View {
        VStack(spacing: spacer) {
            Text(title)
                .font(titleFont)
                .multilineTextAlignment(textAlignment)
                .minimumScaleFactor(minimumScaleFactor)
                .lineLimit(lineLimit)
                .foregroundColor(titleColor)
            
            if let image = image {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: imageMaxWidth, height: imageMaxHeight)
            }
            Text(description)
                .font(descriptionFont)
                .multilineTextAlignment(textAlignment)
                .minimumScaleFactor(minimumScaleFactor)
                .lineLimit(lineLimit)
                .foregroundColor(descriptionColor)

            if verticalorhorizontal {
                HStack {
                    ForEach(buttons) { button in
                        Button(button.title) {
                            button.action()
                        }
                        .buttonStyle(.plain)
                        .font(button.font)
                        .lineLimit(button.lineLimit)
                        .minimumScaleFactor(button.minimumScaleFactor)
                        .frame(maxWidth: .infinity)
                        .padding(button.padding)
                        .background(button.backgroundColor)
                        .foregroundColor(button.titleColor)
                        .clipShape(button.clipShape)
                    }
                }
            } else {
                VStack {
                    ForEach(buttons) { button in
                        Button(button.title) {
                            button.action()
                        }
                        .buttonStyle(.plain)
                        .font(button.font)
                        .lineLimit(button.lineLimit)
                        .minimumScaleFactor(button.minimumScaleFactor)
                        .frame(maxWidth: .infinity)
                        .padding(button.padding)
                        .background(button.backgroundColor)
                        .foregroundColor(button.titleColor)
                        .clipShape(button.clipShape)
                    }
                }
            }
        }
        .padding()
        .background(backgroundColor)
        .clipShape(clipshape)
        .shadow(radius: shadowRadius)
        .padding()
    }
}

#Preview {
    AlertsCostume(
        title: "Alerta Personalizada",
        image: Image(systemName: "faceid"),
          
        description: "Esta imagen es totalmente personalizada.",
        buttons: [
            CustomAlertButton(title: "OK", action: { print("OK") })
        ],
        spacer: 12,
        verticalorhorizontal: false,
        clipshape: AnyShape(RoundedRectangle(cornerRadius: 20))
    )
}

public struct CustomAlertButton: ButtonAlertProtocol, Identifiable {
    public let id = UUID()
    public let title: String
    public let action: () -> Void
    public let font: Font
    public let lineLimit: Int?
    public let minimumScaleFactor: CGFloat
    public let backgroundColor: Color
    public let titleColor: Color
    public let clipShape: AnyShape
    public let padding: CGFloat

    public init(
        title: String,
        action: @escaping () -> Void,
        font: Font = .body,
        lineLimit: Int? = 1,
        minimumScaleFactor: CGFloat = 0.7,
        backgroundColor: Color = .blue,
        titleColor: Color = .white,
        clipShape: AnyShape = AnyShape(RoundedRectangle(cornerRadius: 12)),
        padding: CGFloat = 12
    ) {
        self.title = title
        self.action = action
        self.font = font
        self.lineLimit = lineLimit
        self.minimumScaleFactor = minimumScaleFactor
        self.backgroundColor = backgroundColor
        self.titleColor = titleColor
        self.clipShape = clipShape
        self.padding = padding
    }
}
